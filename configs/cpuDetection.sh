# CPU Detection - Begin
detectcpu () {
	REGEXP="-r"
	if [ "$distro" == "Mac OS X" ]; then
		cpu=$(machine)
		if [[ $cpu == "ppc750" ]]; then
			cpu="IBM PowerPC G3"
		elif [[ $cpu == "ppc7400" || $cpu == "ppc7450" ]]; then
			cpu="IBM PowerPC G4"
		elif [[ $cpu == "ppc970" ]]; then
			cpu="IBM PowerPC G5"
		else
			cpu=$(sysctl -n machdep.cpu.brand_string)
		fi
		REGEXP="-E"
	elif [ "$OSTYPE" == "gnu" ]; then
		# no /proc/cpuinfo on GNU/Hurd
		if [ "$(uname -m | grep 'i.86')" ]; then
			cpu="Unknown x86"
		else
			cpu="Unknown"
		fi
	elif [ "$distro" == "FreeBSD" ]; then
		cpu=$(dmesg | grep 'CPU:' | head -n 1 | sed -r 's/CPU: //' | sed -e 's/([^()]*)//g')
	elif [ "$distro" == "DragonFlyBSD" ]; then
		cpu=$(sysctl -n hw.model)
	elif [ "$distro" == "OpenBSD" ]; then
		cpu=$(sysctl -n hw.model | sed 's/@.*//')
	elif [ "$distro" == "Haiku" ]; then
		cpu=$(sysinfo -cpu | grep 'CPU #0' | cut -d'"' -f2 | awk 'BEGIN{FS=" @"; OFS="\n"} { print $1; exit }')
		cpu_mhz=$(sysinfo -cpu | grep 'running at' | awk 'BEGIN{FS="running at "} { print $2; exit }' | cut -d'M' -f1)
		if [ $(echo $cpu_mhz) -gt 999 ]; then
			cpu_ghz=$(awk '{print $1/1000}' <<< "${cpu_mhz}")
			cpufreq="${cpu_ghz}GHz"
		else
			cpufreq="${cpu_mhz}MHz"
		fi
	else
		cpu=$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | awk 'BEGIN{FS=" @"; OFS="\n"} { print $1; exit }')
		cpun=$(grep -c '^processor' /proc/cpuinfo)
		if [ -z "$cpu" ]; then
			cpu=$(awk 'BEGIN{FS=":"} /Hardware/ { print $2; exit }' /proc/cpuinfo)
		fi
		if [ -z "$cpu" ]; then
			cpu=$(awk 'BEGIN{FS=":"} /^cpu/ { gsub(/  +/," ",$2); print $2; exit}' /proc/cpuinfo | sed 's/, altivec supported//;s/^ //')
			if [[ $cpu =~ ^(PPC)*9.+ ]]; then
				model="IBM PowerPC G5 "
			elif [[ $cpu =~ 740/750 ]]; then
				model="IBM PowerPC G3 "
			elif [[ $cpu =~ ^74.+ ]]; then
				model="Motorola PowerPC G4 "
			elif [[ $cpu =~ ^POWER.* ]]; then
				model="IBM POWER "
			elif [[ "$(cat /proc/cpuinfo)" =~ "BCM2708" ]]; then
				model="Broadcom BCM2835 ARM1176JZF-S"
			else
				arch=$(uname -m)
				if [ "$arch" = "s390x" ] || [ "$arch" = "s390" ]; then
					cpu=""
					args=$(grep 'machine' /proc/cpuinfo | sed 's/^.*://g; s/ //g; s/,/\n/g' | grep '^machine=.*')
					eval $args
					case "$machine" in
						# information taken from https://github.com/SUSE/s390-tools/blob/master/cputype
						2064) model="IBM eServer zSeries 900" ;;
						2066) model="IBM eServer zSeries 800" ;;
						2084) model="IBM eServer zSeries 990" ;;
						2086) model="IBM eServer zSeries 890" ;;
						2094) model="IBM System z9 Enterprise Class" ;;
						2096) model="IBM System z9 Business Class" ;;
						2097) model="IBM System z10 Enterprise Class" ;;
						2098) model="IBM System z10 Business Class" ;;
						2817) model="IBM zEnterprise 196" ;;
						2818) model="IBM zEnterprise 114" ;;
						2827) model="IBM zEnterprise EC12" ;;
						2828) model="IBM zEnterprise BC12" ;;
						2964) model="IBM z13" ;;
						*) model="IBM S/390 machine type $machine" ;;
					esac
				else
					model="Unknown"
				fi
			fi
			cpu="${model}${cpu}"
		fi
		loc="/sys/devices/system/cpu/cpu0/cpufreq"
		bl="${loc}/bios_limit"
		smf="${loc}/scaling_max_freq"
		if [ -f "$bl" ] && [ -r "$bl" ]; then
			cpu_mhz=$(awk '{print $1/1000}' "$bl")
		elif [ -f "$smf" ] && [ -r "$smf" ]; then
			cpu_mhz=$(awk '{print $1/1000}' "$smf")
		else
			cpu_mhz=$(awk -F':' '/cpu MHz/{ print int($2+.5) }' /proc/cpuinfo | head -n 1)
		fi
		if [ -n "$cpu_mhz" ]; then
			if [ $(echo $cpu_mhz | cut -d. -f1) -gt 999 ]; then
				cpu_ghz=$(awk '{print $1/1000}' <<< "${cpu_mhz}")
				cpufreq="${cpu_ghz}GHz"
			else
				cpufreq="${cpu_mhz}MHz"
			fi
		fi
	fi
	if [[ "${cpun}" -gt "1" ]]; then
		cpun="${cpun}x "
	else
		cpun=""
	fi
	if [ -z "$cpufreq" ]; then
		cpu="${cpun}${cpu}"
	else
		cpu="$cpu @ ${cpun}${cpufreq}"
	fi
	if [ -d '/sys/class/hwmon/' ]; then
		for dir in `echo $(ls /sys/class/hwmon/)`
		do
			if cat /sys/class/hwmon/$dir/name | grep coretemp > /dev/null
			then
				thermal="/sys/class/hwmon/$dir/temp1_input"
				break
			fi
		done
		if [ -e $thermal ] && [ "${thermal:+isSetToNonNull}" = 'isSetToNonNull' ]; then
			temperature=$(bc <<< "scale=1; $(cat $thermal)/1000")
		fi
	fi
	if [ -n "$temperature" ]; then
		cpu="$cpu [${temperature}°C]"
	fi
	cpu=$(sed $REGEXP 's/\([tT][mM]\)|\([Rr]\)|[pP]rocessor|CPU//g' <<< "${cpu}" | xargs)
	verboseOut "Finding current CPU...found as '$cpu'"
}
# CPU Detection - End
