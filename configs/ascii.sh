asciiText () {
# Distro logos and ASCII outputs
	if [[ "$asc_distro" ]]; then myascii="${asc_distro}"
	elif [[ "$art" ]]; then myascii="custom"
	elif [[ "$fake_distro" ]]; then myascii="${fake_distro}"
	else myascii="${distro}"; fi
	case ${myascii} in
		"custom") source "$art" ;;

		"ALDOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light grey') # light grey
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="27"
			fulloutput=(
"${c1}                           %s"
"${c1}           # ## #          %s"
"${c1}        # ######## #       %s"
"${c1}      # ### ######## #     %s"
"${c1}     # #### ######### #    %s"
"${c1}   # #### # # # # #### #   %s"
"${c1}  # ##### #       ##### #  %s"
"${c1}   # ###### ##### #### #   %s"
"${c1}    # ############### #    %s"
"${c1}                           %s"
"${c2}        _ ___   ___  ___   %s"
"${c2}   __ _| |   \ / _ \/ __|  %s"
"${c2}  / _' | | |) | (_) \__ \  %s"
"${c2}  \__,_|_|___/ \___/|___/  %s"
"${c1}                           %s"
"${c1}                           %s")
		;;

		"Alpine Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light
				c2=$(getColor 'blue') # Dark
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="34"
			fulloutput=(
"${c1}        ................          %s"
"${c1}       ∴::::::::::::::::∴         %s"
"${c1}      ∴::::::::::::::::::∴        %s"
"${c1}     ∴::::::::::::::::::::∴       %s"
"${c1}    ∴:::::::. :::::':::::::∴      %s"
"${c1}   ∴:::::::.   ;::; ::::::::∴     %s"
"${c1}  ∴::::::;      ∵     :::::::∴    %s"
"${c1} ∴:::::.     .         .::::::∴   %s"
"${c1} ::::::     :::.    .    ::::::   %s"
"${c1} ∵::::     ::::::.  ::.   ::::∵   %s"
"${c1}  ∵:..   .:;::::::: :::.  :::∵    %s"
"${c1}   ∵::::::::::::::::::::::::∵     %s"
"${c1}    ∵::::::::::::::::::::::∵      %s"
"${c1}     ∵::::::::::::::::::::∵       %s"
"${c1}      ::::::::::::::::::::        %s"
"${c1}       ∵::::::::::::::::∵         %s")
		;;

		"Arch Linux - Old")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c1}              __                     %s"
"${c1}          _=(SDGJT=_                 %s"
"${c1}        _GTDJHGGFCVS)                %s"
"${c1}       ,GTDJGGDTDFBGX0               %s"
"${c1}      JDJDIJHRORVFSBSVL${c2}-=+=,_        %s"
"${c1}     IJFDUFHJNXIXCDXDSV,${c2}  \"DEBL      %s"
"${c1}    [LKDSDJTDU=OUSCSBFLD.${c2}   '?ZWX,   %s"
"${c1}   ,LMDSDSWH'     \`DCBOSI${c2}     DRDS], %s"
"${c1}   SDDFDFH'         !YEWD,${c2}   )HDROD  %s"
"${c1}  !KMDOCG            &GSU|${c2}\_GFHRGO\'  %s"
"${c1}  HKLSGP'${c2}           __${c1}\TKM0${c2}\GHRBV)'  %s"
"${c1} JSNRVW'${c2}       __+MNAEC${c1}\IOI,${c2}\BN'     %s"
"${c1} HELK['${c2}    __,=OFFXCBGHC${c1}\FD)         %s"
"${c1} ?KGHE ${c2}\_-#DASDFLSV='${c1}    'EF         %s"
"${c1} 'EHTI                    !H         %s"
"${c1}  \`0F'                    '!         %s"
"${c1}                                     %s"
"${c1}                                     %s")
		;;

		"Arch Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light cyan') # Light
				c2=$(getColor 'cyan') # Dark
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="1"
			logowidth="38"
			fulloutput=(
"${c1}                   -\`                 "
"${c1}                  .o+\`                %s"
"${c1}                 \`ooo/                %s"
"${c1}                \`+oooo:               %s"
"${c1}               \`+oooooo:              %s"
"${c1}               -+oooooo+:             %s"
"${c1}             \`/:-:++oooo+:            %s"
"${c1}            \`/++++/+++++++:           %s"
"${c1}           \`/++++++++++++++:          %s"
"${c1}          \`/+++o${c2}oooooooo${c1}oooo/\`        %s"
"${c2}         ${c1}./${c2}ooosssso++osssssso${c1}+\`       %s"
"${c2}        .oossssso-\`\`\`\`/ossssss+\`      %s"
"${c2}       -osssssso.      :ssssssso.     %s"
"${c2}      :osssssss/        osssso+++.    %s"
"${c2}     /ossssssss/        +ssssooo/-    %s"
"${c2}   \`/ossssso+/:-        -:/+osssso+-  %s"
"${c2}  \`+sso+:-\`                 \`.-/+oso: %s"
"${c2} \`++:.                           \`-/+/%s"
"${c2} .\`                                 \`/%s")
		;;

		"Artix Linux")
			if [[ "$no_color" != "1" ]]; then				
				c1=$(getColor 'cyan')
				c2=$(getColor 'blue')
				c3=$(getColor 'green')
				c4=$(getColor 'dark gray')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_color}"; fi
			startline="1"
			logowidth="38"
			fulloutput=(""
"${c1}                        d${c2}c.           %s"
"${c1}                       x${c2}dc.           %s"
"${c1}                  '.${c4}.${c1} d${c2}dlc.           %s"
"${c1}                 c${c2}0d:${c1}o${c2}xllc;           %s"
"${c1}                :${c2}0ddlolc,lc,          %s"
"${c1}           :${c1}ko${c4}.${c1}:${c2}0ddollc..dlc.         %s"
"${c1}          ;${c1}K${c2}kxoOddollc'  cllc.        %s"
"${c1}         ,${c1}K${c2}kkkxdddllc,   ${c4}.${c2}lll:        %s"
"${c1}        ,${c1}X${c2}kkkddddlll;${c3}...';${c1}d${c2}llll${c3}dxk:   %s"
"${c1}       ,${c1}X${c2}kkkddddllll${c3}oxxxddo${c2}lll${c3}oooo,   %s"
"${c3}    xxk${c1}0${c2}kkkdddd${c1}o${c2}lll${c1}o${c3}ooooooolooooc;${c1}.   %s"
"${c3}    ddd${c2}kkk${c1}d${c2}ddd${c1}ol${c2}lc:${c3}:;,'.${c3}... .${c2}lll;     %s"
"${c1}   .${c3}xd${c1}x${c2}kk${c1}xd${c2}dl${c1}'cl:${c4}.           ${c2}.llc,    %s"
"${c1}   .${c1}0${c2}kkkxddl${c4}. ${c2};'${c4}.             ${c2};llc.   %s"
"${c1}  .${c1}K${c2}Okdcddl${c4}.                   ${c2}cllc${c4}.  %s"
"${c1}  0${c2}Okd''dc.                    .cll;  %s"
"${c1} k${c2}Okd'                          .llc, %s"
"${c1} d${c2}Od,                            'lc. %s"
"${c1} :,${c4}.                              ${c2}... %s"
"                                                   %s")
		;;

		"blackPanther OS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'yellow') # Light Yellow
				c2=$(getColor 'white') # Bold Red
				c3=$(getColor 'light red') # Light Red
				c4=$(getColor 'dark grey')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c4}                oxoo              %s"
"${c4}           ooooooxxxxxxxx         %s"
"${c4}      oooooxxxxxxxxxx${c3}O${c1}o.${c4}xx        %s"
"${c4}    oo# ###xxxxxxxxxxx###xxx      %s"
"${c4}  oo .oooooxxxxxxxxx##   #oxx     %s"
"${c4} o  ##xxxxxxxxx###x##   .o###     %s"
"${c4}  .oxxxxxxxx###   ox  .           %s"
"${c4} ooxxxx#xxxxxx     o##            %s"
"${c4}.oxx# #oxxxxx#                    %s"
"${c4}ox#  ooxxxxxx#                  o %s"
"${c4}x#  ooxxxxxxxx           ox     ox%s"
"${c4}x# .oxxxxxxxxxxx        o#     oox%s"
"${c4}#  oxxxxx##xxxxxxooooooo#      o# %s"
"${c4}  .oxxxxxooxxxxxx######       ox# %s"
"${c4}  oxxxxxo oxxxxxxxx         oox## %s"
"${c4}  oxxxxxx  oxxxxxxxxxo   oooox##  %s"
"${c4}   o#xxxxx  oxxxxxxxxxxxxxxxx##   %s"
"${c4}    ##xxxxx  o#xxxxxxxxxxxxx##    %s"
"${c4}      ##xxxx   o#xxxxxxxxx##      %s"
"${c4}         ###xo.  o##xxx###        %s"
"${c4}                                  %s")
			;;

		"Mint")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light green') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c2}                                      %s"
"${c2} MMMMMMMMMMMMMMMMMMMMMMMMMmds+.       %s"
"${c2} MMm----::-://////////////oymNMd+\`    %s"
"${c2} MMd      ${c1}/++                ${c2}-sNMd:   %s"
"${c2} MMNso/\`  ${c1}dMM    \`.::-. .-::.\` ${c2}.hMN:  %s"
"${c2} ddddMMh  ${c1}dMM   :hNMNMNhNMNMNh: ${c2}\`NMm  %s"
"${c2}     NMm  ${c1}dMM  .NMN/-+MMM+-/NMN\` ${c2}dMM  %s"
"${c2}     NMm  ${c1}dMM  -MMm  \`MMM   dMM. ${c2}dMM  %s"
"${c2}     NMm  ${c1}dMM  -MMm  \`MMM   dMM. ${c2}dMM  %s"
"${c2}     NMm  ${c1}dMM  .mmd  \`mmm   yMM. ${c2}dMM  %s"
"${c2}     NMm  ${c1}dMM\`  ..\`   ...   ydm. ${c2}dMM  %s"
"${c2}     hMM- ${c1}+MMd/-------...-:sdds  ${c2}dMM  %s"
"${c2}     -NMm- ${c1}:hNMNNNmdddddddddy/\`  ${c2}dMM  %s"
"${c2}      -dMNs-${c1}\`\`-::::-------.\`\`    ${c2}dMM  %s"
"${c2}       \`/dMNmy+/:-------------:/yMMM  %s"
"${c2}          ./ydNMMMMMMMMMMMMMMMMMMMMM  %s"
"${c2}             \.MMMMMMMMMMMMMMMMMMM    %s"
"${c2}                                      %s")
		;;

		"LMDE")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light green') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="31"
			fulloutput=(
"${c1}          \`.-::---..           %s"
"${c2}       .:++++ooooosssoo:.      %s"
"${c2}     .+o++::.      \`.:oos+.    %s"
"${c2}    :oo:.\`             -+oo${c1}:   %s"
"${c2}  ${c1}\`${c2}+o/\`    .${c1}::::::${c2}-.    .++-${c1}\`  %s"
"${c2} ${c1}\`${c2}/s/    .yyyyyyyyyyo:   +o-${c1}\`  %s"
"${c2} ${c1}\`${c2}so     .ss       ohyo\` :s-${c1}:  %s"
"${c2} ${c1}\`${c2}s/     .ss  h  m  myy/ /s\`${c1}\`  %s"
"${c2} \`s:     \`oo  s  m  Myy+-o:\`   %s"
"${c2} \`oo      :+sdoohyoydyso/.     %s"
"${c2}  :o.      .:////////++:       %s"
"${c2}  \`/++        ${c1}-:::::-          %s"
"${c2}   ${c1}\`${c2}++-                        %s"
"${c2}    ${c1}\`${c2}/+-                       %s"
"${c2}      ${c1}.${c2}+/.                     %s"
"${c2}        ${c1}.${c2}:+-.                  %s"
"${c2}           \`--.\`\`              %s"
"${c2}                               %s")
		;;

		"Ubuntu")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light red') # Light Red
				c3=$(getColor 'yellow') # Bold Yellow
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c2}                          ./+o+-      %s"
"${c1}                  yyyyy- ${c2}-yyyyyy+     %s"
"${c1}               ${c1}://+//////${c2}-yyyyyyo     %s"
"${c3}           .++ ${c1}.:/++++++/-${c2}.+sss/\`     %s"
"${c3}         .:++o:  ${c1}/++++++++/:--:/-     %s"
"${c3}        o:+o+:++.${c1}\`..\`\`\`.-/oo+++++/    %s"
"${c3}       .:+o:+o/.${c1}          \`+sssoo+/   %s"
"${c1}  .++/+:${c3}+oo+o:\`${c1}             /sssooo.  %s"
"${c1} /+++//+:${c3}\`oo+o${c1}               /::--:.  %s"
"${c1} \+/+o+++${c3}\`o++o${c2}               ++////.  %s"
"${c1}  .++.o+${c3}++oo+:\`${c2}             /dddhhh.  %s"
"${c3}       .+.o+oo:.${c2}          \`oddhhhh+   %s"
"${c3}        \+.++o+o\`${c2}\`-\`\`\`\`.:ohdhhhhh+    %s"
"${c3}         \`:o+++ ${c2}\`ohhhhhhhhyo++os:     %s"
"${c3}           .o:${c2}\`.syhhhhhhh/${c3}.oo++o\`     %s"
"${c2}               /osyyyyyyo${c3}++ooo+++/    %s"
"${c2}                   \`\`\`\`\` ${c3}+oo+++o\:    %s"
"${c3}                          \`oo++.      %s")
		;;

		"KDE neon")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="43"
			fulloutput=(
"${c1}              \`..---+/---..\`               %s"
"${c1}          \`---.\`\`   \`\`   \`.---.\`           %s"
"${c1}       .--.\`        \`\`        \`-:-.        %s"
"${c1}     \`:/:     \`.----//----.\`     :/-       %s"
"${c1}    .:.    \`---\`          \`--.\`    .:\`     %s"
"${c1}   .:\`   \`--\`                .:-    \`:.    %s"
"${c1}  \`/    \`:.      \`.-::-.\`      -:\`   \`/\`   %s"
"${c1}  /.    /.     \`:++++++++:\`     .:    .:   %s"
"${c1} \`/    .:     \`+++++++++++/      /\`   \`+\`  %s"
"${c1} /+\`   --     .++++++++++++\`     :.   .+:  %s"
"${c1} \`/    .:     \`+++++++++++/      /\`   \`+\`  %s"
"${c1}  /\`    /.     \`:++++++++:\`     .:    .:   %s"
"${c1}  ./    \`:.      \`.:::-.\`      -:\`   \`/\`   %s"
"${c1}   .:\`   \`--\`                .:-    \`:.    %s"
"${c1}    .:.    \`---\`          \`--.\`    .:\`     %s"
"${c1}     \`:/:     \`.----//----.\`     :/-       %s"
"${c1}       .-:.\`        \`\`        \`-:-.        %s"
"${c1}          \`---.\`\`   \`\`   \`.---.\`           %s"
"${c1}              \`..---+/---..\`               %s")
		;;

		"Debian")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="32"
			fulloutput=(
"${c1}         _,met\$\$\$\$\$gg.          %s"
"${c1}      ,g\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$P.       %s"
"${c1}    ,g\$\$P\"\"       \"\"\"Y\$\$.\".     %s"
"${c1}   ,\$\$P'              \`\$\$\$.     %s"
"${c1}  ',\$\$P       ,ggs.     \`\$\$b:   %s"
"${c1}  \`d\$\$'     ,\$P\"\'   ${c2}.${c1}    \$\$\$    %s"
"${c1}   \$\$P      d\$\'     ${c2},${c1}    \$\$P    %s"
"${c1}   \$\$:      \$\$.   ${c2}-${c1}    ,d\$\$'    %s"
"${c1}   \$\$\;      Y\$b._   _,d\$P'     %s"
"${c1}   Y\$\$.    ${c2}\`.${c1}\`\"Y\$\$\$\$P\"'         %s"
"${c1}   \`\$\$b      ${c2}\"-.__              %s"
"${c1}    \`Y\$\$                        %s"
"${c1}     \`Y\$\$.                      %s"
"${c1}       \`\$\$b.                    %s"
"${c1}         \`Y\$\$b.                 %s"
"${c1}            \`\"Y\$b._             %s"
"${c1}                \`\"\"\"\"           %s"
"${c1}                                %s")
		;;

		"Proxmox VE")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white')
				c2=$(getColor 'orange')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="48"
			fulloutput=(
"${c1}           .://:\`              \`://:.           %s"
"${c1}         \`hMMMMMMd/          /dMMMMMMh\`         %s"
"${c1}          \`sMMMMMMMd:      :mMMMMMMMs\`          %s"
"${c2}  \`-/+oo+/:${c1}\`.yMMMMMMMh-  -hMMMMMMMy.\`${c2}:/+oo+/-\`  %s"
"${c2}  \`:oooooooo/${c1}\`-hMMMMMMMyyMMMMMMMh-\`${c2}/oooooooo:\`  %s"
"${c2}    \`/oooooooo:${c1}\`:mMMMMMMMMMMMMm:\`${c2}:oooooooo/\`    %s"
"${c2}      ./ooooooo+-${c1} +NMMMMMMMMN+ ${c2}-+ooooooo/.      %s"
"${c2}        .+ooooooo+-${c1}\`oNMMMMNo\`${c2}-+ooooooo+.        %s"
"${c2}          -+ooooooo/.${c1}\`sMMs\`${c2}./ooooooo+-          %s"
"${c2}            :oooooooo/${c1}\`..\`${c2}/oooooooo:            %s"
"${c2}            :oooooooo/\`${c1}..${c2}\`/oooooooo:            %s"
"${c2}          -+ooooooo/.${c1}\`sMMs${c2}\`./ooooooo+-          %s"
"${c2}        .+ooooooo+-\`${c1}oNMMMMNo${c2}\`-+ooooooo+.        %s"
"${c2}      ./ooooooo+-${c1} +NMMMMMMMMN+ ${c2}-+ooooooo/.      %s"
"${c2}    \`/oooooooo:\`${c1}:mMMMMMMMMMMMMm:${c2}\`:oooooooo/\`    %s"
"${c2}  \`:oooooooo/\`${c1}-hMMMMMMMyyMMMMMMMh-${c2}\`/oooooooo:\`  %s"
"${c2}  \`-/+oo+/:\`${c1}.yMMMMMMMh-  -hMMMMMMMy.${c2}\`:/+oo+/-\`  %s"
"${c1}          \`sMMMMMMMm:      :dMMMMMMMs          %s"
"${c1}         \`hMMMMMMd/          /dMMMMMMh         %s"
"${c1}           \`://:\`              \`://:\`           %s")
		;;

		"Siduction")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="35"
			fulloutput=(
"${c1}               _ass,,                %s"
"${c1}              jmk  dm.               %s"
"${c1}              3##qwm#\`               %s"
"${c1}          .    \"9XZ?\` _aas,          %s"
"${c1}        ap!!n,      _dW(--\$a         %s"
"${c1}       )#hc_m#      ]mmwaam#\`        %s"
"${c1}        ?##WZ^      -4#####! _as,.   %s"
"${c1}  _ais,   -   _au11a. -\"\"\" <m#\"\"\"Wc  %s"
"${c1} )m6_]m,      m#c__m6     :m#m,_<m#> %s"
"${c1} -Y#m#!       4###m#r     -\$##mBm#Z\` %s"
"${c1}    -    _as,. \"???~ _aawa,.!S##Z?\`  %s"
"${c1}        ym= 3h.     <##' -Wo         %s"
"${c1}        \$#mm#D\`     ]B#qww##         %s"
"${c1}         \"?!\"\`  _s,.-?#m##T'         %s"
"${c1}              _dZ\"\"4a  --            %s"
"${c1}              3Wmaam#;               %s"
"${c1}              -9###Z!                %s")

		;;

		"Devuan")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light purple') # Light purple
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="36"
			fulloutput=(
"${c1}                                    %s"
"${c1}     ..,,;;;::;,..                  %s"
"${c1}             \`':ddd;:,.             %s"
"${c1}                   \`'dPPd:,.        %s"
"${c1}                       \`:b\$\$b\`.     %s"
"${c1}                          'P\$\$\$d\`   %s"
"${c1}                           .\$\$\$\$\$\`  %s"
"${c1}                           ;\$\$\$\$\$P  %s"
"${c1}                        .:P\$\$\$\$\$\$\`  %s"
"${c1}                    .,:b\$\$\$\$\$\$\$;'   %s"
"${c1}               .,:dP\$\$\$\$\$\$\$\$b:'     %s"
"${c1}        .,:;db\$\$\$\$\$\$\$\$\$\$Pd'\`        %s"
"${c1}   ,db\$\$\$\$\$\$\$\$\$\$\$\$\$\$b:'\`            %s"
"${c1}  :\$\$\$\$\$\$\$\$\$\$\$\$b:'\`                 %s"
"${c1}   \`\$\$\$\$\$bd:''\`                     %s"
"${c1}     \`'''\`                          %s"
"${c1}                                    %s")
		;;

		"Raspbian")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Light Green
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="32"
			fulloutput=(
"${c1}    .',;:cc;,'.    .,;::c:,,.   %s"
"${c1}   ,ooolcloooo:  'oooooccloo:   %s"
"${c1}   .looooc;;:ol  :oc;;:ooooo'   %s"
"${c1}     ;oooooo:      ,ooooooc.    %s"
"${c1}       .,:;'.       .;:;'.      %s"
"${c2}       .dQ. .d0Q0Q0. '0Q.       %s"
"${c2}     .0Q0'   'Q0Q0Q'  'Q0Q.     %s"
"${c2}     ''  .odo.    .odo.  ''     %s"
"${c2}    .  .0Q0Q0Q'  .0Q0Q0Q.  .    %s"
"${c2}  ,0Q .0Q0Q0Q0Q  'Q0Q0Q0b. 0Q.  %s"
"${c2}  :Q0  Q0Q0Q0Q    'Q0Q0Q0  Q0'  %s"
"${c2}  '0    '0Q0' .0Q0. '0'    'Q'  %s"
"${c2}    .oo.     .0Q0Q0.    .oo.    %s"
"${c2}    'Q0Q0.  '0Q0Q0Q0. .Q0Q0b    %s"
"${c2}     'Q0Q0.  '0Q0Q0' .d0Q0Q'    %s"
"${c2}      'Q0Q'    ..    '0Q.'      %s"
"${c2}            .0Q0Q0Q.            %s"
"${c2}             '0Q0Q'             %s")
		;;

		"CrunchBang")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c1}                                      %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}  ████████████████████████████   ███  %s"
