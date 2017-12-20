#!/bin/bash

xdg-open "$(locate home media | rofi -threads 0 -width 100 -padding 100 -opacity "85" -bw 2 -bc "red" -bg "red" -fg "red" -hlbg "blue" -hlfg "black" -font "System San Francisco Display 18" -dmenu -i -p "locate:")"



