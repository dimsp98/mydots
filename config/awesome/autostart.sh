#!/bin/sh

#Xorg management
#xrandr --output HDMI-2 --primary --mode 1920x1080 --rate 120 --dpi 60 --rotate normal --output eDP-1 --off &
#xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60 --dpi 60 --rotate normal &

#Xorg power management
xset s off -dpms &

#keybinds
pgrep -x sxhkd >/dev/null || sxhkd -c $HOME/.config/sxhkd/sxhkdrc &

#compositor
pgrep -x picom >/dev/null || picom -b --config ~/.config/picom/picom.conf &

#wallpaper
feh --bg-scale --no-fehbg /home/dimitris/dotfiles/Backgrounds/wallpaperbetter.jpg &

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
