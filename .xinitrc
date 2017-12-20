#Remap Caps to ESC
setxkbmap -option caps:escape
#Remap left Windows to CTRL
setxkbmap -option altwin:ctrl_win
# xmodmap ~/.config/Scripts/remaps
# 
## Random background wallpaper
while :; do
#	display -window root "$(find ~/Pictures/Wallpapers/1920x1200 -type f | shuf -n 1)"
	#feh --bg "$(find ~/Pictures/Wallpapers/1920x1080 -type f | shuf -n 1)" --bg "$(find ~/Pictures/Wallpapers/1920x1080 -type f | shuf -n 1)"
	feh --bg-scale "$(find ~/Pictures/Wallpapers/1920x1080 -type f | shuf -n 1)" --bg-scale "$(find ~/Pictures/Wallpapers/1920x1200 -type f | shuf -n 1)"
	sleep 15m
done &
 
#Mount usb stick
udiskie &

# Start i3
exec i3

