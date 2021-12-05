#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

sudo mkdir -p /Library/Scripts/
sudo cp -fv wifiautoreconnect.sh /Library/Scripts/

SCRIPT_LOCATION=$(realpath /Library/Scripts/wifiautoreconnect.sh)
cp -f net.martinsoft.wifiautoreconnect.plist_template net.martinsoft.wifiautoreconnect.plist
sed -i.bak "s|SCRIPT_LOCATION_VAR|$SCRIPT_LOCATION|g" net.martinsoft.wifiautoreconnect.plist
sudo cp -fv net.martinsoft.wifiautoreconnect.plist /Library/LaunchAgents/

launchctl unload /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
launchctl load /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
