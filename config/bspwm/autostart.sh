#!/bin/sh

#Xorg management
#xrandr --output HDMI-2 --primary --mode 1920x1080 --rate 120 --dpi 60 --rotate normal --output eDP-1 --off &
xrandr --output eDP-1 --mode 1920x1080 --rate 60 --dpi 60 --rotate normal &

#cursor
xsetroot -cursor_name left_ptr &

#Xorg power management
xset s off -dpms &

#compositor
pgrep -x picom >/dev/null || picom -b --config ~/.config/picom/picom.conf &

#wallpaper
feh --bg-scale --no-fehbg /home/dimitris/dotfiles/Backgrounds/PAO.jpg &

#clipboard
xclip &

#change language
setxkbmap -model pc104 -layout us,gr -option 'grp:alt_shift_toggle' &

#notifications
pgrep -x dunst >/dev/null || dunst -c ~/.config/dunst/dunstrc &

#network
nm-applet &

#audio
pipewire &

#polybar
~/.config/bspwm/bar.sh
