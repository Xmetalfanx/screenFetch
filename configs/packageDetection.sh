# Package Count - Begin
detectpkgs () {
	pkgs="Unknown"
	case "${distro}" in
		'Alpine Linux') pkgs=$(apk info | wc -l) ;;
		'Arch Linux'|'Parabola GNU/Linux-libre'|'Hyperbola GNU/Linux-libre'|'Chakra'|'Manjaro'|'Antergos'|'Netrunner'|'KaOS'|'Obarun'|'SwagArch'|'OBRevenge'|'Artix Linux') pkgs=$(pacman -Qq | wc -l) ;;
		'Chrome OS')
			if [ -d "/usr/local/lib/crew/packages" ]; then
				pkgs=$(ls -l /usr/local/etc/crew/meta/*.filelist | wc -l)
			else
				pkgs=$(ls -d /var/db/pkg/*/* | wc -l)
			fi
		;;
		'Dragora') pkgs=$(ls -1 /var/db/pkg | wc -l) ;;
		'Frugalware') pkgs=$(pacman-g2 -Q | wc -l) ;;
		'Debian'|'Ubuntu'|'Mint'|'Fuduntu'|'KDE neon'|'Devuan'|'Raspbian'|'LMDE'|'CrunchBang'|'Peppermint'|'LinuxDeepin'|'Deepin'|'Kali Linux'|'Trisquel'|'elementary OS'|'gNewSense'|'BunsenLabs'|'SteamOS'|'Parrot Security'|'GrombyangOS'|'DesaOS'|'Zorin OS'|'Proxmox VE') pkgs=$(dpkg -l | grep -c ^i) ;;
		'Slackware') pkgs=$(ls -1 /var/log/packages | wc -l) ;;
		'Gentoo'|'Sabayon'|'Funtoo'|'Kogaion') pkgs=$(ls -d /var/db/pkg/*/* | wc -l) ;;
		'NixOS') pkgs=$(ls -d -1 /nix/store/*/ | wc -l) ;;
		'GuixSD') pkgs=$(ls -d -1 /guix/store/*/ | wc -l) ;;
		'ALDOS'|'Fedora'|'Fux'|'Korora'|'BLAG'|'Chapeau'|'openSUSE'|'SUSE Linux Enterprise'|'Red Hat Enterprise Linux'|'ROSA'|'Oracle Linux'|'CentOS'|'Mandriva'|'Mandrake'|'Mageia'|'Mer'|'SailfishOS'|'PCLinuxOS'|'Viperr'|'Qubes OS'|'Red Star OS'|'blackPanther OS'|'Amazon Linux') pkgs=$(rpm -qa | wc -l) ;;
		'Void Linux') pkgs=$(xbps-query -l | wc -l) ;;
		'Evolve OS') pkgs=$(pisi list-installed | wc -l) ;;
		'Solus') pkgs=$(eopkg list-installed | wc -l) ;;
		'Source Mage GNU/Linux') pkgs=$(gaze installed | wc -l) ;;
		'CRUX') pkgs=$(pkginfo -i | wc -l) ;;
		'Lunar Linux') pkgs=$(lvu installed | wc -l) ;;
		'TinyCore') pkgs=$(tce-status -i | wc -l) ;;
		'Exherbo')
			xpkgs=$(ls -d -1 /var/db/paludis/repositories/cross-installed/*/data/* | wc -l)
			pkgs=$(ls -d -1 /var/db/paludis/repositories/installed/data/* | wc -l)
			pkgs=$((${pkgs} + ${xpkgs}))
		;;
		'Mac OS X')
			if [ -d "/usr/local/bin" ]; then
				loc_pkgs=$(ls -l /usr/local/bin/ | grep -v "\(../Cellar/\|brew\)" | wc -l)
				pkgs=$((${loc_pkgs} -1));
			fi

			if type -p port >/dev/null 2>&1; then
				port_pkgs=$(port installed 2>/dev/null | wc -l)
				pkgs=$((${pkgs} + (${port_pkgs} -1)))
			fi

			if type -p brew >/dev/null 2>&1; then
				brew_pkgs=$(brew list -1 2>/dev/null | wc -l)
				pkgs=$((${pkgs} + ${brew_pkgs}))
			fi
			if type -p pkgin >/dev/null 2>&1; then
				pkgsrc_pkgs=$(pkgin list 2>/dev/null | wc -l)
				pkgs=$((${pkgs} + ${pkgsrc_pkgs}))
			fi
		;;
		'DragonFlyBSD')
			pkgs=$(if TMPDIR=/dev/null ASSUME_ALWAYS_YES=1 PACKAGESITE=file:///nonexistent pkg info pkg >/dev/null 2>&1; then
				pkg info | wc -l | awk '{print $1}'; else pkg_info | wc -l | tr -d ' '; fi)
		;;
		'OpenBSD')
			pkgs=$(pkg_info | grep -c .)
		;;
		'FreeBSD')
			pkgs=$(pkg info | wc -l | awk '{sub(" ", ""); print $1}';)
		;;
		'NetBSD')
			pkgs=$(pkg_info | wc -l | tr -d ' ')
		;;
		'Cygwin')
			cygfix=2
			pkgs=$(($(cygcheck -cd | wc -l) - ${cygfix}))
			if [ -d "/cygdrive/c/ProgramData/chocolatey/lib" ]; then
				chocopkgs=$(( $(ls -1 /cygdrive/c/ProgramData/chocolatey/lib | wc -l) ))
				pkgs=$((${pkgs} + ${chocopkgs}))
			fi
		;;
		'Msys')
			pkgs=$(pacman -Qq | wc -l)
			if [ -d "/c/ProgramData/chocolatey/lib" ]; then
				chocopkgs=$(( $(ls -1 /c/ProgramData/chocolatey/lib | wc -l) ))
				pkgs=$((${pkgs} + ${chocopkgs}))
			fi
		;;
		'Haiku')
			haikualpharelease="no"
			if [ -d /boot/system/package-links ]; then
				pkgs=$(ls /boot/system/package-links | wc -l)
			elif type -p installoptionalpackage >/dev/null 2>&1; then
				haikualpharelease="yes"
				pkgs=$(installoptionalpackage -l | sed -n '3p' | wc -w)
			fi
		;;
	esac
	verboseOut "Finding current package count...found as '$pkgs'"
}