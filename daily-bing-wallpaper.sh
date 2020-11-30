#!/bin/bash

bing_region="en-UK"
download_location="/home/dpal/Pictures"
bing_url="https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=$bing_region"

today_wall_url=$(curl -s  $bing_url | jq .url | tr -d '"')

today_wall_name=$(echo $today_wall_url | cut -d "=" -f2 | tr -d '"')

# echo $today_wall_url
# echo $today_wall_name

# download the wallpaper
curl -s -o $download_location/$today_wall_name $today_wall_url

# update the current wallpaper
gsettings set org.gnome.desktop.background picture-uri file:///$download_location/$today_wall_name
