
# WM Detection - Begin
detectwm () {
	WM="Not Found"
	if [[ ${distro} != "Mac OS X" && ${distro} != "Cygwin" && "${distro}" != "Msys" ]]; then
		if [[ -n ${DISPLAY} ]]; then
			for each in "${wmnames[@]}"; do
				PID="$(pgrep -U ${UID} "^$each$")"
				if [ "$PID" ]; then
					case $each in
						'2bwm') WM="2bwm";;
						'9wm') WM="9wm";;
						'awesome') WM="Awesome";;
						'beryl') WM="Beryl";;
						'blackbox') WM="BlackBox";;
						'bspwm') WM="bspwm";;
						'budgie-wm') WM="BudgieWM";;
						'chromeos-wm') WM="chromeos-wm";;
						'cinnamon') WM="Muffin";;
						'compiz') WM="Compiz";;
						'deepin-wm') WM="deepin-wm";;
						'dminiwm') WM="dminiwm";;
						'dtwm') WM="dtwm";;
						'dwm') WM="dwm";;
						'e16') WM="E16";;
						'emerald') WM="Emerald";;
						'enlightenment') WM="E17";;
						'fluxbox') WM="FluxBox";;
						'flwm'|'flwm_topside') WM="FLWM";;
						'fvwm') WM="FVWM";;
						'herbstluftwm') WM="herbstluftwm";;
						'howm') WM="howm";;
						'i3') WM="i3";;
						'icewm') WM="IceWM";;
						'kwin') WM="KWin";;
						'metacity') WM="Metacity";;
						'monsterwm') WM="monsterwm";;
						'musca') WM="Musca";;
						'mwm') WM="MWM";;
						'notion') WM="Notion";;
						'openbox') WM="OpenBox";;
						'pekwm') WM="PekWM";;
						'ratpoison') WM="Ratpoison";;
						'sawfish') WM="Sawfish";;
						'scrotwm') WM="ScrotWM";;
						'spectrwm') WM="SpectrWM";;
						'stumpwm') WM="StumpWM";;
						'subtle') WM="subtle";;
						'sway') WM="sway";;
						'swm') WM="swm";;
						'twin') WM="TWin";;
						'wmaker') WM="WindowMaker";;
						'wmfs') WM="WMFS";;
						'wmii') WM="wmii";;
						'xfwm4') WM="Xfwm4";;
						'xmonad.*') WM="XMonad";;
					esac
				fi

				if [[ ${WM} != "Not Found" ]]; then
					break 1
				fi
			done

			if [[ ${WM} == "Not Found" ]]; then
				if type -p xprop >/dev/null 2>&1; then
					WM=$(xprop -root _NET_SUPPORTING_WM_CHECK)
					if [[ "$WM" =~ 'not found' ]]; then
						WM="Not Found"
					elif [[ "$WM" =~ 'Not found' ]]; then
						WM="Not Found"
					elif [[ "$WM" =~ '[Ii]nvalid window id format' ]]; then
						WM="Not Found"
					elif [[ "$WM" =~ "no such" ]]; then
						WM="Not Found"
					else
						WM=${WM//* }
						WM=$(xprop -id ${WM} 8s _NET_WM_NAME)
						WM=$(echo $(WM=${WM//*= }; echo ${WM//\"}))
					fi
				fi
			else
				if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
					if [[ ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -gt 1 ]] || [[ ${BASH_VERSINFO[0]} -gt 4 ]]; then
						WM=${WM,,}
					else
						WM="$(tr '[:upper:]' '[:lower:]' <<< ${WM})"
					fi
				else
					WM="$(tr '[:upper:]' '[:lower:]' <<< ${WM})"
				fi
				case ${WM} in
					*'gala'*) WM="Gala";;
					'2bwm') WM="2bwm";;
					'awesome') WM="Awesome";;
					'beryl') WM="Beryl";;
					'blackbox') WM="BlackBox";;
					'budgiewm') WM="BudgieWM";;
					'chromeos-wm') WM="chromeos-wm";;
					'cinnamon') WM="Cinnamon";;
					'compiz') WM="Compiz";;
					'deepin-wm') WM="Deepin WM";;
					'dminiwm') WM="dminiwm";;
					'dwm') WM="dwm";;
					'e16') WM="E16";;
					'echinus') WM="echinus";;
					'emerald') WM="Emerald";;
					'enlightenment') WM="E17";;
					'fluxbox') WM="FluxBox";;
					'flwm'|'flwm_topside') WM="FLWM";;
					'fvwm') WM="FVWM";;
					'gnome shell'*) WM="Mutter";;
					'herbstluftwm') WM="herbstluftwm";;
					'howm') WM="howm";;
					'i3') WM="i3";;
					'icewm') WM="IceWM";;
					'kwin') WM="KWin";;
					'metacity') WM="Metacity";;
					'monsterwm') WM="monsterwm";;
					'muffin') WM="Muffin";;
					'musca') WM="Musca";;
					'mutter'*) WM="Mutter";;
					'mwm') WM="MWM";;
					'notion') WM="Notion";;
					'openbox') WM="OpenBox";;
					'pekwm') WM="PekWM";;
					'ratpoison') WM="Ratpoison";;
					'sawfish') WM="Sawfish";;
					'scrotwm') WM="ScrotWM";;
					'spectrwm') WM="SpectrWM";;
					'stumpwm') WM="StumpWM";;
					'subtle') WM="subtle";;
					'sway') WM="sway";;
					'swm') WM="swm";;
					'twin') WM="TWin";;
					'wmaker') WM="WindowMaker";;
					'wmfs') WM="WMFS";;
					'wmii') WM="wmii";;
					'xfwm4') WM="Xfwm4";;
					'xmonad') WM="XMonad";;
				esac
			fi
		fi
	elif [[ ${distro} == "Mac OS X" && "${WM}" == "Not Found" ]]; then
		if ps -U ${USER} | grep Finder >/dev/null 2>&1; then
			WM="Quartz Compositor"
		fi
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		bugn=$(tasklist | grep -o 'bugn' | tr -d '\r \n')
		wind=$(tasklist | grep -o 'Windawesome' | tr -d '\r \n')
		blackbox=$(tasklist | grep -o 'blackbox' | tr -d '\r \n')
		if [ "$bugn" = "bugn" ]; then WM="bug.n"
		elif [ "$wind" = "Windawesome" ]; then WM="Windawesome"
		elif [ "$blackbox" = "blackbox" ]; then WM="Blackbox"
		else WM="DWM/Explorer"; fi
	fi
	verboseOut "Finding window manager...found as '$WM'"
}
# WM Detection - End


