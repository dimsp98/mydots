#!/bin/sh

#Xorg management
#xrandr --output HDMI-2 --primary --mode 1920x1080 --rate 120 --dpi 60 --rotate normal --output eDP-1 --off &
xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --dpi 60 --rotate normal &

#cursor
xsetroot -cursor_name left_ptr &

#compositor
pgrep -x picom >/dev/null || picom -b --config ~/.config/picom/picom.conf &

#wallpaper
feh --bg-scale --no-fehbg /home/dimitris/dotfiles/Backgrounds/wallpaperbetter.com_1920x1080.jpg &

#removable media
pgrep -x udiskie >/dev/null || udiskie &

#clipboard
xclip &

#change language
setxkbmap -model pc104 -layout us,gr -option 'grp:alt_shift_toggle' &

#notifications
pgrep -x dunst >/dev/null || dunst -c ~/.config/dunst/dunstrc &

#audio
exec dbus-run-session pipewire &

#polybar
~/.config/bspwm/bar.sh
