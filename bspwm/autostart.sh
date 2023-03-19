#!/bin/zsh

#Xorg management
xsetroot -cursor_name left_ptr &
xrandr --output HDMI-1 --mode 1920x1080 --rate 60 &
xset s off &
xset -dpms &

#compositor
pgrep -x picom > /dev/null || picom --config ~/.config/picom/picom.conf &

#wallpaper
feh --bg-scale --no-fehbg /home/dimitris/dotfiles/Backgrounds/wallhaven-7pj8jo_2560x1440.png & 

#removable media
pgrep -x udiskie > /dev/null || udiskie &

#clipboard 
xclip &

#mpd 
pgrep -x mpd > /dev/null || mpd $HOME/.config/mpd/mpd.conf

#change language 
setxkbmap -model pc104 -layout us,gr -option 'grp:alt_shift_toggle' &

#notifications
pgrep -x dunst > /dev/null || dunst -c ~/.config/dunst/dunstrc &

#polybar 
~/.config/bspwm/bar.sh &
