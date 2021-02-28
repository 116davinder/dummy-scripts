#!/bin/bash

log_file="/tmp/daily-wallpaper.log"

echo $(date) >> $log_file

bing_region="en-UK"
download_location="/home/dpal/Pictures"
bing_url="https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=$bing_region"

today_wall_url=$(curl -s  $bing_url | jq .url | tr -d '"')

today_wall_name=$(echo $today_wall_url | cut -d "=" -f2 | tr -d '"')

echo $today_wall_url >> $log_file
echo $today_wall_name >> $log_file

# download the wallpaper
curl -s -o $download_location/$today_wall_name $today_wall_url

echo "update the current wallpaper" >> $log_file

gsettings set org.gnome.desktop.background picture-uri file:///$download_location/$today_wall_name

gsettings set org.gnome.desktop.screensaver picture-uri file:///$download_location/$today_wall_name
