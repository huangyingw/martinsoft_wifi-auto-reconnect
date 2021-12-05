#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

launchctl unload /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 

sudo rm /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
sudo rm /Library/Scripts/wifiautoreconnect.sh
