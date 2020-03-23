#!/bin/bash
#     ______     __  __     ______   ______        ______   __    __     __  __     __  __
#    /\  __ \   /\ \/\ \   /\__  _\ /\  __ \      /\__  _\ /\ "-./  \   /\ \/\ \   /\_\_\_\
#    \ \  __ \  \ \ \_\ \  \/_/\ \/ \ \ \/\ \     \/_/\ \/ \ \ \-./\ \  \ \ \_\ \  \/_/\_\/_
#     \ \_\ \_\  \ \_____\    \ \_\  \ \_____\       \ \_\  \ \_\ \ \_\  \ \_____\   /\_\/\_\
#      \/_/\/_/   \/_____/     \/_/   \/_____/        \/_/   \/_/  \/_/   \/_____/   \/_/\/_/
#      A TMUX AUTOMATOR THAT ACTUALLY WORKS FOR A RECENT TMUX VERSION.
#       (THAT ACTUALLY WORKS)
#ext deps & def
window=$(tmux display-message -p "#S"):$(tmux display-message -p "#{window_index}")
active_pane=$(tmux display-message -p  "#{pane_index}")
autotmux_version="1.1"
# errors
optmesg="\e[38;5;9mstart.sh: error: no options provided\e[m"
if [ $# == 0 ] ; then echo -e $optmesg >&2 ; exit 1 ; fi   #no option msg

PWD="/home/server/seriousservers"


e_ok() {
	printf "[ ok ]"
}
e_fail() {
	printf "[shit]"
}
serverstart() {
	# 1 is pane
	# 2 is command
	pan=${1:-$active_pane}
	com=${2:-nothing}

	tmux select-pane -t $window.${apane}
	tmux send-keys -t $window.${1} 'command ' $com Enter
}

split() {
	# 1 is v/h (vertical/horizontal)
	# 2 is pane # (assumed selected if nothing given)
	prepre=${2:-$window}
	pre=$window.$prepre
	tmux select-pane -t $pre #this just finds the current active session > window > pane, its all i could do without stackoverflow
	tmux split-window -$1
}

pane() {
	tmux select-pane -t $window.$1
}

echo -e "Loaded autotmux ${autotmux_version} on $(tmux -V)" ; e_ok || e_fail

#rstart 2 asdasd 1G '' pi3-0.lan

echo "Loading config" ; e_ok
. ./$1
echo -e "\e[m" ; exit 0