#!/usr/bin/env bash

# Kill existing Polybar instances
killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on each monitor
for MONITOR in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$MONITOR polybar --reload bar &
done

echo "Polybar launched on all monitors!"
