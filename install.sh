#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

cp -fv net.martinsoft.wifiautoreconnect.plist ~/Library/LaunchAgents/
cp -fv wifiautoreconnect ~/Library/Scripts/
launchctl load ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