"${c1}  ████████████████████████████   ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}  ████████████████████████████   ███  %s"
"${c1}  ████████████████████████████   ███  %s"
"${c1}         ███        ███               %s"
"${c1}         ███        ███               %s"
"${c1}         ███        ███          ███  %s"
"${c1}         ███        ███          ███  %s"
"${c1}                                      %s")
		;;

		"CRUX")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light cyan')
				c2=$(getColor 'yellow')
				c3=$(getColor 'white')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="1"
			logowidth="27"
			fulloutput=(""
"${c1}          odddd            "
"${c1}       oddxkkkxxdoo        %s"
"${c1}      ddcoddxxxdoool       %s"
"${c1}      xdclodod  olol       %s"
"${c1}      xoc  xdd  olol       %s"
"${c1}      xdc  ${c2}k00${c1}Okdlol       %s"
"${c1}      xxd${c2}kOKKKOkd${c1}ldd       %s"
"${c1}      xdco${c2}xOkdlo${c1}dldd       %s"
"${c1}      ddc:cl${c2}lll${c1}oooodo      %s"
"${c1}    odxxdd${c3}xkO000kx${c1}ooxdo    %s"
"${c1}   oxdd${c3}x0NMMMMMMWW0od${c1}kkxo  %s"
"${c1}  oooxd${c3}0WMMMMMMMMMW0o${c1}dxkx  %s"
"${c1} docldkXW${c3}MMMMMMMWWN${c1}Odolco  %s"
"${c1} xx${c2}dx${c1}kxxOKN${c3}WMMWN${c1}0xdoxo::c  %s"
"${c2} xOkkO${c1}0oo${c3}odOW${c2}WW${c1}XkdodOxc:l  %s"
"${c2} dkkkxkkk${c3}OKX${c2}NNNX0Oxx${c1}xc:cd  %s"
"${c2}  odxxdx${c3}xllod${c2}ddooxx${c1}dc:ldo  %s"
"${c2}    lodd${c1}dolccc${c2}ccox${c1}xoloo    %s"
"${c1}                           %s")
		;;

		"Chrome OS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'green') # Green
				c2=$(getColor 'light red') # Light Red
				c3=$(getColor 'yellow') # Bold Yellow
				c4=$(getColor 'light blue') # Light Blue
				c5=$(getColor 'white') # White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; c5="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c2}             .,:loool:,.              %s"
"${c2}         .,coooooooooooooc,.          %s"
"${c2}      .,lllllllllllllllllllll,.       %s"
"${c2}     ;ccccccccccccccccccccccccc;      %s"
"${c1}   '${c2}ccccccccccccccccccccccccccccc.    %s"
"${c1}  ,oo${c2}c::::::::okO${c5}000${c3}0OOkkkkkkkkkkk:   %s"
"${c1} .ooool${c2};;;;:x${c5}K0${c4}kxxxxxk${c5}0X${c3}K0000000000.  %s"
"${c1} :oooool${c2};,;O${c5}K${c4}ddddddddddd${c5}KX${c3}000000000d  %s"
"${c1} lllllool${c2};l${c5}N${c4}dllllllllllld${c5}N${c3}K000000000  %s"
"${c1} lllllllll${c2}o${c5}M${c4}dccccccccccco${c5}W${c3}K000000000  %s"
"${c1} ;cllllllllX${c5}X${c4}c:::::::::c${c5}0X${c3}000000000d  %s"
"${c1} .ccccllllllO${c5}Nk${c4}c;,,,;cx${c5}KK${c3}0000000000.  %s"
"${c1}  .cccccclllllxOO${c5}OOO${c1}Okx${c3}O0000000000;   %s"
"${c1}   .:ccccccccllllllllo${c3}O0000000OOO,    %s"
"${c1}     ,:ccccccccclllcd${c3}0000OOOOOOl.     %s"
"${c1}       '::ccccccccc${c3}dOOOOOOOkx:.       %s"
"${c1}         ..,::cccc${c3}xOOOkkko;.          %s"
"${c1}             ..,:${c3}dOkxl:.              %s")
		;;

		"DesaOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') #Hijau
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="33"
			fulloutput=(
"${c1} ███████████████████████         %s"
"${c1} ███████████████████████         %s"
"${c1} ███████████████████████         %s"
"${c1} ███████████████████████         %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ████████               ███████  %s"
"${c1} ██████████████████████████████  %s"
"${c1} ██████████████████████████████  %s"
"${c1} ████████████████████████        %s"
"${c1} ████████████████████████        %s"
"${c1} ████████████████████████        %s"
"                                      %s")
		;;

		"Gentoo")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light purple') # Light Purple
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c2}         -/oyddmdhs+:.               %s"
"${c2}     -o${c1}dNMMMMMMMMNNmhy+${c2}-\`            %s"
"${c2}   -y${c1}NMMMMMMMMMMMNNNmmdhy${c2}+-          %s"
"${c2} \`o${c1}mMMMMMMMMMMMMNmdmmmmddhhy${c2}/\`       %s"
"${c2} om${c1}MMMMMMMMMMMN${c2}hhyyyo${c1}hmdddhhhd${c2}o\`     %s"
"${c2}.y${c1}dMMMMMMMMMMd${c2}hs++so/s${c1}mdddhhhhdm${c2}+\`   %s"
"${c2} oy${c1}hdmNMMMMMMMN${c2}dyooy${c1}dmddddhhhhyhN${c2}d.  %s"
"${c2}  :o${c1}yhhdNNMMMMMMMNNNmmdddhhhhhyym${c2}Mh  %s"
"${c2}    .:${c1}+sydNMMMMMNNNmmmdddhhhhhhmM${c2}my  %s"
"${c2}       /m${c1}MMMMMMNNNmmmdddhhhhhmMNh${c2}s:  %s"
"${c2}    \`o${c1}NMMMMMMMNNNmmmddddhhdmMNhs${c2}+\`   %s"
"${c2}  \`s${c1}NMMMMMMMMNNNmmmdddddmNMmhs${c2}/.     %s"
"${c2} /N${c1}MMMMMMMMNNNNmmmdddmNMNdso${c2}:\`       %s"
"${c2}+M${c1}MMMMMMNNNNNmmmmdmNMNdso${c2}/-          %s"
"${c2}yM${c1}MNNNNNNNmmmmmNNMmhs+/${c2}-\`            %s"
"${c2}/h${c1}MMNNNNNNNNMNdhs++/${c2}-\`               %s"
"${c2}\`/${c1}ohdmmddhys+++/:${c2}.\`                  %s"
"${c2}  \`-//////:--.                       %s")
		;;

		"Funtoo")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light purple') # Light Purple
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="52"
			fulloutput=(
"${c1}                                                    %s"
"${c1}                                                    %s"
"${c1}                                                    %s"
"${c1}                                                    %s"
"${c1}     _______               ____                     %s"
"${c1}    /MMMMMMM/             /MMMM| _____  _____       %s"
"${c1} __/M${c2}.MMM.${c1}M/_____________|M${c2}.M${c1}MM|/MMMMM\/MMMMM\      %s"
"${c1}|MMMM${c2}MM'${c1}MMMMMMMMMMMMMMMMMMM${c2}MM${c1}MMMM${c2}.MMMM..MMMM.${c1}MM\    %s"
"${c1}|MM${c2}MMMMMMM${c1}/m${c2}MMMMMMMMMMMMMMMMMMMMMM${c1}MMMM${c2}MM${c1}MMMM${c2}MM${c1}MM|   %s"
"${c1}|MMMM${c2}MM${c1}MMM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MM${c1}MMMMM${c2}\MMM${c1}MMM${c2}MM${c1}MMMM${c2}MM${c1}MMMM${c2}MM${c1}MM|   %s"
"${c1}  |MM${c2}MM${c1}MMM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MMM${c1}MMMM${c2}'MMMM''MMMM'${c1}MM/    %s"
"${c1}  |MM${c2}MM${c1}MMM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MMM${c1}MMM\MMMMM/\MMMMM/      %s"
"${c1}  |MM${c2}MM${c1}MMM${c2}MM${c1}MMMMMM${c2}MM${c1}MM${c2}MM${c1}MM${c2}MMMMM'${c1}M|                  %s"
"${c1}  |MM${c2}MM${c1}MMM${c2}MMMMMMMMMMMMMMMMM MM'${c1}M/                   %s"
"${c1}  |MMMMMMMMMMMMMMMMMMMMMMMMMMMM/                    %s"
"${c1}                                                    %s"
"${c1}                                                    %s"
"${c1}                                                    %s")
		;;

		"Kogaion")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="41"
			fulloutput=(
"${c1}                  ;;      ,;             %s"
"${c1}                 ;;;     ,;;             %s"
"${c1}               ,;;;;     ;;;;            %s"
"${c1}            ,;;;;;;;;    ;;;;            %s"
"${c1}           ;;;;;;;;;;;   ;;;;;           %s"
"${c1}          ,;;;;;;;;;;;;  ';;;;;,         %s"
"${c1}          ;;;;;;;;;;;;;;, ';;;;;;;       %s"
"${c1}          ;;;;;;;;;;;;;;;;;, ';;;;;      %s"
"${c1}      ;    ';;;;;;;;;;;;;;;;;;, ;;;      %s"
"${c1}      ;;;,  ';;;;;;;;;;;;;;;;;;;,;;      %s"
"${c1}      ;;;;;,  ';;;;;;;;;;;;;;;;;;,       %s"
"${c1}      ;;;;;;;;,  ';;;;;;;;;;;;;;;;,      %s"
"${c1}      ;;;;;;;;;;;;, ';;;;;;;;;;;;;;      %s"
"${c1}      ';;;;;;;;;;;;; ';;;;;;;;;;;;;      %s"
"${c1}       ';;;;;;;;;;;;;, ';;;;;;;;;;;      %s"
"${c1}        ';;;;;;;;;;;;;  ;;;;;;;;;;       %s"
"${c1}          ';;;;;;;;;;;; ;;;;;;;;         %s"
"${c1}              ';;;;;;;; ;;;;;;           %s"
"${c1}                 ';;;;; ;;;;             %s"
"${c1}                   ';;; ;;               %s")
		;;

		"Fedora")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c2}           /:-------------:\         %s"
"${c2}        :-------------------::       %s"
"${c2}      :-----------${c1}/shhOHbmp${c2}---:\\     %s"
"${c2}    /-----------${c1}omMMMNNNMMD  ${c2}---:    %s"
"${c2}   :-----------${c1}sMMMMNMNMP${c2}.    ---:   %s"
"${c2}  :-----------${c1}:MMMdP${c2}-------    ---\  %s"
"${c2} ,------------${c1}:MMMd${c2}--------    ---:  %s"
"${c2} :------------${c1}:MMMd${c2}-------    .---:  %s"
"${c2} :----    ${c1}oNMMMMMMMMMNho${c2}     .----:  %s"
"${c2} :--     .${c1}+shhhMMMmhhy++${c2}   .------/  %s"
"${c2} :-    -------${c1}:MMMd${c2}--------------:   %s"
"${c2} :-   --------${c1}/MMMd${c2}-------------;    %s"
"${c2} :-    ------${c1}/hMMMy${c2}------------:     %s"
"${c2} :--${c1} :dMNdhhdNMMNo${c2}------------;      %s"
"${c2} :---${c1}:sdNMMMMNds:${c2}------------:       %s"
"${c2} :------${c1}:://:${c2}-------------::         %s"
"${c2} :---------------------://           %s"
"${c2}                                     %s")
		;;

		"Fux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			fulloutput=(
