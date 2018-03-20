
# DE Detection - Begin
detectde () {
	DE="Not Present"
	if [[ ${distro} != "Mac OS X" && ${distro} != "Cygwin" && "${distro}" != "Msys" ]]; then
		if [[ -n ${DISPLAY} ]]; then
			if type -p xprop >/dev/null 2>&1;then
				xprop_root="$(xprop -root 2>/dev/null)"
				if [[ -n ${xprop_root} ]]; then
					DE=$(echo "${xprop_root}" | awk 'BEGIN {
						de = "Not Present"
					}
					{
						if ($1 ~ /^_DT_SAVE_MODE/) {
							de = $NF
							gsub(/\"/,"",de)
							de = toupper(de)
							exit
						}
						else if ($1 ~/^KDE_SESSION_VERSION/) {
							de = "KDE"$NF
							exit
						}
						else if ($1 ~ /^_MUFFIN/) {
							de = "Cinnamon"
							exit
						}
						else if ($1 ~ /^TDE_FULL_SESSION/) {
							de = "Trinity"
							exit
						}
						else if ($0 ~ /"xfce4"/) {
							de = "Xfce4"
							exit
						}
						else if ($0 ~ /"xfce5"/) {
							de = "Xfce5"
							exit
						}
					} END {
						print de
					}')
				fi
			fi

			if [[ ${DE} == "Not Present" ]]; then
				# Let's use xdg-open code for GNOME/Enlightment/KDE/LXDE/MATE/Xfce detection
				# http://bazaar.launchpad.net/~vcs-imports/xdg-utils/master/view/head:/scripts/xdg-utils-common.in#L251
				if [ -n "${XDG_CURRENT_DESKTOP}" ]; then
					case "${XDG_CURRENT_DESKTOP}" in
						ENLIGHTENMENT)
							DE=Enlightenment;
							;;
						GNOME)
							DE=GNOME;
							;;
						KDE)
							DE=KDE;
							;;
						LUMINA|Lumina)
							DE=Lumina;
							;;
						LXDE)
							DE=LXDE;
							;;
						MATE)
							DE=MATE;
							;;
						XFCE)
							DE=Xfce
							;;
						'X-Cinnamon')
							DE=Cinnamon
							;;
						Unity)
							DE=Unity
							;;
						LXQt)
							DE=LXQt
							;;
					esac
				fi

				if [ -n "$DE" ]; then
					# classic fallbacks
					if [ -n "$KDE_FULL_SESSION" ]; then DE=KDE;
					elif [ -n "$TDE_FULL_SESSION" ]; then DE=Trinity;
					elif [ -n "$GNOME_DESKTOP_SESSION_ID" ]; then DE=GNOME;
					elif [ -n "$MATE_DESKTOP_SESSION_ID" ]; then DE=MATE;
					elif `dbus-send --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.GetNameOwner string:org.gnome.SessionManager > /dev/null 2>&1` ; then DE=GNOME;
					elif xprop -root _DT_SAVE_MODE 2> /dev/null | grep ' = \"xfce4\"$' >/dev/null 2>&1; then DE=Xfce;
					elif xprop -root 2> /dev/null | grep -i '^xfce_desktop_window' >/dev/null 2>&1; then DE=Xfce
					elif echo $DESKTOP | grep -q '^Enlightenment'; then DE=Enlightenment;
					fi
				fi

				case "$DESKTOP_SESSION" in
					gnome|gnome-fallback|gnome-fallback-compiz )
						DE=GNOME
						;;
					deepin)
						DE=Deepin
						;;
				esac

				if [ -n "$DE" ]; then
					# fallback to checking $DESKTOP_SESSION
					case "$DESKTOP_SESSION" in
						gnome)
							DE=GNOME;
							;;
						LUMINA|Lumina)
							DE=Lumina;
							;;
						LXDE|Lubuntu)
							DE=LXDE;
							;;
						MATE)
							DE=MATE;
							;;
						xfce|xfce4|'Xfce Session')
							DE=Xfce;
							;;
						'budgie-desktop')
							DE=Budgie
							;;
						Cinnamon)
							DE=Cinnamon
							;;
						trinity)
							DE=Trinity
							;;
					esac
				fi

				if [ -n "$DE" ]; then
					# fallback to checking $GDMSESSION
					case "$GDMSESSION" in
						Lumina*|LUMINA*|lumina*)
							DE=Lumina
							;;
						MATE|mate)
							DE=MATE
							;;
					esac
				fi

				if [[ ${DE} == "GNOME" ]]; then
					if type -p xprop >/dev/null 2>&1; then
						if xprop -name "unity-launcher" >/dev/null 2>&1; then
							DE="Unity"
						elif xprop -name "launcher" >/dev/null 2>&1 &&
							xprop -name "panel" >/dev/null 2>&1; then

							DE="Unity"
						fi
					fi
				fi

				if [[ ${DE} == "KDE" ]]; then
					if [[ -n ${KDE_SESSION_VERSION} ]]; then
						if [[ ${KDE_SESSION_VERSION} == '5' ]]; then
							DE="KDE5"
						elif [[ ${KDE_SESSION_VERSION} == '4' ]]; then
							DE="KDE4"
						fi
					elif [[ "x${KDE_FULL_SESSION}" == "xtrue" ]]; then
						DE="KDE"
						DEver_data=$(kded --version 2>/dev/null)
						DEver=$(grep -si '^KDE:' <<< "$DEver_data" | awk '{print $2}')
					fi
				fi
			fi

			if [[ ${DE} != "Not Present" ]]; then
				if [[ ${DE} == "Cinnamon" ]]; then
					if type -p >/dev/null 2>&1; then
						DEver=$(cinnamon --version)
						DE="${DE} ${DEver//* }"
					fi
				elif [[ ${DE} == "GNOME" ]]; then
					if type -p gnome-session >/dev/null 2>&1; then
						DEver=$(gnome-session --version 2> /dev/null)
						DE="${DE} ${DEver//* }"
					elif type -p gnome-session-properties >/dev/null 2>&1; then
						DEver=$(gnome-session-properties --version 2> /dev/null)
						DE="${DE} ${DEver//* }"
					fi
				elif [[ ${DE} == "KDE4" || ${DE} == "KDE5" ]]; then
					if type -p kded${DE#KDE} >/dev/null 2>&1; then
						DEver=$(kded${DE#KDE} --version)
						if [[ $(( $(echo "$DEver" | wc -w) )) -eq 2 ]] && [[ "$(echo "$DEver" | cut -d ' ' -f1)" == "kded${DE#KDE}" ]]; then
							DEver=$(echo "$DEver" | cut -d ' ' -f2)
							DE="KDE ${DEver}"
						else
							for l in $(echo "${DEver// /_}"); do
								if [[ ${l//:*} == "KDE_Development_Platform" ]]; then
									DEver=${l//*:_}
									DE="KDE ${DEver//_*}"
								fi
							done
						fi
						if pgrep plasmashell >/dev/null 2>&1; then
							DEver=$(plasmashell --version | cut -d ' ' -f2)
							DE="$DE / Plasma $DEver"
						fi
					fi
				elif [[ ${DE} == "Lumina" ]]; then
					if type -p Lumina-DE.real >/dev/null 2>&1; then
						lumina="$(type -p Lumina-DE.real)"
					elif type -p Lumina-DE >/dev/null 2>&1; then
						lumina="$(type -p Lumina-DE)"
					fi
					if [ -n "$lumina" ]; then
						if grep -e '--version' "$lumina" >/dev/null; then
							DEver=$("$lumina" --version 2>&1 | tr -d \")
							DE="${DE} ${DEver}"
						fi
					fi
				elif [[ ${DE} == "MATE" ]]; then
					if type -p mate-session >/dev/null 2>&1; then
						DEver=$(mate-session --version)
						DE="${DE} ${DEver//* }"
					fi
				elif [[ ${DE} == "Unity" ]]; then
					if type -p unity >/dev/null 2>&1; then
						DEver=$(unity --version)
						DE="${DE} ${DEver//* }"
					fi
				elif [[ ${DE} == "Deepin" ]]; then
					if [[ -f /etc/deepin-version ]]; then
						DEver="$(awk -F '=' '/Version/ {print $2}' /etc/deepin-version)"
						DE="${DE} ${DEver//* }"
					fi
				elif [[ ${DE} == "Trinity" ]]; then
					if type -p tde-config >/dev/null 2>&1; then
						DEver="$(tde-config --version | awk -F ' ' '/TDE:/ {print $2}')"
						DE="${DE} ${DEver//* }"
					fi
				fi
			fi

			if [[ "${DE}" == "Not Present" ]]; then
				if pgrep -U ${UID} lxsession >/dev/null 2>&1; then
					DE="LXDE"
					if type -p lxpanel >/dev/null 2>&1; then
						DEver=$(lxpanel -v)
						DE="${DE} $DEver"
					fi
				elif pgrep -U ${UID} lxqt-session >/dev/null 2>&1; then
					DE="LXQt"
				elif pgrep -U ${UID} razor-session >/dev/null 2>&1; then
					DE="RazorQt"
				elif pgrep -U ${UID} dtsession >/dev/null 2>&1; then
					DE="CDE"
				fi
			fi
		fi
	elif [[ "${distro}" == "Mac OS X" ]]; then
		if ps -U ${USER} | grep [F]inder >/dev/null 2>&1; then
			DE="Aqua"
		fi
	elif [[ "${distro}" == "Cygwin" || "${distro}" == "Msys" ]]; then
		# https://msdn.microsoft.com/en-us/library/ms724832%28VS.85%29.aspx
		if [ "$(wmic os get version | grep -o '^\(6\.[01]\)')" ]; then
			DE='Aero'
		elif [ "$(wmic os get version | grep -o '^\(6\.[23]\|10\)')" ]; then
			DE='Modern UI/Metro'
		else
			DE='Luna'
		fi
	fi
	verboseOut "Finding desktop environment...found as '$DE'"
}
### DE Detection - End