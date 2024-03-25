#!/bin/zsh

#Xorg management
xrandr --output HDMI-1-2 --mode 1920x1080 --primary --rate 120 --dpi 60 --rotate normal & 
xrandr --output eDP-1-1 --off &
 
#compositor
pgrep -x picom > /dev/null || picom -b --config ~/.config/picom/picom.conf &

#wallpaper
feh --bg-scale --no-fehbg /home/dimitris/dotfiles/Backgrounds/wallhaven-7pj8jo_2560x1440.png & 

#removable media
pgrep -x udiskie > /dev/null || udiskie &

#clipboard 
xclip &

#change language 
setxkbmap -model pc104 -layout us,gr -option 'grp:alt_shift_toggle' &

#notifications
pgrep -x dunst > /dev/null || dunst -c ~/.config/dunst/dunstrc &

#polybar 
~/.config/bspwm/bar.sh &
