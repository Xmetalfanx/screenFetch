
# Host and User detection - Begin
detecthost () {
	myUser=${USER}
	myHost=${HOSTNAME}
	if [[ -z "$USER" ]]; then myUser=$(whoami); fi
	if [[ "${distro}" == "Mac OS X" ]]; then myHost=${myHost/.local}; fi
	verboseOut "Finding hostname and user...found as '${myUser}@${myHost}'"
}

# Find Number of Running Processes
# processnum="$(( $( ps aux | wc -l ) - 1 ))"

# Kernel Version Detection - Begin
detectkernel () {
	if [[ "$distro" == "OpenBSD" ]]; then
		kernel=$(sysctl kern.version|awk -F'[ =:]' 'NR==1{print $3" "$4" "$5}')
	else
		# compatibility for older versions of OS X:
		kernel=$(uname -m && uname -sr)
		kernel=${kernel//$'\n'/ }
		#kernel=( $(uname -srm) )
		#kernel="${kernel[${#kernel[@]}-1]} ${kernel[@]:0:${#kernel[@]}-1}"
		verboseOut "Finding kernel version...found as '${kernel}'"
	fi
}
# Kernel Version Detection - End


# Uptime Detection - Begin
detectuptime () {
	unset uptime
	if [[ "${distro}" == "Mac OS X" || "${distro}" == "FreeBSD" || "${distro}" == "DragonFlyBSD" ]]; then
		boot=$(sysctl -n kern.boottime | cut -d "=" -f 2 | cut -d "," -f 1)
		now=$(date +%s)
		uptime=$(($now-$boot))
	elif [[ "${distro}" == "OpenBSD" ]]; then
		boot=$(sysctl -n kern.boottime)
		now=$(date +%s)
		uptime=$((${now} - ${boot}))
	elif [[ "${distro}" == "Haiku" ]]; then
		uptime=$(uptime | cut -d ',' -f2,3 | sed 's/ up //; s/ hour,/h/; s/ minutes/m/;')
	else
		if [[ -f /proc/uptime ]]; then
			uptime=$(</proc/uptime)
			uptime=${uptime//.*}
		fi
	fi

	if [[ -n ${uptime} ]] && [[ "${distro}" != "Haiku" ]]; then
		secs=$((${uptime}%60))
		mins=$((${uptime}/60%60))
		hours=$((${uptime}/3600%24))
		days=$((${uptime}/86400))
		uptime="${mins}m"
		if [ "${hours}" -ne "0" ]; then
			uptime="${hours}h ${uptime}"
		fi
		if [ "${days}" -ne "0" ]; then
			uptime="${days}d ${uptime}"
		fi
	else
		if [[ "$distro" =~ "NetBSD" ]]; then uptime=$(awk -F. '{print $1}' /proc/uptime); fi
		if [[ "$distro" =~ "BSD" ]]; then uptime=$(uptime | awk '{$1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; sub(" days","d");sub(",","");sub(":","h ");sub(",","m"); print}'); fi
	fi
	verboseOut "Finding current uptime...found as '${uptime}'"
}
# Uptime Detection - End

