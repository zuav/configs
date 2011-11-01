#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited

xscreensaver &
xset r rate 250 50
xsetroot -solid black 
xbindkeys

#emacs -fs -fn "-monotype-courier new-medium-r-normal-*-18-*-*-*-*-*-*" &
# 10.10.2011 -- 36
# 01.11.2011 -- 35
emacs -fs -fn "-unknown-Liberation Mono-normal-normal-normal-*-35-*-*-*-m-0-iso10646-1" &

exec ratpoison
