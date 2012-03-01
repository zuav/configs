#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited

xscreensaver &
xset r rate 250 50
xsetroot -solid black 
xbindkeys

#emacs -fs -fn "-monotype-courier new-medium-r-normal-*-18-*-*-*-*-*-*" &
# 10.10.2011 -- 37
# 01.11.2011 -- 36
# 10.01.2012 -- 35
# 01.03.2012 -- 34
emacs -fs -fn "-unknown-Liberation Mono-normal-normal-normal-*-34-*-*-*-m-0-iso10646-1" &


exec ratpoison
