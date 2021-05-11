#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

PLIST="/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist"
launchctl unload "$PLIST"
launchctl unload ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
