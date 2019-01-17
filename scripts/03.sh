!/bin/bash

blue="\033[0;34m"
brightblue="\033[1;34m"
cyan="\033[0;36m"
brightcyan="\033[1;36m"
green="\033[0;32m"
colors=($blue $brightblue $cyan $brightcyan $green)

spacing=${1:-100} 
scroll=${2:-0} 
screenlines=$(expr `tput lines` - 1 + $scroll)
screencols=$(expr `tput cols` / 2 - 1)

chars=(WUBS 🦕 🐙 🦑 🦐 🐡 🐠  🐟  🐬 🐳 🐋 🦈  🐊🐨 🐯 🦁 🐮 🐷 🐽 🐸 🐵 🦄 🐝 🐛 🦋 🐌 🐚 🍄)

count=${#chars[@]}
colorcount=${#colors[@]}

trap "tput sgr0; clear; exit" SIGTERM SIGINT

if [[ $1 =~ '-h' ]]; then
	echo "Display a Matrix(ish) screen in the terminal"
	echo "Usage:		matrix [SPACING [SCROLL]]"
	echo "Example:	matrix 100 0"
	exit 0
fi


clear
tput cup 0 0
while :
	trap '' 2
	do for i in $(eval echo {1..$screenlines})
		do for i in $(eval echo {1..$screencols})
			do rand=$(($RANDOM%$spacing))
				case $rand in
					0)
						printf "${colors[$RANDOM%$colorcount]}${chars[$RANDOM%$count]} "
						;;
					1)
						printf "  "
						;;
					*)
						printf "\033[2C"
						;;
				esac
			done
			printf "\n"

			# sleep .005
		done
		tput cup 0 0
	done
