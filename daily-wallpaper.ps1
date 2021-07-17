
Set-Variable -Name "bing_region" -Value "en-UK"
Set-Variable -Name "download_location" -Value "C:\Users\davin\Downloads\wallpapers"
Set-Variable -Name "bing_url" -Value "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=$bing_region"

$response=Invoke-RestMethod $bing_url

$today_wall_url=$response.url

$today_wall_name=$today_wall_url.split('=')[1]

try {
    Remove-Item $download_location\$today_wall_name
}
catch [ItemNotFoundException] {
    pass
}

# download the wallpaper
Invoke-WebRequest -Uri $today_wall_url -OutFile $download_location\$today_wall_name