"${c2}           --/+osssso+/--           %s"
"${c2}        -/oshhhhhhhhhhhhso/-        %s"
"${c2}      :oyhhhhhso+//+oshhhhhso:      %s"
"${c2}    -+yhhhh+.   ss+/   .+hhhhs+-    %s"
"${c2}   :/hhhh/     shhhy/     /hhhh/:   %s"
"${c2}  ./hhhh- .++:..dhhb..:++. -hhhh/.  %s"
"${c2}  +ohhh: -hoyhohhoohhohyoh- :hhho+  %s"
"${c2}  /hhhh   shhy-ohyyho-yhhs   hhhh/  %s"
"${c2}  /hhhh    shy\+hhhh+/yhs    hhhh/  %s"
"${c2}  +ohhh:  .:d. +:ys:+ .b:.  :hhho+  %s"
"${c2}  ./hhhh- do  /  oo  \  ob -hhhh/.  %s"
"${c2}   :/hhhh/   -   ss   -   /hhhh/:   %s"
"${c2}    -+shhhh+.    //    .+hhhhs+-    %s"
"${c2}      :oshhhhhso+//+oshhhhhso:      %s"
"${c2}        -/oshhhhhhhhhhhhso/-        %s"
"${c2}           --/+osssso+/--           %s")
		;;

		"Chapeau")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light green') # Light Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="35"
			fulloutput=(
"${c2}               .-/-.               %s"
"${c2}             ////////.             %s"
"${c2}           ////////${c1}y+${c2}//.           %s"
"${c2}         ////////${c1}mMN${c2}/////.         %s"
"${c2}       ////////${c1}mMN+${c2}////////.       %s"
"${c2}     ////////////////////////.     %s"
"${c2}   /////////+${c1}shhddhyo${c2}+////////.    %s"
"${c2}  ////////${c1}ymMNmdhhdmNNdo${c2}///////.   %s"
"${c2} ///////+${c1}mMms${c2}////////${c1}hNMh${c2}///////.  %s"
"${c2} ///////${c1}NMm+${c2}//////////${c1}sMMh${c2}///////  %s"
"${c2} //////${c1}oMMNmmmmmmmmmmmmMMm${c2}///////  %s"
"${c2} //////${c1}+MMmssssssssssssss+${c2}///////  %s"
"${c2} \`//////${c1}yMMy${c2}////////////////////   %s"
"${c2}  \`//////${c1}smMNhso++oydNm${c2}////////    %s"
"${c2}   \`///////${c1}ohmNMMMNNdy+${c2}///////     %s"
"${c2}     \`//////////${c1}++${c2}//////////       %s"
"${c2}        \`////////////////.         %s"
"${c2}            -////////-             %s"
"${c2}                                   %s")
		;;

		"Korora")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white')
				c2=$(getColor 'light blue')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="32"
			fulloutput=(
"${c1}                 ____________   %s"
"${c1}              _add55555555554${c2}:  %s"
"${c1}            _w?'${c2}\`\`\`\`\`\`\`\`\`\`'${c1})k${c2}:  %s"
"${c1}           _Z'${c2}\`${c1}            ]k${c2}:  %s"
"${c1}           m(${c2}\`${c1}             )k${c2}:  %s"
"${c1}      _.ss${c2}\`${c1}m[${c2}\`${c1},            ]e${c2}:  %s"
"${c1}    .uY\"^\`${c2}\`${c1}Xc${c2}\`${c1}?Ss.         d(${c2}\`  %s"
"${c1}   jF'${c2}\`${c1}    \`@.  ${c2}\`${c1}Sc      .jr${c2}\`   %s"
"${c1}  jr${c2}\`${c1}       \`?n_ ${c2}\`${c1}$;   _a2\"${c2}\`    %s"
"${c1} .m${c2}:${c1}          \`~M${c2}\`${c1}1k${c2}\`${c1}5?!\`${c2}\`      %s"
"${c1} :#${c2}:${c1}             ${c2}\`${c1})e${c2}\`\`\`         %s"
"${c1} :m${c2}:${c1}             ,#'${c2}\`           %s"
"${c1} :#${c2}:${c1}           .s2'${c2}\`            %s"
"${c1} :m,________.aa7^${c2}\`              %s"
"${c1} :#baaaaaaas!J'${c2}\`                %s"
"${c2}  \`\`\`\`\`\`\`\`\`\`\`                   %s")
		;;

		"gNewSense")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="52"
			fulloutput=(
"${c1}                      ..,,,,..                      %s"
"${c1}                .oocchhhhhhhhhhccoo.                %s"
"${c1}         .ochhlllllllc hhhhhh ollllllhhco.          %s"
"${c1}     ochlllllllllll hhhllllllhhh lllllllllllhco     %s"
"${c1}  .cllllllllllllll hlllllo  +hllh llllllllllllllc.  %s"
"${c1} ollllllllllhco\'\'  hlllllo  +hllh  \`\`ochllllllllllo %s"
"${c1} hllllllllc\'       hllllllllllllh       \`cllllllllh %s"
"${c1} ollllllh          +llllllllllll+          hllllllo %s"
"${c1}  \`cllllh.           ohllllllho           .hllllc\'  %s"
"${c1}     ochllc.            ++++            .cllhco     %s"
"${c1}        \`+occooo+.                .+ooocco+\'        %s"
"${c1}               \`+oo++++      ++++oo+\'               %s"
"${c1}                                                    %s")
		;;

		"BLAG")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light purple')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="36"
			fulloutput=(
"${c1}              d                     %s"
"${c1}             ,MK:                   %s"
"${c1}             xMMMX:                 %s"
"${c1}            .NMMMMMX;               %s"
"${c1}            lMMMMMMMM0clodkO0KXWW:  %s"
"${c1}            KMMMMMMMMMMMMMMMMMMX'   %s"
"${c1}       .;d0NMMMMMMMMMMMMMMMMMMK.    %s"
"${c1}  .;dONMMMMMMMMMMMMMMMMMMMMMMx      %s"
"${c1} 'dKMMMMMMMMMMMMMMMMMMMMMMMMl       %s"
"${c1}    .:xKWMMMMMMMMMMMMMMMMMMM0.      %s"
"${c1}        .:xNMMMMMMMMMMMMMMMMMK.     %s"
"${c1}           lMMMMMMMMMMMMMMMMMMK.    %s"
"${c1}           ,MMMMMMMMWkOXWMMMMMM0    %s"
"${c1}           .NMMMMMNd.     \`':ldko   %s"
"${c1}            OMMMK:                  %s"
"${c1}            oWk,                    %s"
"${c1}            ;:                      %s")
		;;

		"FreeBSD")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # white
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c1}                                     %s"
"${c1}   \`\`\`                        ${c2}\`      %s"
"${c1}  \` \`.....---...${c2}....--.\`\`\`   -/      %s"
"${c1}  +o   .--\`         ${c2}/y:\`      +.     %s"
"${c1}   yo\`:.            ${c2}:o      \`+-      %s"
"${c1}    y/               ${c2}-/\`   -o/       %s"
"${c1}   .-                  ${c2}::/sy+:.      %s"
"${c1}   /                     ${c2}\`--  /      %s"
"${c1}  \`:                          ${c2}:\`     %s"
"${c1}  \`:                          ${c2}:\`     %s"
"${c1}   /                          ${c2}/      %s"
"${c1}   .-                        ${c2}-.      %s"
"${c1}    --                      ${c2}-.       %s"
"${c1}     \`:\`                  ${c2}\`:\`        %s"
"${c2}       .--             \`--.          %s"
"${c2}          .---.....----.             %s"
"${c2}                                     %s"
"${c2}                                     %s")
		;;

		"FreeBSD - Old")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # white
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="34"
			fulloutput=(
"${c2}              ,        ,          %s"
"${c2}             /(        )\`         %s"
"${c2}             \ \___   / |         %s"
"${c2}             /- ${c1}_${c2}  \`-/  '         %s"
"${c2}            (${c1}/\/ \ ${c2}\   /\\         %s"
"${c1}            / /   |${c2} \`    \\        %s"
"${c1}            O O   )${c2} /    |        %s"
"${c1}            \`-^--'\`${c2}<     '        %s"
"${c2}           (_.)  _  )   /         %s"
"${c2}            \`.___/\`    /          %s"
"${c2}              \`-----' /           %s"
"${c1} <----.     ${c2}__/ __   \\            %s"
"${c1} <----|====${c2}O}}}${c1}==${c2}} \} \/${c1}====      %s"
"${c1} <----'    ${c2}\`--' \`.__,' \\          %s"
"${c2}              |        |          %s"
"${c2}               \       /       /\\ %s"
"${c2}          ______( (_  / \______/  %s"
"${c2}        ,'  ,-----'   |           %s"
"${c2}        \`--{__________)           %s"
"${c2}                                  %s")
		;;

		"OpenBSD")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'yellow') # Light Yellow
				c2=$(getColor 'brown') # Bold Yellow
				c3=$(getColor 'light cyan') # Light Cyan
				c4=$(getColor 'light red') # Light Red
				c5=$(getColor 'dark grey')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; c5="${my_lcolor}"; fi
			startline="3"
			logowidth="44"
			fulloutput=(
"${c3}                                        _   "
"${c3}                                       (_)  "
"${c1}              |    .                        "
"${c1}          .   |L  /|   .         ${c3} _         %s"
"${c1}      _ . |\ _| \--+._/| .       ${c3}(_)        %s"
"${c1}     / ||\| Y J  )   / |/| ./               %s"
"${c1}    J  |)'( |        \` F\`.'/       ${c3} _       %s"
"${c1}  -<|  F         __     .-<        ${c3}(_)      %s"
"${c1}    | /       .-'${c3}. ${c1}\`.  /${c3}-. ${c1}L___             %s"
"${c1}    J \      <    ${c3}\ ${c1} | | ${c5}O${c3}\\\\${c1}|.-' ${c3} _          %s"
"${c1}  _J \  .-    \\\\${c3}/ ${c5}O ${c3}| ${c1}| \  |${c1}F    ${c3}(_)         %s"
"${c1} '-F  -<_.     \   .-'  \`-' L__             %s"
"${c1}__J  _   _.     >-'  ${c2})${c4}._.   ${c1}|-'             %s"
"${c1} \`-|.'   /_.          ${c4}\_|  ${c1} F               %s"
"${c1}  /.-   .                _.<                %s"
"${c1} /'    /.'             .'  \`\               %s"
"${c1}  /L  /'   |/      _.-'-\                   %s"
"${c1} /'J       ___.---'\|                       %s"
"${c1}   |\  .--' V  | \`. \`                       %s"
"${c1}   |/\`. \`-.     \`._)                        %s"
"${c1}      / .-.\                                %s"
"${c1}      \ (  \`\                               %s"
"${c1}       \`.\                                  %s")
		;;

		"DragonFlyBSD")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light red') # Red
				c2=$(getColor 'white') # White
				c3=$(getColor 'yellow')
				c4=$(getColor 'light red')
			fi
            if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="0"
			logowidth="43"
			fulloutput=(
"${c1}                      |                    %s"
"${c1}                     .-.                   %s"
"${c3}                    ()${c1}I${c3}()                  %s"
"${c1}               \"==.__:-:__.==\"             %s"
"${c1}              \"==.__/~|~\__.==\"            %s"
"${c1}              \"==._(  Y  )_.==\"            %s"
"${c2}   .-'~~\"\"~=--...,__${c1}\/|\/${c2}__,...--=~\"\"~~'-. %s"
"${c2}  (               ..=${c1}\\\\=${c1}/${c2}=..               )%s"
"${c2}   \`'-.        ,.-\"\`;${c1}/=\\\\${c2} ;\"-.,_        .-'\`%s"
"${c2}       \`~\"-=-~\` .-~\` ${c1}|=|${c2} \`~-. \`~-=-\"~\`     %s"
"${c2}            .-~\`    /${c1}|=|${c2}\    \`~-.          %s"
"${c2}         .~\`       / ${c1}|=|${c2} \       \`~.       %s"
"${c2}     .-~\`        .'  ${c1}|=|${c2}  \\\\\`.        \`~-.  %s"
"${c2}   (\`     _,.-=\"\`    ${c1}|=|${c2}    \`\"=-.,_     \`) %s"
"${c2}    \`~\"~\"\`           ${c1}|=|${c2}           \`\"~\"~\`  %s"
"${c1}                     /=\                   %s"
"${c1}                     \=/                   %s"
"${c1}                      ^                    %s")
		;;

		"NetBSD")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'orange') # Orange
				c2=$(getColor 'white') # White
			fi
            if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="60"
			fulloutput=(
"${c1}                                  __,gnnnOCCCCCOObaau,_     %s"
"${c2}   _._                    ${c1}__,gnnCCCCCCCCOPF\"''              %s"
"${c2}  (N\\\\\\\\${c1}XCbngg,._____.,gnnndCCCCCCCCCCCCF\"___,,,,___          %s"
"${c2}   \\\\N\\\\\\\\${c1}XCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCOOOOPYvv.     %s"
"${c2}    \\\\N\\\\\\\\${c1}XCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCPF\"''               %s"
"${c2}     \\\\N\\\\\\\\${c1}XCCCCCCCCCCCCCCCCCCCCCCCCCOF\"'                     %s"
"${c2}      \\\\N\\\\\\\\${c1}XCCCCCCCCCCCCCCCCCCCCOF\"'                         %s"
"${c2}       \\\\N\\\\\\\\${c1}XCCCCCCCCCCCCCCCPF\"'                             %s"
"${c2}        \\\\N\\\\\\\\${c1}\"PCOCCCOCCFP\"\"                                  %s"
"${c2}         \\\\N\                                                %s"
"${c2}          \\\\N\                                               %s"
"${c2}           \\\\N\                                              %s"
"${c2}            \\\\NN\                                            %s"
"${c2}             \\\\NN\                                           %s"
"${c2}              \\\\NNA.                                         %s"
"${c2}               \\\\NNA,                                        %s"
"${c2}                \\\\NNN,                                       %s"
"${c2}                 \\\\NNN\                                      %s"
"${c2}                  \\\\NNN\                                     %s"
"${c2}                   \\\\NNNA                                    %s")
		;;

		"Mandriva"|"Mandrake")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
				c2=$(getColor 'yellow') # Bold Yellow
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="41"
			fulloutput=(
"${c2}                                         %s"
"${c2}                         \`\`              %s"
"${c2}                        \`-.              %s"
"${c1}       \`               ${c2}.---              %s"
"${c1}     -/               ${c2}-::--\`             %s"
"${c1}   \`++    ${c2}\`----...\`\`\`-:::::.             %s"
"${c1}  \`os.      ${c2}.::::::::::::::-\`\`\`     \`  \` %s"
"${c1}  +s+         ${c2}.::::::::::::::::---...--\` %s"
"${c1} -ss:          ${c2}\`-::::::::::::::::-.\`\`.\`\` %s"
"${c1} /ss-           ${c2}.::::::::::::-.\`\`   \`    %s"
"${c1} +ss:          ${c2}.::::::::::::-            %s"
"${c1} /sso         ${c2}.::::::-::::::-            %s"
"${c1} .sss/       ${c2}-:::-.\`   .:::::            %s"
"${c1}  /sss+.    ${c2}..\`${c1}  \`--\`    ${c2}.:::            %s"
"${c1}   -ossso+/:://+/-\`        ${c2}.:\`           %s"
"${c1}     -/+ooo+/-.              ${c2}\`           %s"
"${c1}                                         %s"
"${c1}                                         %s")
		;;

		"openSUSE"|"SUSE Linux Enterprise")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Bold Green
				c2=$c0$bold
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="44"
			fulloutput=(
"${c2}             .;ldkO0000Okdl;.               %s"
"${c2}         .;d00xl:^''''''^:ok00d;.           %s"
"${c2}       .d00l'                'o00d.         %s"
"${c2}     .d0Kd'${c1}  Okxol:;,.          ${c2}:O0d.       %s"
"${c2}    .OK${c1}KKK0kOKKKKKKKKKKOxo:,      ${c2}lKO.      %s"
"${c2}   ,0K${c1}KKKKKKKKKKKKKKK0P^${c2},,,${c1}^dx:${c2}    ;00,     %s"
"${c2}  .OK${c1}KKKKKKKKKKKKKKKk'${c2}.oOPPb.${c1}'0k.${c2}   cKO.    %s"
"${c2}  :KK${c1}KKKKKKKKKKKKKKK: ${c2}kKx..dd ${c1}lKd${c2}   'OK:    %s"
"${c2}  dKK${c1}KKKKKKKKKOx0KKKd ${c2}^0KKKO' ${c1}kKKc${c2}   dKd    %s"
"${c2}  dKK${c1}KKKKKKKKKK;.;oOKx,..${c2}^${c1}..;kKKK0.${c2}  dKd    %s"
"${c2}  :KK${c1}KKKKKKKKKK0o;...^cdxxOK0O/^^'  ${c2}.0K:    %s"
"${c2}   kKK${c1}KKKKKKKKKKKKK0x;,,......,;od  ${c2}lKk     %s"
"${c2}   '0K${c1}KKKKKKKKKKKKKKKKKKKK00KKOo^  ${c2}c00'     %s"
"${c2}    'kK${c1}KKOxddxkOO00000Okxoc;''   ${c2}.dKk'      %s"
"${c2}      l0Ko.                    .c00l'       %s"
"${c2}       'l0Kk:.              .;xK0l'         %s"
"${c2}          'lkK0xl:;,,,,;:ldO0kl'            %s"
"${c2}              '^:ldxkkkkxdl:^'              %s")
		;;

		"Slackware")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
				c2=$(getColor 'white') # Bold White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="1"
			logowidth="46"
			fulloutput=(
"${c1}                   :::::::                    "
"${c1}             :::::::::::::::::::              %s"
"${c1}          :::::::::::::::::::::::::           %s"
"${c1}        ::::::::${c2}cllcccccllllllll${c1}::::::        %s"
"${c1}     :::::::::${c2}lc               dc${c1}:::::::      %s"
"${c1}    ::::::::${c2}cl   clllccllll    oc${c1}:::::::::    %s"
"${c1}   :::::::::${c2}o   lc${c1}::::::::${c2}co   oc${c1}::::::::::   %s"
"${c1}  ::::::::::${c2}o    cccclc${c1}:::::${c2}clcc${c1}::::::::::::  %s"
"${c1}  :::::::::::${c2}lc        cclccclc${c1}:::::::::::::  %s"
"${c1} ::::::::::::::${c2}lcclcc          lc${c1}:::::::::::: %s"
"${c1} ::::::::::${c2}cclcc${c1}:::::${c2}lccclc     oc${c1}::::::::::: %s"
"${c1} ::::::::::${c2}o    l${c1}::::::::::${c2}l    lc${c1}::::::::::: %s"
"${c1}  :::::${c2}cll${c1}:${c2}o     clcllcccll     o${c1}:::::::::::  %s"
"${c1}  :::::${c2}occ${c1}:${c2}o                  clc${c1}:::::::::::  %s"
"${c1}   ::::${c2}ocl${c1}:${c2}ccslclccclclccclclc${c1}:::::::::::::   %s"
"${c1}    :::${c2}oclcccccccccccccllllllllllllll${c1}:::::    %s"
"${c1}     ::${c2}lcc1lcccccccccccccccccccccccco${c1}::::     %s"
"${c1}       ::::::::::::::::::::::::::::::::       %s"
"${c1}         ::::::::::::::::::::::::::::         %s"
"${c1}            ::::::::::::::::::::::            %s"
"${c1}                 ::::::::::::                 %s")
		;;

		"ROSA")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'rosa_blue') # special blue color from ROSA
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="3"
			logowidth="41"
			fulloutput=(
"${c1}            ROSAROSAROSAROSAR            "
"${c1}         ROSA               AROS         "
"${c1}       ROS   SAROSAROSAROSAR   AROS      "
"${c1}     RO   ROSAROSAROSAROSAROSAR   RO     %s"
"${c1}   ARO  AROSAROSAROSARO      AROS  ROS   %s"
"${c1}  ARO  ROSAROS         OSAR   ROSA  ROS  %s"
"${c1}  RO  AROSA   ROSAROSAROSA    ROSAR  RO  %s"
"${c1} RO  ROSAR  ROSAROSAROSAR  R  ROSARO  RO %s"
"${c1} RO  ROSA  AROSAROSAROSA  AR  ROSARO  AR %s"
"${c1} RO AROS  ROSAROSAROSA   ROS  AROSARO AR %s"
"${c1} RO AROS  ROSAROSARO   ROSARO  ROSARO AR %s"
"${c1} RO  ROS  AROSAROS   ROSAROSA AROSAR  AR %s"
"${c1} RO  ROSA  ROS     ROSAROSAR  ROSARO  RO %s"
"${c1}  RO  ROS     AROSAROSAROSA  ROSARO  AR  %s"
"${c1}  ARO  ROSA   ROSAROSAROS   AROSAR  ARO  %s"
"${c1}   ARO  OROSA      R      ROSAROS  ROS   %s"
"${c1}     RO   AROSAROS   AROSAROSAR   RO     %s"
"${c1}      AROS   AROSAROSAROSARO   AROS      %s"
"${c1}         ROSA               SARO         %s"
"${c1}            ROSAROSAROSAROSAR            %s")
		;;

		"Red Hat Enterprise Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="42"
			fulloutput=(
"${c2}                                          %s"
"${c2}              \`.-..........\`              %s"
"${c2}             \`////////::.\`-/.             %s"
"${c2}             -: ....-////////.            %s"
"${c2}             //:-::///////////\`           %s"
"${c2}      \`--::: \`-://////////////:           %s"
"${c2}      //////-    \`\`.-:///////// .\`        %s"
"${c2}      \`://////:-.\`    :///////::///:\`     %s"
"${c2}        .-/////////:---/////////////:     %s"
"${c2}           .-://////////////////////.     %s"
"${c1}          yMN+\`.-${c2}::///////////////-\`      %s"
"${c1}       .-\`:NMMNMs\`  \`..-------..\`         %s"
"${c1}        MN+/mMMMMMhoooyysshsss            %s"
"${c1} MMM    MMMMMMMMMMMMMMyyddMMM+            %s"
"${c1}  MMMM   MMMMMMMMMMMMMNdyNMMh\`     hyhMMM %s"
"${c1}   MMMMMMMMMMMMMMMMyoNNNMMM+.   MMMMMMMM  %s"
"${c1}    MMNMMMNNMMMMMNM+ mhsMNyyyyMNMMMMsMM   %s"
"${c1}                                          %s")
		;;

		"Frugalware")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="3"
			logowidth="50"
			fulloutput=(
"${c2}          \`++/::-.\`                               "
"${c2}         /o+++++++++/::-.\`                        "
"${c2}        \`o+++++++++++++++o++/::-.\`                "
"${c2}        /+++++++++++++++++++++++oo++/:-.\`\`        %s"
"${c2}       .o+ooooooooooooooooooosssssssso++oo++/:-\`  %s"
"${c2}       ++osoooooooooooosssssssssssssyyo+++++++o:  %s"
"${c2}      -o+ssoooooooooooosssssssssssssyyo+++++++s\`  %s"
"${c2}      o++ssoooooo++++++++++++++sssyyyyo++++++o:   %s"
"${c2}     :o++ssoooooo${c1}/-------------${c2}+syyyyyo+++++oo    %s"
"${c2}    \`o+++ssoooooo${c1}/-----${c2}+++++ooosyyyyyyo++++os:    %s"
"${c2}    /o+++ssoooooo${c1}/-----${c2}ooooooosyyyyyyyo+oooss     %s"
"${c2}   .o++++ssooooos${c1}/------------${c2}syyyyyyhsosssy-     %s"
"${c2}   ++++++ssooooss${c1}/-----${c2}+++++ooyyhhhhhdssssso      %s"
"${c2}  -s+++++syssssss${c1}/-----${c2}yyhhhhhhhhhhhddssssy.      %s"
"${c2}  sooooooyhyyyyyh${c1}/-----${c2}hhhhhhhhhhhddddyssy+       %s"
"${c2} :yooooooyhyyyhhhyyyyyyhhhhhhhhhhdddddyssy\`       %s"
"${c2} yoooooooyhyyhhhhhhhhhhhhhhhhhhhddddddysy/        %s"
"${c2}-ysooooooydhhhhhhhhhhhddddddddddddddddssy         %s"
"${c2} .-:/+osssyyyysyyyyyyyyyyyyyyyyyyyyyyssy:         %s"
"${c2}       \`\`.-/+oosysssssssssssssssssssssss          %s"
"${c2}               \`\`.:/+osyysssssssssssssh.          %s"
"${c2}                        \`-:/+osyyssssyo           %s"
"${c2}                                .-:+++\`           %s")
		;;

		"Peppermint")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="39"
			fulloutput=(
"${c2}             8ZZZZZZ${c1}MMMMM              %s"
"${c2}          .ZZZZZZZZZ${c1}MMMMMMM.           %s"
"${c1}        MM${c2}ZZZZZZZZZ${c1}MMMMMMM${c2}ZZZZ         %s"
"${c1}      MMMMM${c2}ZZZZZZZZ${c1}MMMMM${c2}ZZZZZZZM       %s"
"${c1}     MMMMMMM${c2}ZZZZZZZ${c1}MMMM${c2}ZZZZZZZZZ.      %s"
"${c1}    MMMMMMMMM${c2}ZZZZZZ${c1}MMM${c2}ZZZZZZZZZZZI     %s"
"${c1}   MMMMMMMMMMM${c2}ZZZZZZ${c1}MM${c2}ZZZZZZZZZZ${c1}MMM    %s"
"${c2}   .ZZZ${c1}MMMMMMMMMM${c2}IZZ${c1}MM${c2}ZZZZZ${c1}MMMMMMMMM   %s"
"${c2}   ZZZZZZZ${c1}MMMMMMMM${c2}ZZ${c1}M${c2}ZZZZ${c1}MMMMMMMMMMM   %s"
"${c2}   ZZZZZZZZZZZZZZZZ${c1}M${c2}Z${c1}MMMMMMMMMMMMMMM   %s"
"${c2}   .ZZZZZZZZZZZZZ${c1}MMM${c2}Z${c1}M${c2}ZZZZZZZZZZ${c1}MMMM   %s"
"${c2}   .ZZZZZZZZZZZ${c1}MMM${c2}7ZZ${c1}MM${c2}ZZZZZZZZZZ7${c1}M    %s"
"${c2}    ZZZZZZZZZ${c1}MMMM${c2}ZZZZ${c1}MMMM${c2}ZZZZZZZ77     %s"
"${c1}     MMMMMMMMMMMM${c2}ZZZZZ${c1}MMMM${c2}ZZZZZ77      %s"
"${c1}      MMMMMMMMMM${c2}7ZZZZZZ${c1}MMMMM${c2}ZZ77       %s"
"${c1}       .MMMMMMM${c2}ZZZZZZZZ${c1}MMMMM${c2}Z7Z        %s"
"${c1}         MMMMM${c2}ZZZZZZZZZ${c1}MMMMMMM         %s"
"${c2}           NZZZZZZZZZZZ${c1}MMMMM           %s"
"${c2}              ZZZZZZZZZ${c1}MM              %s")
		;;

