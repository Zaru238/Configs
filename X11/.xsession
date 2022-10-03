# xrandr --output eDP-1 --same-as VGA-1 &  # Duplicate monitors Home config
xrandr --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off & # Work config
setxkbmap -option caps:escape & # Remap Caps Lock into escape
xmodmap -e 'clear mod5' &  # Remap AltGr to Alt
xmodmap -e 'keycode 108 = Alt_L' &
feh --bg-scale ~/Pictures/wallpaper.png & # Set wallpaper
picom -D 0 -i 1 -b & # start opacity manager
xhost local:root # allow X11 programs connection located on this machine (for docker)
