# Resolution Detection - Begin
detectres () {
	if [[ ${distro} != "Mac OS X" && ${distro} != "Cygwin" && "${distro}" != "Msys" && ${distro} != "Haiku" ]]; then
		if [[ -n ${DISPLAY} ]]; then
			if type -p xdpyinfo >/dev/null 2>&1; then
				if [[ "$distro" =~ "BSD" ]]; then
					xResolution=$(xdpyinfo | sed -n 's/.*dim.* \([0-9]*x[0-9]*\) .*/\1/pg' | tr '\n' ' ')
				else
					xResolution=$(xdpyinfo | sed -n 's/.*dim.* \([0-9]*x[0-9]*\) .*/\1/pg' | sed ':a;N;$!ba;s/\n/ /g')
				fi
			fi
		fi
	elif [[ ${distro} == "Mac OS X" ]]; then
		xResolution=$(system_profiler SPDisplaysDataType | awk '/Resolution:/ {print $2"x"$4" "}')
		if [[ "$(echo $xResolution | wc -l)" -ge 1 ]]; then
			xResolution=$(echo $xResolution | tr "\\n" "," | sed 's/\(.*\),/\1/')
		fi
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		xResolution=$(wmic path Win32_VideoController get CurrentHorizontalResolution,CurrentVerticalResolution | awk 'NR==2 {print $1"x"$2}')
	elif [[ "${distro}" == "Haiku" ]]; then
		width=$(screenmode | cut -d ' ' -f2)
		height=$(screenmode | cut -d ' ' -f3 | tr -d ',')
		xResolution="$(echo ${width}x${height})"
	else
		xResolution="No X Server"
	fi
	verboseOut "Finding current resolution(s)...found as '$xResolution'"
}
# Resolution Detection - End