"Grombyang"|"GrombyangOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue')
				c2=$(getColor 'light green')
				c3=$(getColor 'light red')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			fulloutput=(
"${c1}             eeeeeeeeeeee                           %s"
"${c1}          eeeeeeeeeeeeeeeee          %s"
"${c1}       eeeeeeeeeeeeeeeeeeeeeee       %s"
"${c1}     eeeee       "${c2}".o+       "${c1}"eeee      %s"
"${c1}   eeee         "${c2}"\`ooo/         "${c1}"eeee   %s"
"${c1}  eeee         "${c2}"\`+oooo:         "${c1}"eeee  %s"
"${c1} eee          "${c2}"\`+oooooo:          "${c1}"eee %s"
"${c1} eee          "${c2}"-+oooooo+:         "${c1}"eee %s"
"${c1} ee         "${c2}"\`/:oooooooo+:         "${c1}"ee %s"
"${c1} ee        "${c2}"\`/+   +++    +:        "${c1}"ee %s"
"${c1} ee              "${c2}"+o+\             "${c1}"ee %s"
"${c1} eee             "${c2}"+o+\            "${c1}"eee %s"
"${c1} eee        "${c2}"//  \\ooo/  \\\         "${c1}"eee %s"
"${c1}  eee      "${c2}"//++++oooo++++\\\      "${c1}"eee  %s"
"${c1}   eeee    "${c2}"::::++oooo+:::::   "${c1}"eeee   %s"
"${c1}     eeeee   "${c3}"Grombyang OS "${c1}"  eeee     %s"
"${c1}       eeeeeeeeeeeeeeeeeeeeeee       %s"
"${c1}          eeeeeeeeeeeeeeeee          %s"
"                                     %s"
"                                     %s")
	;;

		"Solus")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'blue') # Blue
				c3=$(getColor 'black') # Black
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="36"
			fulloutput=(
"${c3}               ......               %s"
"${c3}         .'${c1}D${c3}lddddddddddd'.          %s"
"${c3}      .'ddd${c1}XM${c3}xdddddddddddddd.       %s"
"${c3}    .dddddx${c1}MMM0${c3};dddddddddddddd.     %s"
"${c3}   'dddddl${c1}MMMMMN${c3}cddddddddddddddd.   %s"
"${c3}  ddddddc${c1}WMMMMMMW${c3}lddddddddddddddd.  %s"
"${c3} ddddddc${c1}WMMMMMMMMO${c3}ddoddddddddddddd. %s"
"${c3}.ddddd:${c1}NMMMMMMMMMK${c3}dd${c1}NX${c3}od;c${c1}lxl${c3}dddddd %s"
"${c3}dddddc${c1}WMMMMMMMMMMNN${c3}dd${c1}MMXl${c3};d${c1}00xl;${c3}ddd.%s"
"${c3}ddddl${c1}WMMMMMMMMMMMMM${c3}d;${c1}MMMM0${c3}:dl${c1}XMMXk:${c3}'%s"
"${c3}dddo${c1}WMMMMMMMMMMMMMM${c3}dd${c1}MMMMMW${c3}od${c3};${c1}XMMMOd%s"
"${c3}.dd${c1}MMMMMMMMMMMMMMMM${c3}d:${c1}MMMMMMM${c3}kd${c1}lMKll %s"
"${c3}.;dk0${c1}KXNWWMMMMMMMMM${c3}dx${c1}MMMMMMM${c3}Xl;lxK; %s"
"${c3}  'dddddddd;:cclodcddxddolloxO0O${c1}d'  %s"
"${c1}   ckkxxxddddddddxxkOOO000Okdool.   %s"
"${c2}    .lddddxxxxxxddddooooooooood     %s"
"${c2}      .:oooooooooooooooooooc'       %s"
"${c2}         .,:looooooooooc;.  %s")
		;;

		"Mageia")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
			 	c2=$(getColor 'light cyan') # Light Cyan
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="33"
			fulloutput=(
"${c2}               .°°.              %s"
"${c2}                °°   .°°.        %s"
"${c2}                .°°°. °°         %s"
"${c2}                .   .            %s"
"${c2}                 °°° .°°°.       %s"
"${c2}             .°°°.   '___'       %s"
"${c1}            .${c2}'___'     ${c1}   .      %s"
"${c1}          :dkxc;'.  ..,cxkd;     %s"
"${c1}        .dkk. kkkkkkkkkk .kkd.   %s"
"${c1}       .dkk.  ';cloolc;.  .kkd   %s"
"${c1}       ckk.                .kk;  %s"
"${c1}       xO:                  cOd  %s"
"${c1}       xO:                  lOd  %s"
"${c1}       lOO.                .OO:  %s"
"${c1}       .k00.              .00x   %s"
"${c1}        .k00;            ;00O.   %s"
"${c1}         .lO0Kc;,,,,,,;c0KOc.    %s"
"${c1}            ;d00KKKKKK00d;       %s"
"${c1}               .,KKKK,.          %s")
		;;

		"Hyperbola GNU/Linux-libre")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light grey') # light grey
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="25"
			fulloutput=(
"${c1}                                    %s"
"${c1}                  ..              , %s"
"${c1}                  a;           ._#  %s"
"${c1}                 )##        _au#?   %s"
"${c1}                 ]##s,.__a_w##e^    %s"
"${c1}                 :###########(      %s"
"${c1}                  ^!#####?!^        %s"
"${c1}                  ._                %s"
"${c1}             _au######a,            %s"
"${c1}           sa###########,           %s"
"${c1}        _a##############o           %s"
"${c1}      .a#####?!^^^^^-####_          %s"
"${c1}     j####^           ~##i          %s"
"${c1}   _de!^               -#i          %s"
"${c1} _#e^                   ]+          %s"
"${c1} ^                      ^           %s"
"${c1}                                    %s")
			;;

		"Parabola GNU/Linux-libre")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'purple') # Purple
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="33"
			fulloutput=(
"${c1}                                       %s"
"${c1}                          _,,     _    %s"
"${c1}                   _,   ,##'    ,##;   %s"
"${c1}             _, ,##'  ,##'    ,#####;  %s"
"${c1}         _,;#',##'  ,##'    ,#######'  %s"
"${c1}     _,#**^'         \`    ,#########   %s"
"${c1} .-^\`                    \`#########    %s"
"${c1}                          ########     %s"
"${c1}                          ;######      %s"
"${c1}                          ;####*       %s"
"${c1}                          ####'        %s"
"${c1}                         ;###          %s"
"${c1}                        ,##'           %s"
"${c1}                        ##             %s"
"${c1}                       #'              %s"
"${c1}                      /                %s"
"${c1}                     '                 %s"
"${c1}                                       %s")
		;;

		"Viperr")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'dark grey') # Dark Gray
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="31"
			fulloutput=(
"${c1}    wwzapd         dlzazw      %s"
"${c1}   an${c2}#${c1}zncmqzepweeirzpas${c2}#${c1}xz     %s"
"${c1} apez${c2}##${c1}qzdkawweemvmzdm${c2}##${c1}dcmv   %s"
"${c1}zwepd${c2}####${c1}qzdweewksza${c2}####${c1}ezqpa  %s"
"${c1}ezqpdkapeifjeeazezqpdkazdkwqz  %s"
"${c1} ezqpdksz${c2}##${c1}wepuizp${c2}##${c1}wzeiapdk   %s"
"${c1}  zqpakdpa${c2}#${c1}azwewep${c2}#${c1}zqpdkqze    %s"
"${c1}    apqxalqpewenwazqmzazq      %s"
"${c1}     mn${c2}##${c1}==${c2}#######${c1}==${c2}##${c1}qp       %s"
"${c1}      qw${c2}##${c1}=${c2}#######${c1}=${c2}##${c1}zl        %s"
"${c1}      z0${c2}######${c1}=${c2}######${c1}0a        %s"
"${c1}       qp${c2}#####${c1}=${c2}#####${c1}mq         %s"
"${c1}       az${c2}####${c1}===${c2}####${c1}mn         %s"
"${c1}        ap${c2}#########${c1}qz          %s"
"${c1}         9qlzskwdewz           %s"
"${c1}          zqwpakaiw            %s"
"${c1}            qoqpe              %s"
"${c1}                               %s")
		;;

		"LinuxDeepin")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="33"
			fulloutput=(
"${c1}  eeeeeeeeeeeeeeeeeeeeeeeeeeee   %s"
"${c1} eee  eeeeeee          eeeeeeee  %s"
"${c1}ee   eeeeeeeee      eeeeeeeee ee %s"
"${c1}e   eeeeeeeee     eeeeeeeee    e %s"
"${c1}e   eeeeeee    eeeeeeeeee      e %s"
"${c1}e   eeeeee    eeeee            e %s"
"${c1}e    eeeee    eee  eee         e %s"
"${c1}e     eeeee   ee eeeeee        e %s"
"${c1}e      eeeee   eee   eee       e %s"
"${c1}e       eeeeeeeeee  eeee       e %s"
"${c1}e         eeeee    eeee        e %s"
"${c1}e               eeeeee         e %s"
"${c1}e            eeeeeee           e %s"
"${c1}e eee     eeeeeeee             e %s"
"${c1}eeeeeeeeeeeeeeee               e %s"
"${c1}eeeeeeeeeeeee                 ee %s"
"${c1} eeeeeeeeeee                eee  %s"
"${c1}  eeeeeeeeeeeeeeeeeeeeeeeeeeee   %s"
"${c1}                                 %s")
		;;

		"Deepin")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'cyan') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="41"
			fulloutput=(
"${c1}              ............               %s"
"${c1}          .';;;;;.       .,;,.           %s"
"${c1}       .,;;;;;;;.       ';;;;;;;.        %s"
"${c1}     .;::::::::'     .,::;;,''''',.      %s"
"${c1}    ,'.::::::::    .;;'.          ';     %s"
"${c1}   ;'  'cccccc,   ,' :: '..        .:    %s"
"${c1}  ,,    :ccccc.  ;: .c, '' :.       ,;   %s"
"${c1} .l.     cllll' ., .lc  :; .l'       l.  %s"
"${c1} .c       :lllc  ;cl:  .l' .ll.      :'  %s"
"${c1} .l        'looc. .   ,o:  'oo'      c,  %s"
"${c1} .o.         .:ool::coc'  .ooo'      o.  %s"
"${c1}  ::            .....   .;dddo      ;c   %s"
"${c1}   l:...            .';lddddo.     ,o    %s"
"${c1}    lxxxxxdoolllodxxxxxxxxxc      :l     %s"
"${c1}     ,dxxxxxxxxxxxxxxxxxxl.     'o,      %s"
"${c1}       ,dkkkkkkkkkkkkko;.    .;o;        %s"
"${c1}         .;okkkkkdl;.    .,cl:.          %s"
"${c1}             .,:cccccccc:,.              %s")
		;;

		"Chakra")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c1}      _ _ _        \"kkkkkkkk.         %s"
"${c1}    ,kkkkkkkk.,    \'kkkkkkkkk,        %s"
"${c1}    ,kkkkkkkkkkkk., \'kkkkkkkkk.       %s"
"${c1}   ,kkkkkkkkkkkkkkkk,\'kkkkkkkk,       %s"
"${c1}  ,kkkkkkkkkkkkkkkkkkk\'kkkkkkk.       %s"
"${c1}   \"\'\'\"\'\'\',;::,,\"\'\'kkk\'\'kkkkk;   __   %s"
"${c1}       ,kkkkkkkkkk, \"k\'\'kkkkk\' ,kkkk  %s"
"${c1}     ,kkkkkkk\' ., \' .: \'kkkk\',kkkkkk  %s"
"${c1}   ,kkkkkkkk\'.k\'   ,  ,kkkk;kkkkkkkkk %s"
"${c1}  ,kkkkkkkk\';kk \'k  \"\'k\',kkkkkkkkkkkk %s"
"${c1} .kkkkkkkkk.kkkk.\'kkkkkkkkkkkkkkkkkk\' %s"
"${c1} ;kkkkkkkk\'\'kkkkkk;\'kkkkkkkkkkkkk\'\'   %s"
"${c1} \'kkkkkkk; \'kkkkkkkk.,\"\"\'\'\"\'\'\"\"       %s"
"${c1}   \'\'kkkk;  \'kkkkkkkkkk.,             %s"
"${c1}      \';\'    \'kkkkkkkkkkkk.,          %s"
"${c1}              ';kkkkkkkkkk\'           %s"
"${c1}                ';kkkkkk\'             %s"
"${c1}                   \"\'\'\"               %s")
		;;

		"Fuduntu")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'dark grey') # Dark Gray
				c2=$(getColor 'yellow') # Bold Yellow
				c3=$(getColor 'light red') # Light Red
				c4=$(getColor 'white') # White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="1"
			logowidth="49"
			fulloutput=(
"${c1}       \`dwoapfjsod\`${c2}           \`dwoapfjsod\`       "
"${c1}    \`xdwdsfasdfjaapz\`${c2}       \`dwdsfasdfjaapzx\`    %s"
"${c1}  \`wadladfladlafsozmm\`${c2}     \`wadladfladlafsozmm\`  %s"
"${c1} \`aodowpwafjwodisosoaas\`${c2} \`odowpwafjwodisosoaaso\` %s"
"${c1} \`adowofaowiefawodpmmxs\`${c2} \`dowofaowiefawodpmmxso\` %s"
"${c1} \`asdjafoweiafdoafojffw\`${c2} \`sdjafoweiafdoafojffwq\` %s"
"${c1}  \`dasdfjalsdfjasdlfjdd\`${c2} \`asdfjalsdfjasdlfjdda\`  %s"
"${c1}   \`dddwdsfasdfjaapzxaw\`${c2} \`ddwdsfasdfjaapzxawo\`   %s"
"${c1}     \`dddwoapfjsowzocmw\`${c2} \`ddwoapfjsowzocmwp\`     %s"
"${c1}       \`ddasowjfowiejao\`${c2} \`dasowjfowiejaow\`       %s"
"${c1}                                                 %s"
"${c3}       \`ddasowjfowiejao\`${c4} \`dasowjfowiejaow\`       %s"
"${c3}     \`dddwoapfjsowzocmw\`${c4} \`ddwoapfjsowzocmwp\`     %s"
"${c3}   \`dddwdsfasdfjaapzxaw\`${c4} \`ddwdsfasdfjaapzxawo\`   %s"
"${c3}  \`dasdfjalsdfjasdlfjdd\`${c4} \`asdfjalsdfjasdlfjdda\`  %s"
"${c3} \`asdjafoweiafdoafojffw\`${c4} \`sdjafoweiafdoafojffwq\` %s"
"${c3} \`adowofaowiefawodpmmxs\`${c4} \`dowofaowiefawodpmmxso\` %s"
"${c3} \`aodowpwafjwodisosoaas\`${c4} \`odowpwafjwodisosoaaso\` %s"
"${c3}   \`wadladfladlafsozmm\`${c4}     \`wadladfladlafsozmm\` %s"
"${c3}     \`dwdsfasdfjaapzx\`${c4}       \`dwdsfasdfjaapzx\`   %s"
"${c3}        \`woapfjsod\`${c4}             \`woapfjsod\`      %s")
		;;

		"Zorin OS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			fulloutput=(
