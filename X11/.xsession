xrandr --output eDP-1 --same-as VGA-1 &  # Duplicate monitors
setxkbmap -option caps:escape & # Remap Caps Lock into escape
xmodmap -e 'clear mod5' &  # Remap AltGr to Alt
xmodmap -e 'keycode 108 = Alt_L' &
feh --bg-scale ~/Pictures/wallpaper.png & # Set wallpaper
compton -b # start opacity manager
