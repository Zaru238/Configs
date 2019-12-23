#!/bin/sh

setxkbmap us & pkill -RTMIN+10 i3blocks & i3lock-fancy -p