# WM Theme Detection - BEGIN
detectwmtheme () {
	Win_theme="Not Found"
	case $WM in
		'2bwm') Win_theme="Not Applicable";;
		'9wm') Win_theme="Not Applicable";;
		'Awesome') if [ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/awesome/rc.lua ]; then Win_theme="$(grep -e '^[^-].*\(theme\|beautiful\).*lua' ${XDG_CONFIG_HOME:-${HOME}/.config}/awesome/rc.lua | grep '[^/]\+/[^/]\+.lua' -o | cut -d'/' -f1 | head -n1)"; fi;;
		'BlackBox') if [ -f $HOME/.blackboxrc ]; then Win_theme="$(awk -F"/" '/styleFile/ {print $NF}' $HOME/.blackboxrc)"; fi;;
		'Beryl') Win_theme="Not Applicable";;
		'bspwm') Win_theme="Not Applicable";;
		'BudgieWM')
			Win_theme="$(gsettings get org.gnome.desktop.wm.preferences theme)"
			Win_theme="${Win_theme//\'}"
		;;
		'Cinnamon'|'Muffin')
			de_theme="$(gsettings get org.cinnamon.theme name)"
			de_theme=${de_theme//"'"}
			win_theme="$(gsettings get org.cinnamon.desktop.wm.preferences theme)"
			win_theme=${win_theme//"'"}
			Win_theme="${de_theme} (${win_theme})"
		;;
		'Compiz'|'Mutter'*|'GNOME Shell'|'Gala')
			if type -p gsettings >/dev/null 2>&1; then
				Win_theme="$(gsettings get org.gnome.shell.extensions.user-theme name 2>/dev/null)"
				if [[ -z "$Win_theme" ]]; then
					Win_theme="$(gsettings get org.gnome.desktop.wm.preferences theme)"
				fi
				Win_theme=${Win_theme//"'"}
			elif type -p gconftool-2 >/dev/null 2>&1; then
				Win_theme=$(gconftool-2 -g /apps/metacity/general/theme)
			fi
		;;
		'Deepin WM')
			if type -p gsettings >/dev/null 2>&1; then
				Win_theme="$(gsettings get com.deepin.wrap.gnome.desktop.wm.preferences theme)"
				Win_theme=${Win_theme//"'"}
			fi
		;;
		'dminiwm') Win_theme="Not Applicable";;
		'dwm') Win_theme="Not Applicable";;
		'E16') Win_theme="$(awk -F"= " '/theme.name/ {print $2}' $HOME/.e16/e_config--0.0.cfg)";;
		'E17'|'Enlightenment')
			if [ "$(which eet 2>/dev/null)" ]; then
				econfig="$(eet -d $HOME/.e/e/config/standard/e.cfg config | awk '/value \"file\" string.*.edj/{ print $4 }')"
				econfigend="${econfig##*/}"
				Win_theme=${econfigend%.*}
			fi
		;;
		#E17 doesn't store cfg files in text format so for now get the profile as opposed to theme. atyoung
		#TODO: Find a way to extract and read E17 .cfg files ( google seems to have nothing ). atyoung
		'E17') Win_theme=${E_CONF_PROFILE};;
		'echinus') Win_theme="Not Applicable";;
		'Emerald') if [ -f $HOME/.emerald/theme/theme.ini ]; then Win_theme="$(for a in /usr/share/emerald/themes/* $HOME/.emerald/themes/*; do cmp "$HOME/.emerald/theme/theme.ini" "$a/theme.ini" &>/dev/null && basename "$a"; done)"; fi;;
		'Finder') Win_theme="Not Applicable";;
		'FluxBox'|'Fluxbox') if [ -f $HOME/.fluxbox/init ]; then Win_theme="$(awk -F"/" '/styleFile/ {print $NF}' $HOME/.fluxbox/init)"; fi;;
		'FVWM') Win_theme="Not Applicable";;
		'howm') Win_theme="Not Applicable";;
		'i3') Win_theme="Not Applicable";;
		'IceWM') if [ -f $HOME/.icewm/theme ]; then Win_theme="$(awk -F"[\",/]" '!/#/ {print $2}' $HOME/.icewm/theme)"; fi;;
		'KWin'*)
			if [[ -z $KDE_CONFIG_DIR ]]; then
				if type -p kde5-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde5-config --localprefix)
				elif type -p kde4-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde4-config --localprefix)
				elif type -p kde-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde-config --localprefix)
				fi
			fi

			if [[ -n $KDE_CONFIG_DIR ]]; then
				Win_theme="Not Applicable"
				KDE_CONFIG_DIR=${KDE_CONFIG_DIR%/}
				if [[ -f $KDE_CONFIG_DIR/share/config/kwinrc ]]; then
					Win_theme="$(awk '/PluginLib=kwin3_/{gsub(/PluginLib=kwin3_/,"",$0); print $0; exit}' $KDE_CONFIG_DIR/share/config/kwinrc)"
					if [[ -z "$Win_theme" ]]; then Win_theme="Not Applicable"; fi
				fi
				if [[ "$Win_theme" == "Not Applicable" ]]; then
					if [[ -f $KDE_CONFIG_DIR/share/config/kdebugrc ]]; then
						Win_theme="$(awk '/(decoration)/ {gsub(/\[/,"",$1); print $1; exit}' $KDE_CONFIG_DIR/share/config/kdebugrc)"
						if [[ -z "$Win_theme" ]]; then Win_theme="Not Applicable"; fi
					fi
				fi
				if [[ "$Win_theme" == "Not Applicable" ]]; then
					if [[ -f $KDE_CONFIG_DIR/share/config/kdeglobals ]]; then
						Win_theme="$(awk '/\[General\]/ {flag=1;next} /^$/{flag=0} flag {print}' $KDE_CONFIG_DIR/share/config/kdeglobals | grep -oP 'Name=\K.*')"
						if [[ -z "$Win_theme" ]]; then Win_theme="Not Applicable"; fi
					fi
				fi

				if [[ "$Win_theme" != "Not Applicable" ]]; then
					if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
						if [[ ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -gt 1 ]] || [[ ${BASH_VERSINFO[0]} -gt 4 ]]; then
							Win_theme="${Win_theme^}"
						else
							Win_theme="$(tr '[:lower:]' '[:upper:]' <<< ${Win_theme:0:1})${Win_theme:1}"
						fi
					else
						Win_theme="$(tr '[:lower:]' '[:upper:]' <<< ${Win_theme:0:1})${Win_theme:1}"
					fi
				fi
			fi
		;;
		'Marco')
			Win_theme="$(gsettings get org.mate.Marco.general theme)"
			Win_theme=${Win_theme//"'"}
		;;
		'Metacity') if [ "`gconftool-2 -g /apps/metacity/general/theme`" ]; then Win_theme="$(gconftool-2 -g /apps/metacity/general/theme)"; fi ;;
		'monsterwm') Win_theme="Not Applicable";;
		'Musca') Win_theme="Not Applicable";;
		'Notion') Win_theme="Not Applicable";;
		'OpenBox'|'Openbox')
			if [ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/openbox/rc.xml ]; then
				Win_theme="$(awk -F"[<,>]" '/<theme/ { getline; print $3 }' ${XDG_CONFIG_HOME:-${HOME}/.config}/openbox/rc.xml)";
			elif [[ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/openbox/lxde-rc.xml && $DE == "LXDE" ]]; then
				Win_theme="$(awk -F"[<,>]" '/<theme/ { getline; print $3 }' ${XDG_CONFIG_HOME:-${HOME}/.config}/openbox/lxde-rc.xml)";
			fi
		;;
		'PekWM') if [ -f $HOME/.pekwm/config ]; then Win_theme="$(awk -F"/" '/Theme/ {gsub(/\"/,""); print $NF}' $HOME/.pekwm/config)"; fi;;
		'Ratpoison') Win_theme="Not Applicable";;
		'Sawfish') Win_theme="$(awk -F")" '/\(quote default-frame-style/{print $2}' $HOME/.sawfish/custom | sed 's/ (quote //')";;
		'ScrotWM') Win_theme="Not Applicable";;
		'SpectrWM') Win_theme="Not Applicable";;
		'swm') Win_theme="Not Applicable";;
		'subtle') Win_theme="Not Applicable";;
		'TWin')
			if [[ -z $TDE_CONFIG_DIR ]]; then
				if type -p tde-config >/dev/null 2>&1; then
					TDE_CONFIG_DIR=$(tde-config --localprefix)
				fi
			fi
			if [[ -n $TDE_CONFIG_DIR ]]; then
				TDE_CONFIG_DIR=${TDE_CONFIG_DIR%/}
				if [[ -f $TDE_CONFIG_DIR/share/config/kcmthememanagerrc ]]; then
					Win_theme=$(awk '/CurrentTheme=/ {gsub(/CurrentTheme=/,"",$0); print $0; exit}' $TDE_CONFIG_DIR/share/config/kcmthememanagerrc)
				fi
				if [[ -z $Win_theme ]]; then
					Win_theme="Not Applicable"
				fi
			fi
		;;
		'WindowMaker') Win_theme="Not Applicable";;
		'WMFS') Win_theme="Not Applicable";;
		'wmii') Win_theme="Not Applicable";;
		'Xfwm4') if [ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml ]; then Win_theme="$(xfconf-query -c xfwm4 -p /general/theme)"; fi;;
		'XMonad') Win_theme="Not Applicable";;
	esac
	if [[ "${distro}" == "Mac OS X" ]]; then
		themeNumber="$(defaults read NSGlobalDomain AppleAquaColorVariant 2>/dev/null)"
		if [ "${themeNumber}" == "1" ] || [ "${themeNumber}x" == "x" ]; then
			Win_theme="Blue"
		else
			Win_theme="Graphite"
		fi
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		if [ "${WM}" == "Blackbox" ]; then
			if [ "${distro}" == "Msys" ]; then
				Blackbox_loc=$(reg query 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\WinLogon' //v 'Shell')
			else
				Blackbox_loc=$(reg query 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\WinLogon' /v 'Shell')
			fi
			Blackbox_loc="$(echo ${Blackbox_loc} | sed 's/.*REG_SZ//' | sed -e 's/^[ \t]*//' | sed 's/.\{4\}$//')"
			Win_theme=$(cat "${Blackbox_loc}.rc" | grep "session.styleFile" | sed 's/ //g' | sed 's/session\.styleFile://g' | sed 's/.*\\//g')
		else
			if [[ "${distro}" == "Msys" ]]; then
				themeFile="$(reg query 'HKCU\Software\Microsoft\Windows\CurrentVersion\Themes' //v 'CurrentTheme')"
			else
				themeFile="$(reg query 'HKCU\Software\Microsoft\Windows\CurrentVersion\Themes' /v 'CurrentTheme')"
			fi
			Win_theme=$(echo $themeFile| awk -F"\\" '{print $NF}' | sed 's|\.theme$||')
		fi
	fi

	verboseOut "Finding window manager theme...found as '$Win_theme'"
}
# WM Theme Detection - END