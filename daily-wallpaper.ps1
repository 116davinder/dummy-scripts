
Set-Variable -Name "bing_region" -Value "en-UK"
Set-Variable -Name "download_location" -Value "C:\Users\davin\Downloads\wallpapers"
Set-Variable -Name "bing_url" -Value "https://bing.biturl.top/?resolution=1920&format=json&index=0&mkt=$bing_region"
Set-Variable -Name "cleanUpDays" -Value 5 

$response=Invoke-RestMethod $bing_url

$today_wall_url=$response.url

$today_wall_name=$today_wall_url.split('=')[1]

Remove-Item $download_location\$today_wall_name -ErrorAction SilentlyContinue

# download the wallpaper
Invoke-WebRequest -Uri $today_wall_url -OutFile $download_location\$today_wall_name

Get-ChildItem -Force -Recurse -File -Path $download_location -ErrorAction SilentlyContinue `
    | Where-Object { $_.CreationTime.Date -lt (Get-Date).Date.AddDays(-$cleanUpDays) } `
    | Remove-Item -Force