"${c1}           ...................          %s"
"${c1}          :ooooooooooooooooooo/         %s"
"${c1}         /ooooooooooooooooooooo+        %s"
"${c1}        ''''''''''''''''''''''''        %s"
"${c1}                                        %s"
"${c1}    .++++++++++++++++++/.       :++-    %s"
"${c1}   -oooooooooooooooo/-       :+ooooo:   %s"
"${c1}  :oooooooooooooo/-       :+ooooooooo:  %s"
"${c1} .oooooooooooo+-       :+ooooooooooooo- %s"
"${c1}  -oooooooo/-       -+ooooooooooooooo:  %s"
"${c1}   .oooo+-       -+ooooooooooooooooo-   %s"
"${c1}    .--        .-------------------.    %s"
"${c1}                                        %s"
"${c1}        .//////////////////////-        %s"
"${c1}         :oooooooooooooooooooo/         %s"
"${c1}          :oooooooooooooooooo:          %s"
"${c1}           ''''''''''''''''''           %s")
		;;

		"Mac OS X")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'green') # Green
				c2=$(getColor 'brown') # Yellow
				c3=$(getColor 'light red') # Orange
				c4=$(getColor 'red') # Red
				c5=$(getColor 'purple') # Purple
				c6=$(getColor 'blue') # Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; c5="${my_lcolor}"; c6="${my_lcolor}"; fi
			startline="1"
			logowidth="31"
			fulloutput=(
"${c1}                               "
"${c1}                 -/+:.         %s"
"${c1}                :++++.         %s"
"${c1}               /+++/.          %s"
"${c1}       .:-::- .+/:-\`\`.::-      %s"
"${c1}    .:/++++++/::::/++++++/:\`   %s"
"${c2}  .:///////////////////////:\`  %s"
"${c2}  ////////////////////////\`    %s"
"${c3} -+++++++++++++++++++++++\`     %s"
"${c3} /++++++++++++++++++++++/      %s"
"${c4} /sssssssssssssssssssssss.     %s"
"${c4} :ssssssssssssssssssssssss-    %s"
"${c5}  osssssssssssssssssssssssso/\` %s"
"${c5}  \`syyyyyyyyyyyyyyyyyyyyyyyy+\` %s"
"${c6}   \`ossssssssssssssssssssss/   %s"
"${c6}     :ooooooooooooooooooo+.    %s"
"${c6}      \`:+oo+/:-..-:/+o+/-      %s"
"${c6}                               %s")
		;;

		"Mac OS X - Classic")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'blue') # Blue
				c2=$(getColor 'light blue') # Light blue
				c3=$(getColor 'light grey') # Gray
				c4=$(getColor 'dark grey') # Dark Ggray
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="1"
			logowidth="39"
			fulloutput=(
"${c3}                                       "
"${c3}                        ..             %s"
"${c3}                       dWc             %s"
"${c3}                     ,X0'              %s"
"${c1}  ;;;;;;;;;;;;;;;;;;${c3}0Mk${c2}::::::::::::::: %s"
"${c1}  ;;;;;;;;;;;;;;;;;${c3}KWo${c2}:::::::::::::::: %s"
"${c1}  ;;;;;;;;;${c4}NN${c1};;;;;${c3}KWo${c2}:::::${c3}NN${c2}:::::::::: %s"
"${c1}  ;;;;;;;;;${c4}NN${c1};;;;${c3}0Md${c2}::::::${c3}NN${c2}:::::::::: %s"
"${c1}  ;;;;;;;;;${c4}NN${c1};;;${c3}xW0${c2}:::::::${c3}NN${c2}:::::::::: %s"
"${c1}  ;;;;;;;;;;;;;;${c3}KMc${c2}::::::::::::::::::: %s"
"${c1}  ;;;;;;;;;;;;;${c3}lWX${c2}:::::::::::::::::::: %s"
"${c1}  ;;;;;;;;;;;;;${c3}xWWXXXXNN7${c2}::::::::::::: %s"
"${c1}  ;;;;;;;;;;;;;;;;;;;;${c3}WK${c2}:::::::::::::: %s"
"${c1}  ;;;;;${c4}TKX0ko.${c1};;;;;;;${c3}kMx${c2}:::${c3}.cOKNF${c2}::::: %s"
"${c1}  ;;;;;;;;${c4}\`kO0KKKKKKK${c3}NMNXK0OP*${c2}:::::::: %s"
"${c1}  ;;;;;;;;;;;;;;;;;;;${c3}kMx${c2}:::::::::::::: %s"
"${c1}  ;;;;;;;;;;;;;;;;;;;;${c3}WX${c2}:::::::::::::: %s"
"${c3}                      lMc              %s"
"${c3}                       kN.             %s"
"${c3}                        o'             %s"
"${c3}                                       %s")
		;;

		"Windows"|"Cygwin"|"Msys")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light red') # Red
				c2=$(getColor 'light green') # Green
				c3=$(getColor 'light blue') # Blue
				c4=$(getColor 'yellow') # Yellow
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c1}        ,.=:!!t3Z3z.,                %s"
"${c1}       :tt:::tt333EE3                %s"
"${c1}       Et:::ztt33EEEL${c2} @Ee.,      .., %s"
"${c1}      ;tt:::tt333EE7${c2} ;EEEEEEttttt33# %s"
"${c1}     :Et:::zt333EEQ.${c2} \$EEEEEttttt33QL %s"
"${c1}     it::::tt333EEF${c2} @EEEEEEttttt33F  %s"
"${c1}    ;3=*^\`\`\`\"*4EEV${c2} :EEEEEEttttt33@.  %s"
"${c3}    ,.=::::!t=., ${c1}\`${c2} @EEEEEEtttz33QF   %s"
"${c3}   ;::::::::zt33)${c2}   \"4EEEtttji3P*    %s"
"${c3}  :t::::::::tt33.${c4}:Z3z..${c2}  \`\`${c4} ,..g.    %s"
"${c3}  i::::::::zt33F${c4} AEEEtttt::::ztF     %s"
"${c3} ;:::::::::t33V${c4} ;EEEttttt::::t3      %s"
"${c3} E::::::::zt33L${c4} @EEEtttt::::z3F      %s"
"${c3}{3=*^\`\`\`\"*4E3)${c4} ;EEEtttt:::::tZ\`      %s"
"${c3}             \`${c4} :EEEEtttt::::z7       %s"
"${c4}                 \"VEzjt:;;z>*\`       %s")
		;;

		"Windows - Modern")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c1}                                  .., %s"
"${c1}                      ....,,:;+ccllll %s"
"${c1}        ...,,+:;  cllllllllllllllllll %s"
"${c1}  ,cclllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}                                      %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  llllllllllllll  lllllllllllllllllll %s"
"${c1}  \`'ccllllllllll  lllllllllllllllllll %s"
"${c1}         \`'\"\"*::  :ccllllllllllllllll %s"
"${c1}                        \`\`\`\`''\"*::cll %s"
"${c1}                                   \`\` %s")
		;;

		"Haiku")
			if [[ "$no_color" != "1" ]]; then
				if [ "$haikualpharelease" == "yes" ]; then
					c1=$(getColor 'black_haiku') # Black
					c2=$(getColor 'light grey') # Light Gray
				else
					c1=$(getColor 'black') # Black
					c2=${c1}
				fi
				c3=$(getColor 'green') # Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="36"
			fulloutput=(
"${c1}          :dc'                      %s"
"${c1}       'l:;'${c2},${c1}'ck.    .;dc:.         %s"
"${c1}       co    ${c2}..${c1}k.  .;;   ':o.       %s"
"${c1}       co    ${c2}..${c1}k. ol      ${c2}.${c1}0.       %s"
"${c1}       co    ${c2}..${c1}k. oc     ${c2}..${c1}0.       %s"
"${c1}       co    ${c2}..${c1}k. oc     ${c2}..${c1}0.       %s"
"${c1}.Ol,.  co ${c2}...''${c1}Oc;kkodxOdddOoc,.    %s"
"${c1} ';lxxlxOdxkxk0kd${c3}oooll${c1}dl${c3}ccc:${c1}clxd;   %s"
"${c1}     ..${c3}oOolllllccccccc:::::${c1}od;      %s"
"${c1}       cx:ooc${c3}:::::::;${c1}cooolcX.       %s"
"${c1}       cd${c2}.${c1}''cloxdoollc' ${c2}...${c1}0.       %s"
"${c1}       cd${c2}......${c1}k;${c2}.${c1}xl${c2}....  .${c1}0.       %s"
"${c1}       .::c${c2};..${c1}cx;${c2}.${c1}xo${c2}..... .${c1}0.       %s"
"${c1}          '::c'${c2}...${c1}do${c2}..... .${c1}K,       %s"
"${c1}                  cd,.${c2}....:${c1}O,${c2}...... %s"
"${c1}                    ':clod:'${c2}......  %s"
"${c1}                        ${c2}.           %s")
		;;

		"Trisquel")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
				c2=$(getColor 'light cyan') # Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c1}                          ▄▄▄▄▄▄      %s"
