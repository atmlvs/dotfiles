#!/bin/sh
sudo mount -t vboxsf wallpapers_1920x1080 ~/Downloads/wallpapers_1920x1080
sudo mount -t vboxsf sharevm ~/Downloads/sharevm
wallpaper=`find ~/Downloads/wallpapers_1920x1080 -type f | shuf -n 1`
echo "use wallpaper $wallpaper"
feh --bg-scale "$wallpaper"
echo "random wallpaper after 2 hours"
~/.config/scripts/wall_looper.sh ~/Downloads/wallpapers_1920x1080/ 7200 &
