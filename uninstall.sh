#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

sudo launchctl unload ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
sudo launchctl unload /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 

sudo rm /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
sudo rm ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
