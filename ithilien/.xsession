#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited
xscreensaver &
xset r rate 250 50
unclutter -root &
xsetroot -solid white -cursor_name top_left_arrow
xbindkeys
setxkbmap -rules xorg -model pc105 -layout "us,ru" -option "altwin:left_meta_win" -option "grp:alt_shift_toggle"

emacs -fs -fn "-monotype-courier new-medium-r-normal-*-18-*-*-*-*-*-*" &
iceweasel &
vmware &
exec ratpoison
