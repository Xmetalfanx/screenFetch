# GTK Theme\Icon\Font Detection - BEGIN
detectgtk () {
	gtk2Theme="Not Found"
	gtk3Theme="Not Found"
	gtkIcons="Not Found"
	gtkFont="Not Found"
	# Font detection (OS X)
	if [[ ${distro} == "Mac OS X" ]]; then
		gtk2Theme="Not Applicable"
		gtk3Theme="Not Applicable"
		gtkIcons="Not Applicable"
		if ps -U ${USER} | grep [F]inder >/dev/null 2>&1; then
			if [[ ${TERM_PROGRAM} == "iTerm.app" ]] && [ -f ~/Library/Preferences/com.googlecode.iterm2.plist ]; then
				# iTerm2

				iterm2_theme_uuid=$(defaults read com.googlecode.iTerm2 "Default Bookmark Guid")

				OLD_IFS=$IFS
				IFS=$'\n'
				iterm2_theme_info=($(defaults read com.googlecode.iTerm2 "New Bookmarks" | grep -e Guid -e "Normal Font"))
				IFS=$OLD_IFS

				for i in $(seq 0 $((${#iterm2_theme_info[*]}/2-1))); do
					found_uuid=$(str1=${iterm2_theme_info[$i*2]};echo ${str1:16:${#str1}-16-2})
					if [[ $found_uuid == $iterm2_theme_uuid ]]; then
						gtkFont=$(str2=${iterm2_theme_info[$i*2+1]};echo ${str2:25:${#str2}-25-2})
						break
					fi
				done
			else
				# Terminal.app

				termapp_theme_name=$(defaults read com.apple.Terminal "Default Window Settings")

				OLD_IFS=$IFS
				IFS=$'\n'
				termapp_theme_info=($(defaults read com.apple.Terminal "Window Settings" | grep -e "name = " -e "Font = "))
				IFS=$OLD_IFS

				for i in $(seq 0 $((${#termapp_theme_info[*]}/2-1))); do
					found_name=$(str1=${termapp_theme_info[$i*2+1]};echo ${str1:15:${#str1}-15-1})
					if [[ $found_name == $termapp_theme_name ]]; then
						gtkFont=$(str2=${termapp_theme_info[$i*2]};echo ${str2:288:${#str2}-288})
						gtkFont=$(echo ${gtkFont%%[dD]2*;} | xxd -r -p)
						break
					fi
				done
			fi
		fi
	else
		case $DE in
			'KDE'*) # Desktop Environment found as "KDE"
				if type - p kde4-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde4-config --localprefix)
					if [[ -d ${KDE_CONFIG_DIR} ]]; then
						if [[ -f "${KDE_CONFIG_DIR}/share/config/kdeglobals" ]]; then
							KDE_CONFIG_FILE="${KDE_CONFIG_DIR}/share/config/kdeglobals"
						fi
					fi
				elif type -p kde5-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde5-config --localprefix)
					if [[ -d ${KDE_CONFIG_DIR} ]]; then
						if [[ -f "${KDE_CONFIG_DIR}/share/config/kdeglobals" ]]; then
							KDE_CONFIG_FILE="${KDE_CONFIG_DIR}/share/config/kdeglobals"
						fi
					fi
				elif type -p kde-config >/dev/null 2>&1; then
					KDE_CONFIG_DIR=$(kde-config --localprefix)
					if [[ -d ${KDE_CONFIG_DIR} ]]; then
						if [[ -f "${KDE_CONFIG_DIR}/share/config/kdeglobals" ]]; then
							KDE_CONFIG_FILE="${KDE_CONFIG_DIR}/share/config/kdeglobals"
						fi
					fi
				fi

				if [[ -n ${KDE_CONFIG_FILE} ]]; then
					if grep -q "widgetStyle=" "${KDE_CONFIG_FILE}"; then
						gtk2Theme=$(awk -F"=" '/widgetStyle=/ {print $2}' "${KDE_CONFIG_FILE}")
					elif grep -q "colorScheme=" "${KDE_CONFIG_FILE}"; then
						gtk2Theme=$(awk -F"=" '/colorScheme=/ {print $2}' "${KDE_CONFIG_FILE}")
					fi

					if grep -q "Theme=" "${KDE_CONFIG_FILE}"; then
						gtkIcons=$(awk -F"=" '/Theme=/ {print $2}' "${KDE_CONFIG_FILE}")
					fi

					if grep -q "Font=" "${KDE_CONFIG_FILE}"; then
						gtkFont=$(awk -F"=" '/font=/ {print $2}' "${KDE_CONFIG_FILE}")
					fi
				fi

				if [[ -f $HOME/.gtkrc-2.0 ]]; then
					gtk2Theme=$(grep '^gtk-theme-name' $HOME/.gtkrc-2.0 | awk -F'=' '{print $2}')
					gtk2Theme=${gtk2Theme//\"/}
					gtkIcons=$(grep '^gtk-icon-theme-name' $HOME/.gtkrc-2.0 | awk -F'=' '{print $2}')
					gtkIcons=${gtkIcons//\"/}
					gtkFont=$(grep 'font_name' $HOME/.gtkrc-2.0 | awk -F'=' '{print $2}')
					gtkFont=${gtkFont//\"/}
				fi

				if [[ -f $HOME/.config/gtk-3.0/settings.ini ]]; then
					gtk3Theme=$(grep '^gtk-theme-name=' $HOME/.config/gtk-3.0/settings.ini | awk -F'=' '{print $2}')
				fi
			;;
			'Cinnamon'*) # Desktop Environment found as "Cinnamon"
				if type -p gsettings >/dev/null 2>&1; then
					gtk3Theme=$(gsettings get org.cinnamon.desktop.interface gtk-theme)
					gtk3Theme=${gtk3Theme//"'"}
					gtk2Theme=${gtk3Theme}

					gtkIcons=$(gsettings get org.cinnamon.desktop.interface icon-theme)
					gtkIcons=${gtkIcons//"'"}
					gtkFont=$(gsettings get org.cinnamon.desktop.interface font-name)
					gtkFont=${gtkFont//"'"}
					if [ "$background_detect" == "1" ]; then gtkBackground=$(gsettings get org.gnome.desktop.background picture-uri); fi
				fi
			;;
			'GNOME'*|'Unity'*|'Budgie') # Desktop Environment found as "GNOME"
				if type -p gsettings >/dev/null 2>&1; then
					gtk3Theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
					gtk3Theme=${gtk3Theme//"'"}
					gtk2Theme=${gtk3Theme}
					gtkIcons=$(gsettings get org.gnome.desktop.interface icon-theme)
					gtkIcons=${gtkIcons//"'"}
					gtkFont=$(gsettings get org.gnome.desktop.interface font-name)
					gtkFont=${gtkFont//"'"}
					if [ "$background_detect" == "1" ]; then gtkBackground=$(gsettings get org.gnome.desktop.background picture-uri); fi
				elif type -p gconftool-2 >/dev/null 2>&1; then
					gtk2Theme=$(gconftool-2 -g /desktop/gnome/interface/gtk_theme)
					gtkIcons=$(gconftool-2 -g /desktop/gnome/interface/icon_theme)
					gtkFont=$(gconftool-2 -g /desktop/gnome/interface/font_name)
					if [ "$background_detect" == "1" ]; then
						gtkBackgroundFull=$(gconftool-2 -g /desktop/gnome/background/picture_filename)
						gtkBackground=$(echo "$gtkBackgroundFull" | awk -F"/" '{print $NF}')
					fi
				fi
			;;
			'MATE'*) # MATE desktop environment
				#if type -p gsettings >/dev/null 2&>1; then
				gtk3Theme=$(gsettings get org.mate.interface gtk-theme)
				# gtk3Theme=${gtk3Theme//"'"}
				gtk2Theme=${gtk3Theme}
				gtkIcons=$(gsettings get org.mate.interface icon-theme)
				gtkIcons=${gtkIcons//"'"}
				gtkFont=$(gsettings get org.mate.interface font-name)
				gtkFont=${gtkFont//"'"}
				#fi
			;;
			'Xfce'*) # Desktop Environment found as "Xfce"
				if [ "$distro" == "BunsenLabs" ] ; then
					gtk2Theme=$(awk -F'"' '/^gtk-theme/ {print $2}' $HOME/.gtkrc-2.0)
					gtk3Theme=$(awk -F'=' '/^gtk-theme-name/ {print $2}' $HOME/.config/gtk-3.0/settings.ini)
					gtkIcons=$(awk -F'"' '/^gtk-icon-theme/ {print $2}' $HOME/.gtkrc-2.0)
					gtkFont=$(awk -F'"' '/^gtk-font-name/ {print $2}' $HOME/.gtkrc-2.0)
				else
					if type -p xfconf-query >/dev/null 2>&1; then
						gtk2Theme=$(xfconf-query -c xsettings -p /Net/ThemeName)
					fi

					if type -p xfconf-query >/dev/null 2>&1; then
						gtkIcons=$(xfconf-query -c xsettings -p /Net/IconThemeName)
					fi

					if type -p xfconf-query >/dev/null 2>&1; then
						gtkFont=$(xfconf-query -c xsettings -p /Gtk/FontName)
					fi
				fi
			;;
			'LXDE'*)
				config_home="${XDG_CONFIG_HOME:-${HOME}/.config}"
				if [ -f "$config_home/lxde/config" ]; then
					lxdeconf="/lxde/config"
				elif [ "$distro" == "Trisquel" ] || [ "$distro" == "FreeBSD" ]; then
					lxdeconf=""
				elif [ -f "$config_home/lxsession/Lubuntu/desktop.conf" ]; then
					lxdeconf="/lxsession/Lubuntu/desktop.conf"
				else
					lxdeconf="/lxsession/LXDE/desktop.conf"
				fi

				if grep -q "sNet\/ThemeName" "${config_home}${lxdeconf}" 2>/dev/null; then
					gtk2Theme=$(awk -F'=' '/sNet\/ThemeName/ {print $2}' ${config_home}${lxdeconf})
				fi

				if grep -q IconThemeName "${config_home}${lxdeconf}" 2>/dev/null; then
					gtkIcons=$(awk -F'=' '/sNet\/IconThemeName/ {print $2}' ${config_home}${lxdeconf})
				fi

				if grep -q FontName "${config_home}${lxdeconf}" 2>/dev/null; then
					gtkFont=$(awk -F'=' '/sGtk\/FontName/ {print $2}' ${config_home}${lxdeconf})
 				fi
			;;

			# /home/me/.config/rox.sourceforge.net/ROX-Session/Settings.xml

			*)	# Lightweight or No DE Found
				if [ -f "$HOME/.gtkrc-2.0" ]; then
					if grep -q gtk-theme $HOME/.gtkrc-2.0; then
						gtk2Theme=$(awk -F'"' '/^gtk-theme/ {print $2}' $HOME/.gtkrc-2.0)
					fi

					if grep -q icon-theme $HOME/.gtkrc-2.0; then
						gtkIcons=$(awk -F'"' '/^gtk-icon-theme/ {print $2}' $HOME/.gtkrc-2.0)
					fi

					if grep -q font $HOME/.gtkrc-2.0; then
						gtkFont=$(awk -F'"' '/^gtk-font-name/ {print $2}' $HOME/.gtkrc-2.0)
					fi
				fi
				# $HOME/.gtkrc.mine theme detect only
				if [[ -f "$HOME/.gtkrc.mine" ]]; then
					minegtkrc="$HOME/.gtkrc.mine"
				elif [[ -f "$HOME/.gtkrc-2.0.mine" ]]; then
					minegtkrc="$HOME/.gtkrc-2.0.mine"
				fi
				if [ -f "$minegtkrc" ]; then
					if grep -q "^include" "$minegtkrc"; then
						gtk2Theme=$(grep '^include.*gtkrc' "$minegtkrc" | awk -F "/" '{ print $5 }')
					fi
					if grep -q "^gtk-icon-theme-name" "$minegtkrc"; then
						gtkIcons=$(grep '^gtk-icon-theme-name' "$minegtkrc" | awk -F '"' '{print $2}')
					fi
				fi
				# /etc/gtk-2.0/gtkrc compatability
				if [[ -f /etc/gtk-2.0/gtkrc && ! -f "$HOME/.gtkrc-2.0" && ! -f "$HOME/.gtkrc.mine" && ! -f "$HOME/.gtkrc-2.0.mine" ]]; then
					if grep -q gtk-theme-name /etc/gtk-2.0/gtkrc; then
						gtk2Theme=$(awk -F'"' '/^gtk-theme-name/ {print $2}' /etc/gtk-2.0/gtkrc)
					fi
					if grep -q gtk-fallback-theme-name /etc/gtk-2.0/gtkrc  && ! [ "x$gtk2Theme" = "x" ]; then
						gtk2Theme=$(awk -F'"' '/^gtk-fallback-theme-name/ {print $2}' /etc/gtk-2.0/gtkrc)
					fi

					if grep -q icon-theme /etc/gtk-2.0/gtkrc; then
						gtkIcons=$(awk -F'"' '/^icon-theme/ {print $2}' /etc/gtk-2.0/gtkrc)
					fi
					if  grep -q gtk-fallback-icon-theme /etc/gtk-2.0/gtkrc  && ! [ "x$gtkIcons" = "x" ]; then
						gtkIcons=$(awk -F'"' '/^gtk-fallback-icon-theme/ {print $2}' /etc/gtk-2.0/gtkrc)
					fi

					if grep -q font /etc/gtk-2.0/gtkrc; then
						gtkFont=$(awk -F'"' '/^gtk-font-name/ {print $2}' /etc/gtk-2.0/gtkrc)
					fi
				fi

				# EXPERIMENTAL gtk3 Theme detection
				if [ -f "$HOME/.config/gtk-3.0/settings.ini" ]; then
					if grep -q gtk-theme-name $HOME/.config/gtk-3.0/settings.ini; then
						gtk3Theme=$(awk -F'=' '/^gtk-theme-name/ {print $2}' $HOME/.config/gtk-3.0/settings.ini)
					fi
				fi

				# Proper gtk3 Theme detection
				#if type -p gsettings >/dev/null 2>&1; then
				#	gtk3Theme=$(gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null)
				#	gtk3Theme=${gtk3Theme//"'"}
				#fi

				# ROX-Filer icon detect only
				if [ -a "${XDG_CONFIG_HOME:-${HOME}/.config}/rox.sourceforge.net/ROX-Filer/Options" ]; then
					gtkIcons=$(awk -F'[>,<]' '/icon_theme/ {print $3}' ${XDG_CONFIG_HOME:-${HOME}/.config}/rox.sourceforge.net/ROX-Filer/Options)
				fi

				# E17 detection
				if [ $E_ICON_THEME ]; then
					gtkIcons=${E_ICON_THEME}
					gtk2Theme="Not available."
					gtkFont="Not available."
				fi

				# Background Detection (feh, nitrogen)
				if [ "$background_detect" == "1" ]; then
					if [ -a $HOME/.fehbg ]; then
						gtkBackgroundFull=$(awk -F"'" '/feh --bg/{print $2}' $HOME/.fehbg 2>/dev/null)
						gtkBackground=$(echo "$gtkBackgroundFull" | awk -F"/" '{print $NF}')
					elif [ -a ${XDG_CONFIG_HOME:-${HOME}/.config}/nitrogen/bg-saved.cfg ]; then
						gtkBackground=$(awk -F"/" '/file=/ {print $NF}' ${XDG_CONFIG_HOME:-${HOME}/.config}/nitrogen/bg-saved.cfg)
					fi
				fi

				if [[ "$distro" == "Cygwin" || "$distro" == "Msys" ]]; then
					if [ "$gtkFont" == "Not Found" ]; then
						if [ -f "$HOME/.minttyrc" ]; then
							gtkFont="$(grep '^Font=.*' "$HOME/.minttyrc" | grep -o '[0-9A-z ]*$')"
						fi
					fi
				fi
			;;
		esac
	fi
	verboseOut "Finding GTK2 theme...found as '$gtk2Theme'"
	verboseOut "Finding GTK3 theme...found as '$gtk3Theme'"
	verboseOut "Finding icon theme...found as '$gtkIcons'"
	verboseOut "Finding user font...found as '$gtkFont'"
	[[ $gtkBackground ]] && verboseOut "Finding background...found as '$gtkBackground'"
}
# GTK Theme\Icon\Font Detection - END

