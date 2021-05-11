#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

PLIST="/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist"
sudo launchctl unload "$PLIST"
sudo rm "$PLIST"

PLIST="~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist"
sudo launchctl unload "$PLIST"
sudo rm "$PLIST"
