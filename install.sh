#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

if [ -f /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist  ]
then
    exit 0
fi

sudo mkdir -p /Library/Scripts/
sudo cp -fv wifiautoreconnect.sh /Library/Scripts/
sudo cp -fv net.martinsoft.wifiautoreconnect.plist /Library/LaunchAgents/

sudo launchctl unload /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
sudo launchctl load /Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
