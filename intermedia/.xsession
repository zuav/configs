#!/bin/bash

. ~/.environment

ulimit -c unlimited

xscreensaver &
xset r rate 250 50
xsetroot -solid black 
xsetroot -cursor_name left_ptr
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll'
xbindkeys

emacs -fs &


exec ratpoison
