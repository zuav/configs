#!/bin/bash

. ~/.environment

ulimit -c unlimited
ulimit -n 1048576

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 "1920x1080_60.00"
xrandr --output Virtual1 --mode "1920x1080_60.00"
xset r rate 250 50
xsetroot -solid black 
xsetroot -cursor_name left_ptr
setxkbmap -layout 'us,ru' -option 'grp:alt_space_toggle,grp_led:scroll'

emacs -fs &
sleep 2s
google-chrome &

exec ratpoison
