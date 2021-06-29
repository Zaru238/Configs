#!/bin/sh

pidof i3lock >/dev/null && exit

setxkbmap us & pkill -RTMIN+10 i3blocks & xset dpms 10 & i3lock-fancy -p -n; xset dpms 600
