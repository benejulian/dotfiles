#!/bin/bash
#
#	~/.config/polybar/polybar.sh
#	This script is called in i3's config file and
#	is used to restart polybar whenever i3 reloads
#

killall -q polybar
while pgreg -x polybar >/dev/null; do sleep 1; done
polybar -r standard &
