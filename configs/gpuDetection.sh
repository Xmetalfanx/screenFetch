
# GPU Detection - Begin (EXPERIMENTAL!)
detectgpu () {
	if [[ "${distro}" == "FreeBSD" || "${distro}" == "DragonFlyBSD" ]]; then
		nvisettexist=$(which nvidia-settings)
		if [ -x "$nvisettexist" ]; then
			gpu="$(nvidia-settings -t -q gpus | grep \( | sed 's/.*(\(.*\))/\1/')"
		else
			gpu_info=$(pciconf -lv 2> /dev/null | grep -B 4 VGA)
			gpu_info=$(grep -E 'device.*=.*' <<< "${gpu_info}")
			gpu="${gpu_info##*device*= }"
			gpu="${gpu//\'}"
			# gpu=$(sed 's/.*device.*= //' <<< "${gpu_info}" | sed "s/'//g")
		fi
	elif [[ "${distro}" == "OpenBSD" ]]; then
		gpu=$(glxinfo 2> /dev/null | grep 'OpenGL renderer string' | sed 's/OpenGL renderer string: //')
	elif [[ "${distro}" == "Mac OS X" ]]; then
		gpu=$(system_profiler SPDisplaysDataType | awk -F': ' '/^\ *Chipset Model:/ {print $2}' | awk '{ printf "%s / ", $0 }' | sed -e 's/\/ $//g')
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		gpu=$(wmic path Win32_VideoController get caption | sed -n '2p')
	elif [[ "${distro}" == "Haiku" ]]; then
		gpu="$(listdev | grep -A2 -e 'device Display controller' | tail -n1 | sed 's/  device ....: //')"
	else
		if [[ -n "$(PATH="/opt/bin:$PATH" type -p nvidia-smi)" ]]; then
			gpu=$($(PATH="/opt/bin:$PATH" type -p nvidia-smi | cut -f1) -q | awk -F':' '/Product Name/ {gsub(/: /,":"); print $2}' | sed ':a;N;$!ba;s/\n/, /g')
		elif [[ -n "$(PATH="/usr/sbin:$PATH" type -p glxinfo)" && -z "${gpu}" ]]; then
			gpu_info=$($(PATH="/usr/sbin:$PATH" type -p glxinfo | cut -f1) 2>/dev/null)
			gpu=$(grep "OpenGL renderer string" <<< "${gpu_info}" | cut -d ':' -f2 | sed -n '1h;2,$H;${g;s/\n/,/g;p}')
			gpu="${gpu:1}"
			gpu_info=$(grep "OpenGL vendor string" <<< "${gpu_info}")
		elif [[ -n "$(PATH="/usr/sbin:$PATH" type -p lspci)" && -z "$gpu" ]]; then
			gpu_info=$($(PATH="/usr/bin:$PATH" type -p lspci | cut -f1) 2> /dev/null | grep VGA)
			gpu=$(grep -oE '\[.*\]' <<< "${gpu_info}" | sed 's/\[//;s/\]//' | sed -n '1h;2,$H;${g;s/\n/, /g;p}')
		fi
	fi

	if [ -n "$gpu" ];then
		if [ $(grep -i nvidia <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="NVidia "
		elif [ $(grep -i intel <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="Intel "
		elif [ $(grep -i amd <<< "${gpu_info}" | wc -l) -gt 0 ];then
			gpu_info="AMD "
		elif [[ $(grep -i ati <<< "${gpu_info}" | wc -l) -gt 0  || $(grep -i radeon <<< "${gpu_info}" | wc -l) -gt 0 ]]; then
			gpu_info="ATI "
		else
			gpu_info=$(cut -d ':' -f2 <<< "${gpu_info}")
			gpu_info="${gpu_info:1} "
		fi
		gpu="${gpu}"
	else
		gpu="Not Found"
	fi

	verboseOut "Finding current GPU...found as '$gpu'"
}
# GPU Detection - End