"${c1}                       ▄█████████▄    %s"
"${c1}       ▄▄▄▄▄▄         ████▀   ▀████   %s"
"${c1}    ▄██████████▄     ████▀   ▄▄ ▀███  %s"
"${c1}  ▄███▀▀   ▀▀████     ███▄   ▄█   ███ %s"
"${c1} ▄███   ▄▄▄   ████▄    ▀██████   ▄███ %s"
"${c1} ███   █▀▀██▄  █████▄     ▀▀   ▄████  %s"
"${c1} ▀███      ███  ███████▄▄  ▄▄██████   %s"
"${c1}  ▀███▄   ▄███  █████████████${c2}████▀    %s"
"${c1}   ▀█████████    ███████${c2}███▀▀▀        %s"
"${c1}     ▀▀███▀▀     ██${c2}████▀▀             %s"
"${c2}                ██████▀   ▄▄▄▄        %s"
"${c2}               █████▀   ████████      %s"
"${c2}               █████   ███▀  ▀███     %s"
"${c2}                ████▄   ██▄▄▄  ███    %s"
"${c2}                 █████▄   ▀▀  ▄██     %s"
"${c2}                   ██████▄▄▄████      %s"
"${c2}		              █████▀▀       %s")
		;;

		"Manjaro")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="1"
			logowidth="33"
			fulloutput=(""
"${c1} ██████████████████  ████████    %s"
"${c1} ██████████████████  ████████    %s"
"${c1} ██████████████████  ████████    %s"
"${c1} ██████████████████  ████████    %s"
"${c1} ████████            ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"${c1} ████████  ████████  ████████    %s"
"                                 %s")
		;;

		"Netrunner")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="43"
			fulloutput=(
"${c1} nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn  %s"
"${c1} nnnnnnnnnnnnnn            nnnnnnnnnnnnnn  %s"
"${c1} nnnnnnnnnn     nnnnnnnnnn     nnnnnnnnnn  %s"
"${c1} nnnnnnn   nnnnnnnnnnnnnnnnnnnn   nnnnnnn  %s"
"${c1} nnnn   nnnnnnnnnnnnnnnnnnnnnnnnnn   nnnn  %s"
"${c1} nnn  nnnnnnnnnnnnnnnnnnnnnnnnnnnnnn  nnn  %s"
"${c1} nn  nnnnnnnnnnnnnnnnnnnnnn  nnnnnnnn  nn  %s"
"${c1} n  nnnnnnnnnnnnnnnnn       nnnnnnnnnn  n  %s"
"${c1} n nnnnnnnnnnn              nnnnnnnnnnn n  %s"
"${c1} n nnnnnn                  nnnnnnnnnnnn n  %s"
"${c1} n nnnnnnnnnnn             nnnnnnnnnnnn n  %s"
"${c1} n nnnnnnnnnnnnn           nnnnnnnnnnnn n  %s"
"${c1} n nnnnnnnnnnnnnnnn       nnnnnnnnnnnnn n  %s"
"${c1} n nnnnnnnnnnnnnnnnn      nnnnnnnnnnnnn n  %s"
"${c1} n nnnnnnnnnnnnnnnnnn    nnnnnnnnnnnn   n  %s"
"${c1} nn  nnnnnnnnnnnnnnnnn   nnnnnnnnnnnn  nn  %s"
"${c1} nnn   nnnnnnnnnnnnnnn  nnnnnnnnnnn   nnn  %s"
"${c1} nnnnn   nnnnnnnnnnnnnn nnnnnnnnn   nnnnn  %s"
"${c1} nnnnnnn   nnnnnnnnnnnnnnnnnnnn   nnnnnnn  %s"
"${c1} nnnnnnnnnn     nnnnnnnnnn     nnnnnnnnnn  %s"
"${c1} nnnnnnnnnnnnnn            nnnnnnnnnnnnnn  %s"
"${c1} nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn  %s"
"${c1}                                           %s")
		;;

			"Logos")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'green') # Green
			fi
            if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="25"
			fulloutput=(
"${c1}    ..:.:.               %s"
"${c1}   ..:.:.:.:.            %s"
"${c1}  ..:.:.:.:.:.:.         %s"
"${c1} ..:.:.:.:.:.:.:.:.      %s"
"${c1}   .:.::;.::::..:.:.:.   %s"
"${c1}      .:.:.::.::.::.;;/  %s"
"${c1}         .:.::.::://///  %s"
"${c1}            ..;;///////  %s"
"${c1}            ///////////  %s"
"${c1}         //////////////  %s"
"${c1}      /////////////////  %s"
"${c1}   ///////////////////   %s"
"${c1} //////////////////      %s"
"${c1}  //////////////         %s"
"${c1}   //////////            %s"
"${c1}    //////               %s"
"${c1}     //                  %s")
		;;

			"Manjaro-tree")
			if [[ "$no_color" != "1" ]]; then
				c1="\e[1;32m" # Green
				c2="\e[1;33m" # Yellow
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="33"
			fulloutput=(
"${c1}                         ###     %s"
"${c1}     ###             ####        %s"
"${c1}        ###       ####           %s"
"${c1}         ##### #####             %s"
"${c1}      #################          %s"
"${c1}    ###     #####    ####        %s"
"${c1}   ##        ${c2}OOO       ${c1}###       %s"
"${c1}  #          ${c2}WW         ${c1}##       %s"
"${c1}            ${c2}WW            ${c1}#      %s"
"${c2}            WW                   %s"
"${c2}            WW                   %s"
"${c2}           WW                    %s"
"${c2}           WW                    %s"
"${c2}           WW                    %s"
"${c2}          WW                     %s"
"${c2}          WW                     %s"
"${c2}          WW                     %s"
"${c2}                                 %s")
		;;

		"elementary OS"|"elementary os")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="36"
			fulloutput=(
"${c1}                                    %s"
"${c1}         eeeeeeeeeeeeeeeee          %s"
"${c1}      eeeeeeeeeeeeeeeeeeeeeee       %s"
"${c1}    eeeee  eeeeeeeeeeee   eeeee     %s"
"${c1}  eeee   eeeee       eee     eeee   %s"
"${c1} eeee   eeee          eee     eeee  %s"
"${c1}eee    eee            eee       eee %s"
"${c1}eee   eee            eee        eee %s"
"${c1}ee    eee           eeee       eeee %s"
"${c1}ee    eee         eeeee      eeeeee %s"
"${c1}ee    eee       eeeee      eeeee ee %s"
"${c1}eee   eeee   eeeeee      eeeee  eee %s"
"${c1}eee    eeeeeeeeee     eeeeee    eee %s"
"${c1} eeeeeeeeeeeeeeeeeeeeeeee    eeeee  %s"
"${c1}  eeeeeeee eeeeeeeeeeee      eeee   %s"
"${c1}    eeeee                 eeeee     %s"
"${c1}      eeeeeee         eeeeeee       %s"
"${c1}         eeeeeeeeeeeeeeeee          %s")
	;;

		"Android")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light green') # Bold Green
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="2"
			logowidth="24"
			fulloutput=(
"${c1}       ╲ ▁▂▂▂▁ ╱        "
"${c1}       ▄███████▄        "
"${c1}      ▄██ ███ ██▄       %s"
"${c1}     ▄███████████▄      %s"
"${c1}  ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄ █▄   %s"
"${c1}  ██ █████████████ ██   %s"
"${c1}  ██ █████████████ ██   %s"
"${c1}  ██ █████████████ ██   %s"
"${c1}  ██ █████████████ ██   %s"
"${c1}     █████████████      %s"
"${c1}      ███████████       %s"
"${c1}       ██     ██        %s"
"${c1}       ██     ██        %s")
		;;

		"Scientific Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue')
				c2=$(getColor 'light red')
				c3=$(getColor 'white')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="1"
			logowidth="44"
			fulloutput=(
"${c1}                  =/;;/-                    "
"${c1}                 +:    //                   %s"
"${c1}                /;      /;                  %s"
"${c1}               -X        H.                 %s"
"${c1} .//;;;:;;-,   X=        :+   .-;:=;:;#;.   %s"
"${c1} M-       ,=;;;#:,      ,:#;;:=,       ,@   %s"
"${c1} :#           :#.=/++++/=.$=           #=   %s"
"${c1}  ,#;         #/:+/;,,/++:+/         ;+.    %s"
"${c1}    ,+/.    ,;@+,        ,#H;,    ,/+,      %s"
"${c1}       ;+;;/= @.  ${c2}.H${c3}#${c2}#X   ${c1}-X :///+;         %s"
"${c1}       ;+=;;;.@,  ${c3}.X${c2}M${c3}@$.  ${c1}=X.//;=#/.        %s"
"${c1}    ,;:      :@#=        =\$H:     .+#-      %s"
"${c1}  ,#=         #;-///==///-//         =#,    %s"
"${c1} ;+           :#-;;;:;;;;-X-           +:   %s"
"${c1} @-      .-;;;;M-        =M/;;;-.      -X   %s"
"${c1}  :;;::;;-.    #-        :+    ,-;;-;:==    %s"
"${c1}               ,X        H.                 %s"
"${c1}                ;/      #=                  %s"
"${c1}                 //    +;                   %s"
"${c1}                  '////'                    %s")
		;;

		"BackTrack Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light red') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="1"
			logowidth="48"
			fulloutput=(
"${c1}..............                                  "
"${c1}            ..,;:ccc,.                          %s"
"${c1}          ......''';lxO.                        %s"
"${c1}.....''''..........,:ld;                        %s"
"${c1}           .';;;:::;,,.x,                       %s"
"${c1}      ..'''.            0Xxoc:,.  ...           %s"
"${c1}  ....                ,ONkc;,;cokOdc',.         %s"
"${c1} .                   OMo           ':${c2}dd${c1}o.       %s"
"${c1}                    dMc               :OO;      %s"
"${c1}                    0M.                 .:o.    %s"
"${c1}                    ;Wd                         %s"
"${c1}                     ;XO,                       %s"
"${c1}                       ,d0Odlc;,..              %s"
"${c1}                           ..',;:cdOOd::,.      %s"
"${c1}                                    .:d;.':;.   %s"
"${c1}                                       'd,  .'  %s"
"${c1}                                         ;l   ..%s"
"${c1}                                          .o    %s"
"${c1}                                            c   %s"
"${c1}                                            .'  %s"
"${c1}                                             .  %s")
		;;

		"Kali Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # White
				c2=$(getColor 'black') # Light Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="1"
			logowidth="48"
			fulloutput=(
"${c1}..............                                  "
"${c1}            ..,;:ccc,.                          %s"
"${c1}          ......''';lxO.                        %s"
"${c1}.....''''..........,:ld;                        %s"
"${c1}           .';;;:::;,,.x,                       %s"
"${c1}      ..'''.            0Xxoc:,.  ...           %s"
"${c1}  ....                ,ONkc;,;cokOdc',.         %s"
"${c1} .                   OMo           ':${c2}dd${c1}o.       %s"
"${c1}                    dMc               :OO;      %s"
"${c1}                    0M.                 .:o.    %s"
"${c1}                    ;Wd                         %s"
"${c1}                     ;XO,                       %s"
"${c1}                       ,d0Odlc;,..              %s"
"${c1}                           ..',;:cdOOd::,.      %s"
"${c1}                                    .:d;.':;.   %s"
"${c1}                                       'd,  .'  %s"
"${c1}                                         ;l   ..%s"
"${c1}                                          .o    %s"
"${c1}                                            c   %s"
"${c1}                                            .'  %s"
"${c1}                                             .  %s")
		;;

		"Sabayon")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="38"
			fulloutput=(
"${c2}            ...........               %s"
"${c2}         ..             ..            %s"
"${c2}      ..                   ..         %s"
"${c2}    ..           ${c1}o           ${c2}..       %s"
"${c2}  ..            ${c1}:W'            ${c2}..     %s"
"${c2} ..             ${c1}.d.             ${c2}..    %s"
"${c2}:.             ${c1}.KNO              ${c2}.:   %s"
"${c2}:.             ${c1}cNNN.             ${c2}.:   %s"
"${c2}:              ${c1}dXXX,              ${c2}:   %s"
"${c2}:   ${c1}.          dXXX,       .cd,   ${c2}:   %s"
"${c2}:   ${c1}'kc ..     dKKK.    ,ll;:'    ${c2}:   %s"
"${c2}:     ${c1}.xkkxc;..dkkkc',cxkkl       ${c2}:   %s"
"${c2}:.     ${c1}.,cdddddddddddddo:.       ${c2}.:   %s"
"${c2} ..         ${c1}:lllllll:           ${c2}..    %s"
"${c2}   ..         ${c1}',,,,,          ${c2}..      %s"
"${c2}     ..                     ..        %s"
"${c2}        ..               ..           %s"
"${c2}          ...............             %s")
		;;

		"KaOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="35"
			fulloutput=(
"${c1}                     ..            %s"
"${c1}  .....         ..OSSAAAAAAA..     %s"
"${c1} .KKKKSS.     .SSAAAAAAAAAAA.      %s"
"${c1}.KKKKKSO.    .SAAAAAAAAAA...       %s"
"${c1}KKKKKKS.   .OAAAAAAAA.             %s"
"${c1}KKKKKKS.  .OAAAAAA.                %s"
"${c1}KKKKKKS. .SSAA..                   %s"
"${c1}.KKKKKS..OAAAAAAAAAAAA........     %s"
"${c1} DKKKKO.=AA=========A===AASSSO..   %s"
"${c1}  AKKKS.==========AASSSSAAAAAASS.  %s"
"${c1}  .=KKO..========ASS.....SSSSASSSS.%s"
"${c1}    .KK.       .ASS..O.. =SSSSAOSS:%s"
"${c1}     .OK.      .ASSSSSSSO...=A.SSA.%s"
"${c1}       .K      ..SSSASSSS.. ..SSA. %s"
"${c1}                 .SSS.AAKAKSSKA.   %s"
"${c1}                    .SSS....S..    %s")
		;;

		"CentOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'yellow')
				c2=$(getColor 'light green')
				c3=$(getColor 'light blue')
				c4=$(getColor 'light purple')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; c4="${my_lcolor}"; fi
			startline="0"
			logowidth="40"
			fulloutput=(
"${c1}                   ..                   %s"
"${c1}                 .PLTJ.                 %s"
"${c1}                <><><><>                %s"
"${c2}       KKSSV' 4KKK ${c1}LJ${c4} KKKL.'VSSKK       %s"
"${c2}       KKV' 4KKKKK ${c1}LJ${c4} KKKKAL 'VKK       %s"
"${c2}       V' ' 'VKKKK ${c1}LJ${c4} KKKKV' ' 'V       %s"
"${c2}       .4MA.' 'VKK ${c1}LJ${c4} KKV' '.4Mb.       %s"
"${c4}     . ${c2}KKKKKA.' 'V ${c1}LJ${c4} V' '.4KKKKK ${c3}.     %s"
"${c4}   .4D ${c2}KKKKKKKA.'' ${c1}LJ${c4} ''.4KKKKKKK ${c3}FA.   %s"
"${c4}  <QDD ++++++++++++  ${c3}++++++++++++ GFD>  %s"
"${c4}   'VD ${c3}KKKKKKKK'.. ${c2}LJ ${c1}..'KKKKKKKK ${c3}FV    %s"
"${c4}     ' ${c3}VKKKKK'. .4 ${c2}LJ ${c1}K. .'KKKKKV ${c3}'     %s"
"${c3}        'VK'. .4KK ${c2}LJ ${c1}KKA. .'KV'        %s"
"${c3}       A. . .4KKKK ${c2}LJ ${c1}KKKKA. . .4       %s"
"${c3}       KKA. 'KKKKK ${c2}LJ ${c1}KKKKK' .4KK       %s"
"${c3}       KKSSA. VKKK ${c2}LJ ${c1}KKKV .4SSKK       %s"
"${c2}                <><><><>                %s"
"${c2}                 'MKKM'                 %s"
"${c2}                   ''                   %s")
		;;

		"Jiyuu Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="31"
			fulloutput=(
"${c1}+++++++++++++++++++++++.       %s"
"${c1}ss:-......-+so/:----.os-       %s"
"${c1}ss        +s/        os-       %s"
"${c1}ss       :s+         os-       %s"
"${c1}ss       os.         os-       %s"
"${c1}ss      .so          os-       %s"
"${c1}ss      :s+          os-       %s"
"${c1}ss      /s/          os-       %s"
"${c1}ss      /s:          os-       %s"
"${c1}ss      +s-          os-       %s"
"${c1}ss-.....os:..........os-       %s"
"${c1}++++++++os+++++++++oooo.       %s"
"${c1}        os.     ./oo/.         %s"
"${c1}        os.   ./oo:            %s"
"${c1}        os. ./oo:              %s"
"${c1}        os oo+-                %s"
"${c1}        os+-                   %s"
"${c1}        /.                     %s")
		;;

		"Antergos")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'blue') # Light Blue
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="1"
			logowidth="41"
			fulloutput=(
"${c1}               \`.-/::/-\`\`                "
"${c1}            .-/osssssssso/.              %s"
"${c1}           :osyysssssssyyys+-            %s"
"${c1}        \`.+yyyysssssssssyyyyy+.          %s"
"${c1}       \`/syyyyyssssssssssyyyyys-\`        %s"
"${c1}      \`/yhyyyyysss${c2}++${c1}ssosyyyyhhy/\`        %s"
"${c1}     .ohhhyyyys${c2}o++/+o${c1}so${c2}+${c1}syy${c2}+${c1}shhhho.      %s"
"${c1}    .shhhhys${c2}oo++//+${c1}sss${c2}+++${c1}yyy${c2}+s${c1}hhhhs.     %s"
"${c1}   -yhhhhs${c2}+++++++o${c1}ssso${c2}+++${c1}yyy${c2}s+o${c1}hhddy:    %s"
"${c1}  -yddhhy${c2}o+++++o${c1}syyss${c2}++++${c1}yyy${c2}yooy${c1}hdddy-   %s"
"${c1} .yddddhs${c2}o++o${c1}syyyyys${c2}+++++${c1}yyhh${c2}sos${c1}hddddy\`  %s"
"${c1}\`odddddhyosyhyyyyyy${c2}++++++${c1}yhhhyosddddddo  %s"
"${c1}.dmdddddhhhhhhhyyyo${c2}+++++${c1}shhhhhohddddmmh. %s"
"${c1}ddmmdddddhhhhhhhso${c2}++++++${c1}yhhhhhhdddddmmdy %s"
"${c1}dmmmdddddddhhhyso${c2}++++++${c1}shhhhhddddddmmmmh %s"
"${c1}-dmmmdddddddhhys${c2}o++++o${c1}shhhhdddddddmmmmd- %s"
"${c1} .smmmmddddddddhhhhhhhhhdddddddddmmmms.  %s"
"${c1}   \`+ydmmmdddddddddddddddddddmmmmdy/.    %s"
"${c1}      \`.:+ooyyddddddddddddyyso+:.\`       %s")
		;;

		"Void Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'green')       # Dark Green
				c2=$(getColor 'light green') # Light Green
				c3=$(getColor 'dark grey')   # Black
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="47"
			fulloutput=(
"${c2}                 __.;=====;.__                 %s"
"${c2}             _.=+==++=++=+=+===;.              %s"
"${c2}              -=+++=+===+=+=+++++=_            %s"
"${c1}         .     ${c2}-=:\`\`     \`--==+=++==.          %s"
"${c1}        _vi,    ${c2}\`            --+=++++:         %s"
"${c1}       .uvnvi.       ${c2}_._       -==+==+.        %s"
"${c1}      .vvnvnI\`    ${c2}.;==|==;.     :|=||=|.       %s"
"${c3} +QmQQm${c1}pvvnv; ${c3}_yYsyQQWUUQQQm #QmQ#${c2}:${c3}QQQWUV\$QQmL %s"
"${c3}  -QQWQW${c1}pvvo${c3}wZ?.wQQQE${c2}==<${c3}QWWQ/QWQW.QQWW${c2}(: ${c3}jQWQE %s"
"${c3}   -\$QQQQmmU'  jQQQ@${c2}+=<${c3}QWQQ)mQQQ.mQQQC${c2}+;${c3}jWQQ@' %s"
"${c3}    -\$WQ8Y${c1}nI:   ${c3}QWQQwgQQWV${c2}\`${c3}mWQQ.jQWQQgyyWW@!   %s"
"${c1}      -1vvnvv.     ${c2}\`~+++\`        ++|+++        %s"
"${c1}       +vnvnnv,                 ${c2}\`-|===         %s"
"${c1}        +vnvnvns.           .      ${c2}:=-         %s"
"${c1}         -Invnvvnsi..___..=sv=.     ${c2}\`          %s"
"${c1}           +Invnvnvnnnnnnnnvvnn;.              %s"
"${c1}             ~|Invnvnvvnvvvnnv}+\`              %s"
"${c1}                -~\"|{*l}*|\"\"~                  %s")
		;;

		"NixOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'blue')
				c2=$(getColor 'light blue')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="45"
			fulloutput=(
"${c1}          ::::.    ${c2}':::::     ::::'          %s"
"${c1}          ':::::    ${c2}':::::.  ::::'           %s"
"${c1}            :::::     ${c2}'::::.:::::            %s"
"${c1}      .......:::::..... ${c2}::::::::             %s"
"${c1}     ::::::::::::::::::. ${c2}::::::    ${c1}::::.     %s"
"${c1}    ::::::::::::::::::::: ${c2}:::::.  ${c1}.::::'     %s"
"${c2}           .....           ::::' ${c1}:::::'      %s"
"${c2}          :::::            '::' ${c1}:::::'       %s"
"${c2} ........:::::               ' ${c1}:::::::::::.  %s"
"${c2}:::::::::::::                 ${c1}:::::::::::::  %s"
"${c2} ::::::::::: ${c1}..              :::::           %s"
"${c2}     .::::: ${c1}.:::            :::::            %s"
"${c2}    .:::::  ${c1}:::::          '''''    ${c2}.....    %s"
"${c2}    :::::   ${c1}':::::.  ${c2}......:::::::::::::'    %s"
"${c2}     :::     ${c1}::::::. ${c2}':::::::::::::::::'     %s"
"${c1}            .:::::::: ${c2}'::::::::::            %s"
"${c1}           .::::''::::.     ${c2}'::::.           %s"
"${c1}          .::::'   ::::.     ${c2}'::::.          %s"
"${c1}         .::::      ::::      ${c2}'::::.         %s")
		;;

		"GuixSD")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'orange')
				c2=$(getColor 'light orange')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="40"
			fulloutput=(
"${c1} +                                    ? %s"
"${c1} ??                                  ?I %s"
"${c1}  ??I?   I??N              ${c2}???    ${c1}????  %s"
"${c1}   ?III7${c2}???????          ??????${c1}7III?Z   %s"
"${c1}     OI77\$${c2}?????         ?????${c1}$77II      %s"
"${c1}           ?????        ${c2}????            %s"
"${c1}            ???ID      ${c2}????             %s"
"${c1}             IIII     ${c2}+????             %s"
"${c1}             IIIII    ${c2}????              %s"
"${c1}              IIII   ${c2}?????              %s"
"${c1}              IIIII  ${c2}????               %s"
"${c1}               II77 ${c2}????$               %s"
"${c1}               7777+${c2}????                %s"
"${c1}                77++?${c2}??$                %s"
"${c1}                N?+???${c2}?                 %s")
			;;
		"BunsenLabs")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'blue')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="5"
			logowidth="25"
			fulloutput=(
"${c1}            HC]          "
"${c1}          H]]]]          "
"${c1}        H]]]]]]4         "
"${c1}      @C]]]]]]]]*        "
"${c1}     @]]]]]]]]]]xd       "
"${c1}    @]]]]]]]]]]]]]d      %s"
"${c1}   0]]]]]]]]]]]]]]]]     %s"
"${c1}   kx]]]]]]x]]x]]]]]%%    %s"
"${c1}  #x]]]]]]]]]]]]]x]]]d   %s"
"${c1}  #]]]]]]qW  x]]x]]]]]4  %s"
"${c1}  k]x]]xg     %%x]]]]]]%%  %s"
"${c1}  Wx]]]W       x]]]]]]]  %s"
"${c1}  #]]]4         xx]]x]]  %s"
"${c1}   px]           ]]]]]x  %s"
"${c1}   Wx]           x]]x]]  %s"
"${c1}    &x           x]]]]   %s"
"${c1}     m           x]]]]   %s"
"${c1}                 x]x]    %s"
"${c1}                 x]]]    %s"
"${c1}                ]]]]     %s"
"${c1}                x]x      %s"
"${c1}               x]q       %s"
"${c1}               ]g        %s"
"${c1}              q          %s")
		;;

		"SteamOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'grey') # Gray
				c2=$(getColor 'purple') # Dark Purple
				c3=$(getColor 'light purple') # Light Purple
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="37"
			fulloutput=(
"${c2}               .,,,,.                %s"
"${c2}         .,'onNMMMMMNNnn',.          %s"
"${c2}      .'oNM${c3}ANK${c2}MMMMMMMMMMMNNn'.       %s"
"${c3}    .'ANMMMMMMMXK${c2}NNWWWPFFWNNMNn.     %s"
"${c3}   ;NNMMMMMMMMMMNWW'' ${c2},.., 'WMMM,    %s"
"${c3}  ;NMMMMV+##+VNWWW' ${c3}.+;'':+, 'WM${c2}W,   %s"
"${c3} ,VNNWP+${c1}######${c3}+WW,  ${c1}+:    ${c3}:+, +MMM,  %s"
"${c3} '${c1}+#############,   +.    ,+' ${c3}+NMMM  %s"
"${c1}   '*#########*'     '*,,*' ${c3}.+NMMMM. %s"
"${c1}      \`'*###*'          ,.,;###${c3}+WNM, %s"
"${c1}          .,;;,      .;##########${c3}+W  %s"
"${c1} ,',.         ';  ,+##############'  %s"
"${c1}  '###+. :,. .,; ,###############'   %s"
"${c1}   '####.. \`'' .,###############'    %s"
"${c1}     '#####+++################'      %s"
"${c1}       '*##################*'        %s"
"${c1}          ''*##########*''           %s"
"${c1}               ''''''                %s")
		;;

		"SailfishOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'dark grey') # Grey
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="32"
			fulloutput=(                          
"${c1}                 _a@b            %s"
"${c1}              _#b (b             %s"
"${c1}            _@@   @_         _,  %s"
"${c1}          _#^@ _#*^^*gg,aa@^^    %s"
"${c1}          #- @@^  _a@^^          %s"
"${c1}          @_  *g#b               %s"
"${c1}          ^@_   ^@_              %s"
"${c1}            ^@_   @              %s"
"${c1}             @(b (b              %s"
"${c1}            #b(b#^               %s"
"${c1}          _@_#@^                 %s"
"${c1}       _a@a*^                    %s"
"${c1}   ,a@*^                         %s")                 
		;;

		"Qubes OS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'cyan')
				c2=$(getColor 'blue')
				c3=$(getColor 'light blue')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="47"
			fulloutput=(
"${c3}                      ####                     %s"
"${c3}                    ########                   %s"
"${c3}                  ############                 %s"
"${c3}                #######  #######               %s"
"${c1}              #${c3}######      ######${c2}#             %s"
"${c1}            ####${c3}###          ###${c2}####           %s"
"${c1}          ######        ${c2}        ######         %s"
"${c1}          ######        ${c2}        ######         %s"
"${c1}          ######        ${c2}        ######         %s"
"${c1}          ######        ${c2}        ######         %s"
"${c1}          ######        ${c2}        ######         %s"
"${c1}            #######     ${c2}     #######           %s"
"${c1}              #######   ${c2}   #########           %s"
"${c1}                ####### ${c2} ##############        %s"
"${c1}                  ######${c2}######  ######         %s"
"${c1}                    ####${c2}####     ###           %s"
"${c1}                      ##${c2}##                     %s"
"${c1}                                               %s")
		;;

		"PCLinuxOS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'blue') # Blue
				c2=$(getColor 'light grey') # White
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			logowidth="50"
			fulloutput=(
"${c1}                                                  %s"
"${c1}                                             <NNN>%s"
"${c1}                                           <NNY   %s"
"${c1}                 <ooooo>--.               ((      %s"
"${c1}               Aoooooooooooo>--.           \\\\\\     %s"
"${c1}              AooodNNNNNNNNNNNNNNNN>--.     ))    %s"
"${c2}          (${c1}  AoodNNNNNNNNNNNNNNNNNNNNNNN>-///'    %s"
"${c2}          \\\\\\\\${c1}AodNNNNNNNNNNNNNNNNNNNNNNNNNNNY/      %s"
"${c1}           AodNNNNNNNNNNNNNNNNNNNNNNNNNNNNN       %s"
"${c1}          AdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA       %s"
"${c1}         (${c2}/)${c1}NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNA      %s"
"${c2}         //${c1}<NNNNNNNNNNNNNNNNNY'   YNNY YNNNN      %s"
"${c2} ,====#Y//${c1}   \`<NNNNNNNNNNNY       ANY     YNA     %s"
"${c1}               ANY<NNNNYYN       .NY        YN.   %s"
"${c1}             (NNY       NN      (NND       (NND   %s"
"${c1}                      (NNU                        %s"
"${c1}                                                  %s")
		;;

		"Exherbo")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'dark grey')  # Black
				c2=$(getColor 'light blue') # Blue
				c3=$(getColor 'light red')  # Beige
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
			startline="0"
			logowidth="46"
			fulloutput=(
"${c1}  ,                                           %s"
"${c1}  OXo.                                        %s"
"${c1}  NXdX0:    .cok0KXNNXXK0ko:.                 %s"
"${c1}  KX  '0XdKMMK;.xMMMk, .0MMMMMXx;  ...        %s"
"${c1}  'NO..xWkMMx   kMMM    cMMMMMX,NMWOxOXd.     %s"
"${c1}    cNMk  NK    .oXM.   OMMMMO. 0MMNo  kW.    %s"
"${c1}    lMc   o:       .,   .oKNk;   ;NMMWlxW'    %s"
"${c1}   ;Mc    ..   .,,'    .0M${c2}g;${c1}WMN'dWMMMMMMO     %s"
"${c1}   XX        ,WMMMMW.  cM${c2}cfli${c1}WMKlo.   .kMk    %s"
"${c1}  .Mo        .WM${c2}GD${c1}MW.   XM${c2}WO0${c1}MMk        oMl   %s"
"${c1}  ,M:         ,XMMWx::,''oOK0x;          NM.  %s"
"${c1}  'Ml      ,kNKOxxxxxkkO0XXKOd:.         oMk  %s"
"${c1}   NK    .0Nxc${c3}:::::::::::::::${c1}fkKNk,      .MW  %s"
"${c1}   ,Mo  .NXc${c3}::${c1}qXWXb${c3}::::::::::${c1}oo${c3}::${c1}lNK.    .MW  %s"
"${c1}    ;Wo oMd${c3}:::${c1}oNMNP${c3}::::::::${c1}oWMMMx${c3}:${c1}c0M;   lMO  %s"
"${c1}     'NO;W0c${c3}:::::::::::::::${c1}dMMMMO${c3}::${c1}lMk  .WM'  %s"
"${c1}       xWONXdc${c3}::::::::::::::${c1}oOOo${c3}::${c1}lXN. ,WMd   %s"
"${c1}        'KWWNXXK0Okxxo,${c3}:::::::${c1},lkKNo  xMMO    %s"
"${c1}          :XMNxl,';:lodxkOO000Oxc. .oWMMo     %s"
"${c1}            'dXMMXkl;,.        .,o0MMNo'      %s"
"${c1}               ':d0XWMMMMWNNNNMMMNOl'         %s"
"${c1}                     ':okKXWNKkl'             %s")
		;;

		"Red Star OS")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light red')  # Red
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="45"
			fulloutput=(
"${c1}                      ..                     %s"
"${c1}                    .oK0l                    %s"
"${c1}                   :0KKKKd.                  %s"
"${c1}                 .xKO0KKKKd                  %s"
"${c1}                ,Od' .d0000l                 %s"
"${c1}               .c;.   .'''...           ..'. %s"
"${c1}  .,:cloddxxxkkkkOOOOkkkkkkkkxxxxxxxxxkkkx:  %s"
"${c1}  ;kOOOOOOOkxOkc'...',;;;;,,,'',;;:cllc:,.   %s"
"${c1}   .okkkkd,.lko  .......',;:cllc:;,,'''''.   %s"
"${c1}     .cdo. :xd' cd:.  ..';'',,,'',,;;;,'.    %s"
"${c1}        . .ddl.;doooc'..;oc;'..';::;,'.      %s"
"${c1}          coo;.oooolllllllcccc:'.  .         %s"
"${c1}         .ool''lllllccccccc:::::;.           %s"
"${c1}         ;lll. .':cccc:::::::;;;;'           %s"
"${c1}         :lcc:'',..';::::;;;;;;;,,.          %s"
"${c1}         :cccc::::;...';;;;;,,,,,,.          %s"
"${c1}         ,::::::;;;,'.  ..',,,,'''.          %s"
"${c1}          ........          ......           %s"
"${c1}                                             %s")
		;;

		"SparkyLinux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light gray') # Gray
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="48"
			fulloutput=(
"${c1}             .            \`-:-\`                %s"
"${c1}            .o\`       .-///-\`                  %s"
"${c1}           \`oo\`    .:/++:.                     %s"
"${c1}           os+\`  -/+++:\` \`\`.........\`\`\`        %s"
"${c1}          /ys+\`./+++/-.-::::::----......\`\`     %s"
"${c1}         \`syyo\`++o+--::::-::/+++/-\`\`           %s"
"${c1}         -yyy+.+o+\`:/:-:sdmmmmmmmmdy+-\`        %s"
"${c1}  ::-\`   :yyy/-oo.-+/\`ymho++++++oyhdmdy/\`      %s"
"${c1}  \`/yy+-\`.syyo\`+o..o--h..osyhhddhs+//osyy/\`    %s"
"${c1}    -ydhs+-oyy/.+o.-: \` \`  :/::+ydhy+\`\`\`-os-   %s"
"${c1}     .sdddy::syo--/:.     \`.:dy+-ohhho    ./:  %s"
"${c1}       :yddds/:+oo+//:-\`- /+ +hy+.shhy:     \`\` %s"
"${c1}        \`:ydmmdysooooooo-.ss\`/yss--oyyo        %s"
"${c1}          \`./ossyyyyo+:-/oo:.osso- .oys        %s"
"${c1}         \`\`..-------::////.-oooo/   :so        %s"
"${c1}      \`...----::::::::--.\`/oooo:    .o:        %s"
"${c1}             \`\`\`\`\`\`\`     ++o+:\`     \`:\`        %s"
"${c1}                       ./+/-\`        \`         %s"
"${c1}                     \`-:-.                     %s"
"${c1}                     \`\`                        %s")
		;;

		"Pardus")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'yellow') # Light Yellow
				c2=$(getColor 'dark grey') # Light Gray
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="1"
			logowidth="45"
			fulloutput=(
""
"${c1}   .smNdy+-    \`.:/osyyso+:.\`    -+ydmNs.   %s"
"${c1}  /Md- -/ymMdmNNdhso/::/oshdNNmdMmy/. :dM/  %s"
"${c1}  mN.     oMdyy- -y          \`-dMo     .Nm  %s"
"${c1}  .mN+\`  sMy hN+ -:             yMs  \`+Nm.  %s"
"${c1}   \`yMMddMs.dy \`+\`               sMddMMy\`   %s"
"${c1}     +MMMo  .\`  .                 oMMM+     %s"
"${c1}     \`NM/    \`\`\`\`\`.\`    \`.\`\`\`\`\`    +MN\`     %s"
"${c1}     yM+   \`.-:yhomy    ymohy:-.\`   +My     %s"
"${c1}     yM:          yo    oy          :My     %s"
"${c1}     +Ms         .N\`    \`N.      +h sM+     %s"
"${c1}     \`MN      -   -::::::-   : :o:+\`NM\`     %s"
"${c1}      yM/    sh   -dMMMMd-   ho  +y+My      %s"
"${c1}      .dNhsohMh-//: /mm/ ://-yMyoshNd\`      %s"
"${c1}        \`-ommNMm+:/. oo ./:+mMNmmo:\`        %s"
"${c1}       \`/o+.-somNh- :yy: -hNmos-.+o/\`       %s"
"${c1}      ./\` .s/\`s+sMdd+\`\`+ddMs+s\`/s. \`/.      %s"
"${c1}          : -y.  -hNmddmNy.  .y- :          %s"
"${c1}           -+       \`..\`       +-           %s"
"%s")
		;;

		"SwagArch")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="48"
			fulloutput=(
"${c1}                                               %s"
"${c1}          .;ldkOKXXNNNNXXK0Oxoc,.              %s"
"${c1}     ,lkXMMNK0OkkxkkOKWMMMMMMMMMM;             %s"
"${c1}   'K0xo  ..,;:c:.     \`'lKMMMMM0              %s"
"${c1}       .lONMMMMMM'         \`lNMk'              %s"
"${c1}      ;WMMMMMMMMMO.              ${c2}....::...     %s"
"${c1}      OMMMMMMMMMMMMKl.       ${c2}.,;;;;;ccccccc,   %s"
"${c1}      \`0MMMMMMMMMMMMMM0:         ${c2}.. .ccccccc.  %s"
"${c1}        'kWMMMMMMMMMMMMMNo.   ${c2}.,:'  .ccccccc.  %s"
"${c1}          \`c0MMMMMMMMMMMMMN,${c2},:c;    :cccccc:   %s"
"${c1}   ckl.      \`lXMMMMMMMMMX${c2}occcc:.. ;ccccccc.   %s"
"${c1}  dMMMMXd,     \`OMMMMMMWk${c2}ccc;:''\` ,ccccccc:    %s"
"${c1}  XMMMMMMMWKkxxOWMMMMMNo${c2}ccc;     .cccccccc.    %s"
"${c1}   \`':ldxO0KXXXXXK0Okdo${c2}cccc.     :cccccccc.    %s"
"${c2}                      :ccc:'     \`cccccccc:,   %s"
"${c2}                                     ''        %s"
"${c2}                                               %s")
		;;

		"OBRevenge")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'red') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="48"
			fulloutput=(
"${c1}       _@@@@   @@@g_      	%s"
"${c1}     _@@@@@@   @@@@@@     	%s"
"${c1}    _@@@@@@M   W@@@@@@_   	%s"
"${c1}   j@@@@P        ^W@@@@   	%s"
"${c1}   @@@@L____  _____Q@@@@  	%s"
"${c1}  Q@@@@@@@@@@j@@@@@@@@@@  	%s"
"${c1}  @@@@@    T@j@    T@@@@@	%s"
"${c1}  @@@@@ ___Q@J@    _@@@@@ 	%s"
"${c1}  @@@@@fMMM@@j@jggg@@@@@@ 	%s"
"${c1}  @@@@@    j@j@^MW@P @@@@ 	%s"
"${c1}  Q@@@@@ggg@@f@   @@@@@@L 	%s"
"${c1}  ^@@@@WWMMP  @    Q@@@@  	%s"
"${c1}   @@@@@_         _@@@@l  	%s"
"${c1}    W@@@@@g_____g@@@@@P   	%s"
"${c1}     @@@@@@@@@@@@@@@@l    	%s"
"${c1}      ^W@@@@@@@@@@@P      	%s"
"${c1}         ^TMMMMTll   		%s"
"${c1}                                  %s")
		;;

		"Parrot Security")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="43"
			fulloutput=(
"${c1}    ,:oho/-.                              %s"
"${c1}   mMMMMMMMMMMMNmmdhy-                    %s"
"${c1}   dMMMMMMMMMMMMMMMMMMs.                  %s"
"${c1}   +MMsohNMMMMMMMMMMMMMm/                 %s"
"${c1}   .My   .+dMMMMMMMMMMMMMh.               %s"
"${c1}    +       :NMMMMMMMMMMMMNo              %s"
"${c1}             \`yMMMMMMMMMMMMMm:            %s"
"${c1}               /NMMMMMMMMMMMMMy.          %s"
"${c1}                .hMMMMMMMMMMMMMN+         %s"
"${c1}                    \`\`-NMMMMMMMMMd-       %s"
"${c1}                       /MMMMMMMMMMMs.     %s"
"${c1}                        mMMMMMMMsyNMN/    %s"
"${c1}                        +MMMMMMMo  :sNh.  %s"
"${c1}                        \`NMMMMMMm     -o/ %s"
"${c1}                         oMMMMMMM.        %s"
"${c1}                         \`NMMMMMM+        %s"
"${c1}                          +MMd/NMh        %s"
"${c1}                           mMm -mN\`       %s"
"${c1}                           /MM  \`h:       %s"
"${c1}                            dM\`   .       %s"
"${c1}                            :M-           %s"
"${c1}                             d:           %s"
"${c1}                             -+           %s"
"${c1}                              -           %s")
		;;

		"Amazon Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'light orange') # Orange
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="0"
			logowidth="40"
			fulloutput=(
"${c1}               .,:cc:,.              %s"
"${c1}          .:okXWMMMMMMWXko:.         %s"
"${c1}      .:kNMMMMMMMMMMMMMMMMMMNkc.     %s"
"${c1}   cc,.    \`':ox0XWWXOxo:'\`    .,c;  %s"
"${c1}   KMMMMXOdc,.    ''    .,cdOXWMMMO  %s"
"${c1}   KMMMMMMMMMMWXO.  .OXWMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMO  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMk  %s"
"${c1}   KMMMMMMMMMMMMM,  ,MMMMMMMMMMMMMd  %s"
"${c1}   \`:lx0WMMMMMMMM,  ,MMMMMMMMW0xl:\`  %s"
"${c1}         \`'lx0NMM,  ,MMN0xc'\`        %s"
"${c1}               \`''  ''\`              %s")
		;;

		"Source Mage GNU/Linux")
			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'dark gray')
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
			startline="1"
			logowidth="40"
			fulloutput=(
"${c1}                              "
"${c1}       -sdNMNds:              %s"
"${c1} .shmNMMMMMMNNNNh.            %s"
"${c1}  \` \':sNNNNNNNNNNm-           %s"
"${c1}      .NNNNNNmmmmmdo.         %s"
"${c1}     -mNmmmmmmmmmmddd:        %s"
"${c1}     +mmmmmmmddddddddh-       %s"
"${c1}     :mmdddddddddhhhhhy.      %s"
"${c1}     -ddddddhhhhhhhhyyyo      %s"
"${c1}     .hyhhhhhhhyyyyyyyys:     %s"
"${c1}      .\`shyyyyyyyyyssssso     %s"
"${c1}        \`/yyyysssssssoooo.    %s"
"${c1}          .osssssooooo+++/    %s"
"${c1}           \`:+oooo+++++///.   %s"
"${c1}            \`://++//////::-   %s"
"${c1}        ..-///  .//::::::--.  %s"
"${c1}       \`\`\`\` \`\`\`  :::--------\` %s"
"${c1}                 \`------....\` %s"
"${c1}                  \`.........\` %s"
"${c1}                  \`......\` %s")
		;;

		*)
			if [ "$(echo "${kernel}" | grep 'Linux' )" ]; then
				if [[ "$no_color" != "1" ]]; then
					c1=$(getColor 'white') # White
					c2=$(getColor 'dark grey') # Light Gray
					c3=$(getColor 'yellow') # Light Yellow
				fi
				if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; c3="${my_lcolor}"; fi
				startline="0"
				logowidth="28"
				fulloutput=(
"${c2}                            %s"
"${c2}                            %s"
"${c2}                            %s"
"${c2}         #####              %s"
"${c2}        #######             %s"
"${c2}        ##"${c1}"O${c2}#"${c1}"O${c2}##             %s"
"${c2}        #${c3}#####${c2}#             %s"
"${c2}      ##${c1}##${c3}###${c1}##${c2}##           %s"
"${c2}     #${c1}##########${c2}##          %s"
"${c2}    #${c1}############${c2}##         %s"
"${c2}    #${c1}############${c2}###        %s"
"${c3}   ##${c2}#${c1}###########${c2}##${c3}#        %s"
"${c3} ######${c2}#${c1}#######${c2}#${c3}######      %s"
"${c3} #######${c2}#${c1}#####${c2}#${c3}#######      %s"
"${c3}   #####${c2}#######${c3}#####        %s"
"${c2}                            %s"
"${c2}                            %s"
"${c2}                            %s")

			elif [[ "$(echo "${kernel}" | grep 'GNU' )" || "$(echo "${kernel}" | grep 'Hurd' )" || "${OSTYPE}" == "gnu" ]]; then
				if [[ "$no_color" != "1" ]]; then
					c1=$(getColor 'dark grey') # Light Gray
				fi
				if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
				startline="0"
				logowidth="37"
				fulloutput=(
"${c1}    _-\`\`\`\`\`-,           ,- '- .      %s"
"${c1}   .'   .- - |          | - -.  \`.   %s"
"${c1}  /.'  /                     \`.   \\  %s"
"${c1} :/   :      _...   ..._      \`\`   : %s"
"${c1} ::   :     /._ .\`:'_.._\\.    ||   : %s"
"${c1} ::    \`._ ./  ,\`  :    \\ . _.''   . %s"
"${c1} \`:.      /   |  -.  \\-. \\\\\_      /  %s"
"${c1}   \\:._ _/  .'   .@)  \\@) \` \`\\ ,.'   %s"
"${c1}      _/,--'       .- .\\,-.\`--\`.     %s"
"${c1}        ,'/''     (( \\ \`  )          %s"
"${c1}         /'/'  \\    \`-'  (           %s"
"${c1}          '/''  \`._,-----'           %s"
"${c1}           ''/'    .,---'            %s"
"${c1}            ''/'      ;:             %s"
"${c1}              ''/''  ''/             %s"
"${c1}                ''/''/''             %s"
"${c1}                  '/'/'              %s"
"${c1}                   \`;                %s")
# Source: https://www.gnu.org/graphics/alternative-ascii.en.html
# Copyright (C) 2003, Vijay Kumar
# Permission is granted to copy, distribute and/or modify this image under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.

			else
				if [[ "$no_color" != "1" ]]; then
					c1=$(getColor 'light green') # Light Green
				fi
				if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; fi
				startline="0"
				logowidth="44"
				fulloutput=(
"${c1}                                            %s"
"${c1}                                            %s"
"${c1} UUU     UUU NNN      NNN IIIII XXX     XXXX%s"
"${c1} UUU     UUU NNNN     NNN  III    XX   xXX  %s"
"${c1} UUU     UUU NNNNN    NNN  III     XX xXX   %s"
"${c1} UUU     UUU NNN NN   NNN  III      XXXX    %s"
"${c1} UUU     UUU NNN  NN  NNN  III      xXX     %s"
"${c1} UUU     UUU NNN   NN NNN  III     xXXXX    %s"
"${c1} UUU     UUU NNN    NNNNN  III    xXX  XX   %s"
"${c1}  UUUuuuUUU  NNN     NNNN  III   xXX    XX  %s"
"${c1}    UUUUU    NNN      NNN IIIII xXXx    xXXx%s"
"${c1}                                            %s"
"${c1}                                            %s"
"${c1}                                            %s"
"${c1}                                            %s")
			fi
		;;
	esac


	# Truncate lines based on terminal width.
	if [ "$truncateSet" == "Yes" ]; then
		missinglines=$((${#out_array[*]} + ${startline} - ${#fulloutput[*]}))
		for ((i=0; i<${missinglines}; i++)); do
			fulloutput+=("${c1}$(printf '%*s' "$logowidth")%s")
		done
		for ((i=0; i<${#fulloutput[@]}; i++)); do
			my_out=$(printf "${fulloutput[i]}$c0\n" "${out_array}")
			my_out_full=$(echo "$my_out" | cat -v)
			termWidth=$(tput cols)
			SHOPT_EXTGLOB_STATE=$(shopt -p extglob)
			read SHOPT_CMD SHOPT_STATE SHOPT_OPT <<< ${SHOPT_EXTGLOB_STATE}
			if [[ ${SHOPT_STATE} == "-u" ]]; then
				shopt -s extglob
			fi

			stringReal="${my_out_full//\^\[\[@([0-9]|[0-9];[0-9][0-9])m}"

			if [[ ${SHOPT_STATE} == "-u" ]]; then
				shopt -u extglob
			fi

			if [[ "${#stringReal}" -le "${termWidth}" ]]; then
				echo -e "${my_out}"$c0
			elif [[ "${#stringReal}" -gt "${termWidth}" ]]; then
				((NORMAL_CHAR_COUNT=0))
				for ((j=0; j<=${#my_out_full}; j++)); do
					if [[ "${my_out_full:${j}:3}" == '^[[' ]]; then
						if [[ "${my_out_full:${j}:5}" =~ ^\^\[\[[[:digit:]]m$ ]]; then
							if [[ ${j} -eq 0 ]]; then
								j=$((${j} + 5))
							else
								j=$((${j} + 4))
							fi
						elif [[ "${my_out_full:${j}:8}" =~ ^\^\[\[[[:digit:]]\;[[:digit:]][[:digit:]]m ]]; then
							if [[ ${j} -eq 0 ]]; then
								j=$((${j} + 8))
							else
								j=$((${j} + 7))
							fi
						fi
					else
						((NORMAL_CHAR_COUNT++))
						if [[ ${NORMAL_CHAR_COUNT} -ge ${termWidth} ]]; then
							echo -e "${my_out:0:$((${j} - 5))}"$c0
							break 1
						fi
					fi
				done
			fi

			if [[ "$i" -ge "$startline" ]]; then
				unset out_array[0]
				out_array=( "${out_array[@]}" )
			fi
		done

	elif [[ "$portraitSet" = "Yes" ]]; then
		for ((i=0; $i<${#fulloutput[*]}; i++)); do
			printf "${fulloutput[$i]}$c0\n"
		done

		printf "\n"

		for ((i=0; $i<${#fulloutput[*]}; i++)); do
			[[ -z "$out_array" ]] && continue
			printf "%s\n" "${out_array}"
			unset out_array[0]
			out_array=( "${out_array[@]}" )
		done

	elif [[ "$display_logo" == "Yes" ]]; then
		for ((i=0; i<${#fulloutput[*]}; i++)); do
			printf "${fulloutput[i]}$c0\n"
		done

	else
		if [[ "$lineWrap" = "Yes" ]]; then
			availablespace=$(($(tput cols) - ${logowidth} + 16)) #I dont know why 16 but it works
			new_out_array=("${out_array[0]}")
			for ((i=1; i<${#out_array[@]}; i++)); do
				lines=$(echo ${out_array[i]} | fmt -w $availablespace)
				IFS=$'\n' read -rd '' -a splitlines <<<"$lines"
				new_out_array+=("${splitlines[0]}")
				for ((j=1; j<${#splitlines[*]}; j++)); do
					line=$(echo -e "$labelcolor $textcolor  ${splitlines[j]}")
					new_out_array=( "${new_out_array[@]}" "$line" );
				done
			done
			out_array=("${new_out_array[@]}")
		fi
		missinglines=$((${#out_array[*]} + ${startline} - ${#fulloutput[*]}))
		for ((i=0; i<${missinglines}; i++)); do
			fulloutput+=("${c1}$(printf '%*s' "$logowidth")%s")
		done
		#n=${#fulloutput[*]}
		for ((i=0; i<${#fulloutput[*]}; i++)); do
			# echo "${out_array[@]}"
			febreeze=$(awk 'BEGIN{srand();print int(rand()*(1000-1))+1 }')
			if [[ "${febreeze}" == "411" || "${febreeze}" == "188" || "${febreeze}" == "15" || "${febreeze}" == "166" || "${febreeze}" == "609" ]]; then
				f_size=${#fulloutput[*]}
				o_size=${#out_array[*]}
				f_max=$(( 32768 / f_size * f_size ))
				#o_max=$(( 32768 / o_size * o_size ))
				for ((a=f_size-1; a>0; a--)); do
					while (( (rand=$RANDOM) >= f_max )); do :; done
					rand=$(( rand % (a+1) ))
					tmp=${fulloutput[a]} fulloutput[a]=${fulloutput[rand]} fulloutput[rand]=$tmp
				done
				for ((b=o_size-1; b>0; b--)); do
					rand=$(( rand % (b+1) ))
					tmp=${out_array[b]} out_array[b]=${out_array[rand]} out_array[rand]=$tmp
				done
			fi
			printf "${fulloutput[i]}$c0\n" "${out_array}"
			if [[ "$i" -ge "$startline" ]]; then
				unset out_array[0]
				out_array=( "${out_array[@]}" )
			fi
		done
	fi
	# Done with ASCII output
}

infoDisplay () {
	textcolor="\033[0m"
	[[ "$my_hcolor" ]] && textcolor="${my_hcolor}"
	#TODO: Centralize colors and use them across the board so we only change them one place.
	myascii="${distro}"
	[[ "${asc_distro}" ]] && myascii="${asc_distro}"
	case ${myascii} in
		"Alpine Linux"|"Arch Linux - Old"|"blackPanther OS"|"Fedora"|"Korora"|"Chapeau"|"Mandriva"|"Mandrake"|"Chakra"|"ChromeOS"|"Sabayon"|"Slackware"|"Mac OS X"|"Trisquel"|"Kali Linux"|"Jiyuu Linux"|"Antergos"|"KaOS"|"Logos"|"gNewSense"|"Netrunner"|"NixOS"|"SailfishOS"|"Qubes OS"|"Kogaion"|"PCLinuxOS"|"Obarun"|"Siduction"|"Solus"|"SwagArch"|"Parrot Security"|"Zorin OS") labelcolor=$(getColor 'light blue');;
		"Arch Linux"|"Artix Linux"|"Frugalware"|"Mageia"|"Deepin"|"CRUX") labelcolor=$(getColor 'light cyan');;
		"Mint"|"LMDE"|"KDE neon"|"openSUSE"|"SUSE Linux Enterprise"|"LinuxDeepin"|"DragonflyBSD"|"Manjaro"|"Manjaro-tree"|"Android"|"Void Linux"|"DesaOS") labelcolor=$(getColor 'light green');;
		"Ubuntu"|"FreeBSD"|"FreeBSD - Old"|"Debian"|"Raspbian"|"BSD"|"Red Hat Enterprise Linux"|"Oracle Linux"|"Peppermint"|"Cygwin"|"Msys"|"Fuduntu"|"Scientific Linux"|"DragonFlyBSD"|"BackTrack Linux"|"Red Star OS"|"SparkyLinux"|"OBRevenge"|"Source Mage GNU/Linux") labelcolor=$(getColor 'light red');;
		"ROSA") labelcolor=$(getColor 'white');;
		"CrunchBang"|"Viperr"|"elementary"*) labelcolor=$(getColor 'dark grey');;
		"Hyperbola GNU/Linux-libre"|*) labelcolor=$(getColor 'light grey');;
		"Gentoo"|"Parabola GNU/Linux-libre"|"Funtoo"|"Funtoo-text"|"BLAG"|"SteamOS"|"Devuan") labelcolor=$(getColor 'light purple');;
		"Haiku") labelcolor=$(getColor 'green');;
		"NetBSD"|"Amazon Linux"|"Proxmox VE") labelcolor=$(getColor 'orange');;
		"CentOS"|*) labelcolor=$(getColor 'yellow');;
	esac
	[[ "$my_lcolor" ]] && labelcolor="${my_lcolor}"
	if [[ "$art" ]]; then source "$art"; fi
	if [[ "$no_color" == "1" ]]; then labelcolor=""; bold=""; c0=""; textcolor=""; fi
	# Some verbosity stuff
	[[ "$screenshot" == "1" ]] && verboseOut "Screenshot will be taken after info is displayed."
	[[ "$upload" == "1" ]] && verboseOut "Screenshot will be transferred/uploaded to specified location."
	#########################
	# Info Variable Setting #
	#########################
	if [[ "${distro}" == "Android" ]]; then
		myhostname=$(echo -e "${labelcolor} ${hostname}"); out_array=( "${out_array[@]}" "$myhostname" )
		mydistro=$(echo -e "$labelcolor OS:$textcolor $distro $distro_ver"); out_array=( "${out_array[@]}" "$mydistro" )
		mydevice=$(echo -e "$labelcolor Device:$textcolor $device"); out_array=( "${out_array[@]}" "$mydevice" )
		myrom=$(echo -e "$labelcolor ROM:$textcolor $rom"); out_array=( "${out_array[@]}" "$myrom" )
		mybaseband=$(echo -e "$labelcolor Baseband:$textcolor $baseband"); out_array=( "${out_array[@]}" "$mybaseband" )
		mykernel=$(echo -e "$labelcolor Kernel:$textcolor $kernel"); out_array=( "${out_array[@]}" "$mykernel" )
		myuptime=$(echo -e "$labelcolor Uptime:$textcolor $uptime"); out_array=( "${out_array[@]}" "$myuptime" )
		mycpu=$(echo -e "$labelcolor CPU:$textcolor $cpu"); out_array=( "${out_array[@]}" "$mycpu" )
		mygpu=$(echo -e "$labelcolor GPU:$textcolor $cpu"); out_array=( "${out_array[@]}" "$mygpu" )
		mymem=$(echo -e "$labelcolor RAM:$textcolor $mem"); out_array=( "${out_array[@]}" "$mymem" )
	else
		if [[ "${display[@]}" =~ "host" ]]; then myinfo=$(echo -e "${labelcolor} ${myUser}$textcolor${bold}@${c0}${labelcolor}${myHost}"); out_array=( "${out_array[@]}" "$myinfo" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "distro" ]]; then
			if [ "$distro" == "Mac OS X" ]; then
				sysArch=`str1=$(getconf LONG_BIT);echo ${str1}bit`
				prodVers=`prodVers=$(sw_vers|grep ProductVersion);echo ${prodVers:15}`
				buildVers=`buildVers=$(sw_vers|grep BuildVersion);echo ${buildVers:14}`
				if [ -n "$distro_more" ]; then mydistro=$(echo -e "$labelcolor OS:$textcolor $distro_more $sysArch")
				else mydistro=$(echo -e "$labelcolor OS:$textcolor $sysArch $distro $prodVers $buildVers"); fi
			elif [[ "$distro" == "Cygwin" || "$distro" == "Msys" ]]; then
				distro="$(wmic os get caption | sed 's/\r//g; s/[ \t]*$//g; 2!d')"
				if [[ "$(wmic os get version | grep -o '^10\.')" == "10." ]]; then
					distro="$distro (v$(wmic os get version | grep '^10\.' | tr -d ' '))"
				fi
				sysArch=$(wmic os get OSArchitecture | sed 's/\r//g; s/[ \t]*$//g; 2!d')
				mydistro=$(echo -e "$labelcolor OS:$textcolor $distro $sysArch")
			else
				if [ -n "$distro_more" ]; then mydistro=$(echo -e "$labelcolor OS:$textcolor $distro_more")
				else mydistro=$(echo -e "$labelcolor OS:$textcolor $distro $sysArch"); fi
			fi
			out_array=( "${out_array[@]}" "$mydistro$wsl" )
			((display_index++))
		fi
		if [[ "${display[@]}" =~ "kernel" ]]; then mykernel=$(echo -e "$labelcolor Kernel:$textcolor $kernel"); out_array=( "${out_array[@]}" "$mykernel" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "uptime" ]]; then myuptime=$(echo -e "$labelcolor Uptime:$textcolor $uptime"); out_array=( "${out_array[@]}" "$myuptime" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "pkgs" ]]; then mypkgs=$(echo -e "$labelcolor Packages:$textcolor $pkgs"); out_array=( "${out_array[@]}" "$mypkgs" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "shell" ]]; then myshell=$(echo -e "$labelcolor Shell:$textcolor $myShell"); out_array=( "${out_array[@]}" "$myshell" ); ((display_index++)); fi
		if [[ -n "$DISPLAY" || "$distro" == "Mac OS X" ]]; then
			if [ -n "${xResolution}" ]; then
				if [[ "${display[@]}" =~ "res" ]]; then myres=$(echo -e "$labelcolor Resolution:${textcolor} $xResolution"); out_array=( "${out_array[@]}" "$myres" ); ((display_index++)); fi
			fi
			if [[ "${display[@]}" =~ "de" ]]; then
				if [[ "${DE}" != "Not Present" ]]; then
					myde=$(echo -e "$labelcolor DE:$textcolor $DE"); out_array=( "${out_array[@]}" "$myde" ); ((display_index++))
				fi
			fi
			if [[ "${display[@]}" =~ "wm" ]]; then mywm=$(echo -e "$labelcolor WM:$textcolor $WM"); out_array=( "${out_array[@]}" "$mywm" ); ((display_index++)); fi
			if [[ "${display[@]}" =~ "wmtheme" ]]; then
					if [[ "${Win_theme}" == "Not Applicable" || "${Win_theme}" == "Not Found" ]]; then
						:
					else
						mywmtheme=$(echo -e "$labelcolor WM Theme:$textcolor $Win_theme"); out_array=( "${out_array[@]}" "$mywmtheme" ); ((display_index++)); fi
					fi
			if [[ "${display[@]}" =~ "gtk" ]]; then
				if [ "$distro" == "Mac OS X" ]; then
					if [[ "$gtkFont" != "Not Applicable" && "$gtkFont" != "Not Found" ]]; then
						if [ -n "$gtkFont" ]; then
							myfont=$(echo -e "$labelcolor Font:$textcolor $gtkFont"); out_array=( "${out_array[@]}" "$myfont" ); ((display_index++))
						fi
					fi
				else
					if [[ "$gtk2Theme" != "Not Applicable" && "$gtk2Theme" != "Not Found" ]]; then
						if [ -n "$gtk2Theme" ]; then
							mygtk2="${gtk2Theme} [GTK2]"
						fi
					fi
					if [[ "$gtk3Theme" != "Not Applicable" && "$gtk3Theme" != "Not Found" ]]; then
						if [ -n "$mygtk2" ]; then
							mygtk3=", ${gtk3Theme} [GTK3]"
						else
							mygtk3="${gtk3Theme} [GTK3]"
						fi
					fi
					if [[ "$gtk_2line" == "yes" ]]; then
						mygtk2=$(echo -e "$labelcolor GTK2 Theme:$textcolor $gtk2Theme"); out_array=( "${out_array[@]}" "$mygtk2" ); ((display_index++))
						mygtk3=$(echo -e "$labelcolor GTK3 Theme:$textcolor $gtk3Theme"); out_array=( "${out_array[@]}" "$mygtk3" ); ((display_index++))
					else
						if [[ "$gtk2Theme" == "$gtk3Theme" ]]; then
							if [[ "$gtk2Theme" != "Not Applicable" && "$gtk2Theme" != "Not Found" ]]; then
								mygtk=$(echo -e "$labelcolor GTK Theme:$textcolor ${gtk2Theme} [GTK2/3]"); out_array=( "${out_array[@]}" "$mygtk" ); ((display_index++))
							fi
						else
							mygtk=$(echo -e "$labelcolor GTK Theme:$textcolor ${mygtk2}${mygtk3}"); out_array=( "${out_array[@]}" "$mygtk" ); ((display_index++))
						fi
					fi
					if [[ "$gtkIcons" != "Not Applicable" && "$gtkIcons" != "Not Found" ]]; then
						if [ -n "$gtkIcons" ]; then
							myicons=$(echo -e "$labelcolor Icon Theme:$textcolor $gtkIcons"); out_array=( "${out_array[@]}" "$myicons" ); ((display_index++))
						fi
					fi
					if [[ "$gtkFont" != "Not Applicable" && "$gtkFont" != "Not Found" ]]; then
						if [ -n "$gtkFont" ]; then
							myfont=$(echo -e "$labelcolor Font:$textcolor $gtkFont"); out_array=( "${out_array[@]}" "$myfont" ); ((display_index++))
						fi
					fi
					# [ "$gtkBackground" ] && mybg=$(echo -e "$labelcolor BG:$textcolor $gtkBackground"); out_array=( "${out_array[@]}" "$mybg" ); ((display_index++))
				fi
			fi
		elif [[ "$fake_distro" == "Cygwin" || "$fake_distro" == "Msys" || "$fake_distro" == "Windows - Modern" ]]; then
			if [[ "${display[@]}" =~ "res" && -n "$xResolution" ]]; then myres=$(echo -e "$labelcolor Resolution:${textcolor} $xResolution"); out_array=( "${out_array[@]}" "$myres" ); ((display_index++)); fi
			if [[ "${display[@]}" =~ "de" ]]; then
				if [[ "${DE}" != "Not Present" ]]; then
					myde=$(echo -e "$labelcolor DE:$textcolor $DE"); out_array=( "${out_array[@]}" "$myde" ); ((display_index++))
				fi
			fi
			if [[ "${display[@]}" =~ "wm" ]]; then mywm=$(echo -e "$labelcolor WM:$textcolor $WM"); out_array=( "${out_array[@]}" "$mywm" ); ((display_index++)); fi
			if [[ "${display[@]}" =~ "wmtheme" ]]; then
				if [[ "${Win_theme}" == "Not Applicable" || "${Win_theme}" == "Not Found" ]]; then
					:
				else
					mywmtheme=$(echo -e "$labelcolor WM Theme:$textcolor $Win_theme"); out_array=( "${out_array[@]}" "$mywmtheme" ); ((display_index++))
				fi
			fi
		elif [[ "$distro" == "Haiku" ]]; then
			if [ -n "${xResolution}" ]; then
				if [[ "${display[@]}" =~ "res" ]]; then myres=$(echo -e "$labelcolor Resolution:${textcolor} $xResolution"); out_array=( "${out_array[@]}" "$myres" ); ((display_index++)); fi
			fi
		fi
		[[ "${fake_distro}" != "Cygwin" && "${fake_distro}" != "Msys" && "${fake_distro}" != "Windows - Modern" ]] && if [[ "${display[@]}" =~ "disk" ]]; then mydisk=$(echo -e "$labelcolor Disk:$textcolor $diskusage"); out_array=( "${out_array[@]}" "$mydisk" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "cpu" ]]; then mycpu=$(echo -e "$labelcolor CPU:$textcolor $cpu"); out_array=( "${out_array[@]}" "$mycpu" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "gpu" ]] && [[ "$gpu" != "Not Found" ]]; then mygpu=$(echo -e "$labelcolor GPU:$textcolor $gpu"); out_array=( "${out_array[@]}" "$mygpu" ); ((display_index++)); fi
		if [[ "${display[@]}" =~ "mem" ]]; then mymem=$(echo -e "$labelcolor RAM:$textcolor $mem"); out_array=( "${out_array[@]}" "$mymem" ); ((display_index++)); fi
		if [[ "$use_customlines" = 1 ]]; then customlines; fi
	fi
	if [[ "$display_type" == "ASCII" ]]; then
		asciiText
	else
		if [[ "${display[@]}" =~ "host" ]]; then echo -e "$myinfo"; fi
		if [[ "${display[@]}" =~ "distro" ]]; then echo -e "$mydistro"; fi
		if [[ "${display[@]}" =~ "kernel" ]]; then echo -e "$mykernel"; fi
		if [[ "${distro}" == "Android" ]]; then
			echo -e "$mydevice"
			echo -e "$myrom"
			echo -e "$mybaseband"
			echo -e "$mykernel"
			echo -e "$myuptime"
			echo -e "$mycpu"
			echo -e "$mymem"
		else
			if [[ "${display[@]}" =~ "uptime" ]]; then echo -e "$myuptime"; fi
			if [[ "${display[@]}" =~ "pkgs" && "$mypkgs" != "Unknown" ]]; then echo -e "$mypkgs"; fi
			if [[ "${display[@]}" =~ "shell" ]]; then echo -e "$myshell"; fi
			if [[ "${display[@]}" =~ "res" ]]; then
				test -z "$myres" || echo -e "$myres"
			fi
			if [[ "${display[@]}" =~ "de" ]]; then
				if [[ "${DE}" != "Not Present" ]]; then echo -e "$myde"; fi
			fi
			if [[ "${display[@]}" =~ "wm" ]]; then
				test -z "$mywm" || echo -e "$mywm"
				if [[ "${Win_theme}" != "Not Applicable" && "${Win_theme}" != "Not Found" ]]; then
					test -z "$mywmtheme" || echo -e "$mywmtheme"
				fi
			fi
			if [[ "${display[@]}" =~ "gtk" ]]; then
				if [[ "$gtk_2line" == "yes" ]]; then
					test -z "$mygtk2" || echo -e "$mygtk2"
					test -z "$mygtk3" || echo -e "$mygtk3"
				else
					test -z "$mygtk" || echo -e "$mygtk"
				fi
				test -z "$myicons" || echo -e "$myicons"
				test -z "$myfont" || echo -e "$myfont"
			fi
			if [[ "${display[@]}" =~ "disk" ]]; then echo -e "$mydisk"; fi
			if [[ "${display[@]}" =~ "cpu" ]]; then echo -e "$mycpu"; fi
			if [[ "${display[@]}" =~ "gpu" ]]; then echo -e "$mygpu"; fi
			if [[ "${display[@]}" =~ "mem" ]]; then echo -e "$mymem"; fi
		fi
	fi
}