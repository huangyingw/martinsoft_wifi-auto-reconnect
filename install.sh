#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

sudo mkdir -p /Library/Scripts/
sudo cp -fv wifiautoreconnect.sh /Library/Scripts/
sudo cp -fv net.martinsoft.wifiautoreconnect.plist /Library/LaunchAgents/

launchctl unload /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
launchctl load /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
