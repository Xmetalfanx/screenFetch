

takeShot () {
	if [[ -z $screenCommand ]]; then
		shotfiles[1]=${shotfile}
		if [ "$distro" == "Mac OS X" ]; then
			displays="$(system_profiler SPDisplaysDataType | grep 'Resolution:' | wc -l | tr -d ' ')"
			for (( i=2; i<=$displays; i++))
			do
				shotfiles[$i]="$(echo ${shotfile} | sed "s/\(.*\)\./\1_${i}./")"
			done
			printf "Taking shot in 3.. "; sleep 1; printf "2.. "; sleep 1; printf "1.. "; sleep 1; printf "0.\n"; screencapture -x ${shotfiles[@]} &> /dev/null
		else
			if type -p scrot >/dev/null 2>&1; then
				scrot -cd3 "${shotfile}"
			else
				errorOut "Cannot take screenshot! \`scrot' not in \$PATH"
			fi
		fi
		if [ -f "${shotfile}" ]; then
			verboseOut "Screenshot saved at '${shotfiles[@]}'"
			if [[ "${upload}" == "1" ]]; then
				if type -p curl >/dev/null 2>&1; then
					printf "${bold}==>${c0}  Uploading your screenshot now..."
					case "${uploadLoc}" in
						'teknik')
							baseurl='https://u.teknik.io'
							uploadurl='https://api.teknik.io/upload/post'
							ret=$(curl -sf -F file="@${shotfiles[@]}" ${uploadurl})
							desturl="${ret##*url\":\"}"
							desturl="${desturl%%\"*}"
							desturl="${desturl//\\}"
						;;
						'mediacrush')
							baseurl='https://mediacru.sh'
							uploadurl='https://mediacru.sh/api/upload/file'
							ret=$(curl -sf -F file="@${shotfiles[@]};type=image/png" ${uploadurl})
							filehash=$(echo "${ret}" | grep "hash" | cut -d '"' -f4)
							desturl="${baseurl}/${filehash}"
						;;
						'imgur')
							baseurl='http://imgur.com'
							uploadurl='http://imgur.com/upload'
							ret=$(curl -sf -F file="@${shotfiles[@]}" ${uploadurl})
							filehash="${ret##*hash\":\"}"
							filehash="${filehash%%\"*}"
							desturl="${baseurl}/${filehash}"
						;;
						'hmp')
							baseurl='http://i.hmp.me/m'
							uploadurl='http://hmp.me/ap/?uf=1'
							ret=$(curl -sf -F a="@${shotfiles[@]};type=image/png" ${uploadurl})
							desturl="${ret##*img_path\":\"}"
							desturl="${desturl%%\"*}"
							desturl="${desturl//\\}"
						;;
						'local-example')
							baseurl="http://www.example.com"
							serveraddr="www.example.com"
							scptimeout="20"
							serverdir="/path/to/directory"
							scp -qo ConnectTimeout="${scptimeout}" "${shotfiles[@]}" "${serveraddr}:${serverdir}"
							desturl="${baseurl}/${shotfile}"
						;;
					esac
					printf "your screenshot can be viewed at ${desturl}\n"
				else
					errorOut "Cannot upload screenshot! \`curl' not in \$PATH"
				fi
			fi
		else
			if type -p scrot >/dev/null 2>&1; then
				errorOut "ERROR: Problem saving screenshot to ${shotfiles[@]}"
			fi
		fi
	else
		$screenCommand
	fi
}
