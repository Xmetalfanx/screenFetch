# Shell Detection - Begin
detectshell_ver () {
	local version_data='' version='' get_version='--version'

	case $1 in
		# ksh sends version to stderr. Weeeeeeird.
		ksh)
			version_data="$( $1 $get_version 2>&1 )"
			;;
		*)
			version_data="$( $1 $get_version 2>/dev/null )"
			;;
	esac

	if [[ -n $version_data ]];then
		version=$(awk '
		BEGIN {
			IGNORECASE=1
		}
		/'$2'/ {
			gsub(/(,|v|V)/, "",$'$3')
			if ($2 ~ /[Bb][Aa][Ss][Hh]/) {
				gsub(/\(.*|-release|-version\)/,"",$4)
			}
			print $'$3'
			exit # quit after first match prints
		}' <<< "$version_data")
	fi
	echo "$version"
}
detectshell () {
	if [[ ! "${shell_type}" ]]; then
		if [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" || "${distro}" == "Haiku" || "${distro}" == "Alpine Linux" || "${OSTYPE}" == "gnu" || "${distro}" == "TinyCore" || "${distro}" == "Raspbian" ]]; then
			shell_type=$(echo "$SHELL" | awk -F'/' '{print $NF}')
		elif readlink -f "$SHELL" 2>&1 | grep -q "busybox"; then
			shell_type="BusyBox"
		else
			if [[ "${OSTYPE}" == "linux-gnu" || "${OSTYPE}" == "linux" || "${OSTYPE}" == "linux-musl" ]]; then
				shell_type=$(cat /proc/$PPID/cmdline|tr '\0' '\n'|head -n 1)
			elif [[ "${distro}" == "Mac OS X" || "${distro}" == "DragonFlyBSD" || "${distro}" == "FreeBSD" || "${distro}" == "OpenBSD" || "${distro}" == "NetBSD" ]]; then
				shell_type=$(ps -p $PPID -o command | tail -1)
			else
				shell_type=$(ps -p $(ps -p $PPID | awk '$1 !~ /PID/ {print $1}') | awk 'FNR>1 {print $1}')
			fi
			shell_type=${shell_type/-}
			shell_type=${shell_type//*\/}
		fi
	fi

	case $shell_type in
		bash)
			shell_version_data=$( detectshell_ver "$shell_type" "^GNU.bash,.version" "4" )
			;;
		BusyBox)
			shell_version_data=$( busybox | head -n1 | cut -d ' ' -f2 )
			;;
		csh)
			shell_version_data=$( detectshell_ver "$shell_type" "$shell_type" "3" )
			;;
		dash)
			shell_version_data=$( detectshell_ver "$shell_type" "$shell_type" "3" )
			;;
		ksh)
			shell_version_data=$( detectshell_ver "$shell_type" "version" "5" )
			;;
		tcsh)
			shell_version_data=$( detectshell_ver "$shell_type" "^tcsh" "2" )
			;;
		zsh)
			shell_version_data=$( detectshell_ver "$shell_type" "^zsh" "2" )
			;;
		fish)
			shell_version_data=$( fish --version | awk '{print $3}' )
			;;
	esac

	if [[ -n $shell_version_data ]];then
		shell_type="$shell_type $shell_version_data"
	fi

	myShell=${shell_type}
	verboseOut "Finding current shell...found as '$myShell'"
}
# Shell Detection - End
