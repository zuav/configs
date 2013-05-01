#!/bin/bash

. ~/.xsessionrc

ulimit -c unlimited

eval $(gnome-keyring-daemon --start)

xscreensaver &
#udisks-glue

xset r rate 250 50
xsetroot -solid black 
setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll'
xbindkeys

emacs -fs &
google-chrome &


exec ratpoison
