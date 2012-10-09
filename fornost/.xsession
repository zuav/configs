#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited

xscreensaver &
xset r rate 250 50
xsetroot -solid black 
xbindkeys

emacs -fs -fn "-unknown-Liberation Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1" &


exec ratpoison
