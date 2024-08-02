#!/bin/zsh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c $HOME/.config/polybar/config.ini &
  done
else
  polybar -c $HOME/.config/polybar/config.ini &
fi

echo "Polybar launched"
