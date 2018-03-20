# Disk Usage Detection - Begin
detectdisk () {
	diskusage="Unknown"
	if type -p df >/dev/null 2>&1; then
		if [[ "${distro}" =~ (Free|Net|Open|DragonFly)BSD ]]; then
			totaldisk=$(df -h -c 2>/dev/null | tail -1)
		elif [[ "${distro}" == "Mac OS X" ]]; then
			totaldisk=$(df -H / 2>/dev/null | tail -1)
		else
			totaldisk=$(df -h -x aufs -x tmpfs --total 2>/dev/null | tail -1)
		fi
		disktotal=$(awk '{print $2}' <<< "${totaldisk}")
		diskused=$(awk '{print $3}' <<< "${totaldisk}")
		diskusedper=$(awk '{print $5}' <<< "${totaldisk}")
		diskusage="${diskused} / ${disktotal} (${diskusedper})"
		diskusage_verbose=$(sed 's/%/%%/' <<< $diskusage)
	fi
	verboseOut "Finding current disk usage...found as '$diskusage_verbose'"
}
# Disk Usage Detection - End


# Memory Detection - Begin
detectmem () {
	if [ "$distro" == "Mac OS X" ]; then
		totalmem=$(echo "$(sysctl -n hw.memsize)" / 1024^2 | bc)
		wiredmem=$(vm_stat | grep wired | awk '{ print $4 }' | sed 's/\.//')
		activemem=$(vm_stat | grep ' active' | awk '{ print $3 }' | sed 's/\.//')
		compressedmem=$(vm_stat | grep occupied | awk '{ print $5 }' | sed 's/\.//')
		if [[ ! -z "$compressedmem | tr -d" ]]; then
			compressedmem=0
		fi
		usedmem=$(((${wiredmem} + ${activemem} + ${compressedmem}) * 4 / 1024))
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		total_mem=$(awk '/MemTotal/ { print $2 }' /proc/meminfo)
		totalmem=$((${total_mem} / 1024))
		free_mem=$(awk '/MemFree/ { print $2 }' /proc/meminfo)
		used_mem=$((${total_mem} - ${free_mem}))
		usedmem=$((${used_mem} / 1024))
	elif [[ "$distro" == "FreeBSD"  || "$distro" == "DragonFlyBSD" ]]; then
		phys_mem=$(sysctl -n hw.physmem)
		size_mem=$phys_mem
		size_chip=1
		guess_chip=`echo "$size_mem / 8 - 1" | bc`
		while [ $guess_chip != 0 ]; do
			guess_chip=`echo "$guess_chip / 2" | bc`
			size_chip=`echo "$size_chip * 2" | bc`
		done
		round_mem=`echo "( $size_mem / $size_chip + 1 ) * $size_chip " | bc`
		totalmem=$(($round_mem / 1024^2 ))
		pagesize=$(sysctl -n hw.pagesize)
		inactive_count=$(sysctl -n vm.stats.vm.v_inactive_count)
		inactive_mem=$(($inactive_count * $pagesize))
		cache_count=$(sysctl -n vm.stats.vm.v_cache_count)
		cache_mem=$(($cache_count * $pagesize))
		free_count=$(sysctl -n vm.stats.vm.v_free_count)
		free_mem=$(($free_count * $pagesize))
		avail_mem=$(($inactive_mem + $cache_mem + $free_mem))
		used_mem=$(($round_mem - $avail_mem))
		usedmem=$(($used_mem / 1024^2 ))
	elif [ "$distro" == "OpenBSD" ]; then
		totalmem=$(($(sysctl -n hw.physmem) / 1024 / 1024))
		usedmem=$(vmstat | awk '!/[a-z]/{gsub("M",""); print $3}')
	elif [ "$distro" == "NetBSD" ]; then
		phys_mem=$(awk '/MemTotal/ { print $2 }' /proc/meminfo)
		totalmem=$((${phys_mem} / 1024))
		if grep -q 'Cached' /proc/meminfo; then
			cache=$(awk '/Cached/ {print $2}' /proc/meminfo)
			usedmem=$((${cache} / 1024))
		else
			free_mem=$(awk '/MemFree/ { print $2 }' /proc/meminfo)
			used_mem=$((${phys_mem} - ${free_mem}))
			usedmem=$((${used_mem} / 1024))
		fi
	elif [ "$distro" == "Haiku" ]; then
		totalmem=$(( $(sysinfo -mem | head -n1 | cut -d'/' -f3 | tr -d ' ' | tr -d ')') / 1024^2 ))
		usedmem=$(( $(sysinfo -mem | head -n1 | cut -d'/' -f2 | sed 's/max//; s/ //g') / 1024^2 ))
	else
		# MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
		# Source: https://github.com/dylanaraps/neofetch/pull/391/files#diff-e863270127ca6116fd30e708cdc582fc
		mem_info=$(</proc/meminfo)
		mem_info=$(echo $(echo $(mem_info=${mem_info// /}; echo ${mem_info//kB/})))
		for m in $mem_info; do
			case ${m//:*} in
				"MemTotal") usedmem=$((usedmem+=${m//*:})); totalmem=${m//*:} ;;
				"Shmem") usedmem=$((usedmem+=${m//*:})) ;;
				"MemFree"|"Buffers"|"Cached"|"SReclaimable") usedmem=$((usedmem-=${m//*:})) ;;
			esac
		done
		usedmem=$((usedmem / 1024))
		totalmem=$((totalmem / 1024))
	fi
	mem="${usedmem}MiB / ${totalmem}MiB"
	verboseOut "Finding current RAM usage...found as '$mem'"
}
# Memory Detection - End

