#!/bin/bash

. /etc/environment
. ~/.environment

ulimit -c unlimited

#xrandr --output HDMI1 --auto --left-of HDMI3
xscreensaver &
xset r rate 250 50
xsetroot -solid black 
xbindkeys

~/src/bitcoin/bitcoin-qt -gen &

#emacs -fs -fn "-monotype-courier new-medium-r-normal-*-18-*-*-*-*-*-*" &
# 10.10.2011 -- 37
# 01.11.2011 -- 36
# 10.01.2012 -- 35
# 01.03.2012 -- 34
# 02.04.2012 -- 33
# 02.05.2012 -- 32 (99x32)
# 01.06.2012 -- 31 (99x33)
# 07.08.2012 -- 30 (105x35)
# 03.09.2012 -- 29 (111x36)
emacs -fs -fn "-unknown-Liberation Mono-normal-normal-normal-*-29-*-*-*-m-0-iso10646-1" &

exec ratpoison
