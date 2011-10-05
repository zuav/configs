#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited
xscreensaver &
xset r rate 250 50
unclutter -root &
xsetroot -solid black -cursor_name top_left_arrow
setxkbmap -option -option grp:alt_shift_toggle,altwin:meta_win
xbindkeys

#emacs -fs -fn "Monospace-10" &
emacs -fs -fn "-monotype-Courier New-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1" &
#iceweasel &
#vmware &
exec ratpoison
