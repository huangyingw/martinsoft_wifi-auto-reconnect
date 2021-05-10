#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

HOSTRC="$(hostname).rc"

if [ ! -f "$HOSTRC" ]
then
    echo -e "${red}no host rc for this host... ${NC}"
    exit 1
fi

source "$HOSTRC"

cp -f wifiautoreconnect_template wifiautoreconnect
sed -i.bak "s|ROUTER_IP_ADDRESS_VAR|$ROUTER_IP_ADDRESS|g" wifiautoreconnect
mkdir -p ~/Library/Scripts/
cp -f wifiautoreconnect ~/Library/Scripts/

SCRIPT_LOCATION=$(realpath ~/Library/Scripts/wifiautoreconnect)
cp -f net.martinsoft.wifiautoreconnect.plist_template net.martinsoft.wifiautoreconnect.plist
sed -i.bak "s|SCRIPT_LOCATION_VAR|$SCRIPT_LOCATION|g" net.martinsoft.wifiautoreconnect.plist
cp -fv net.martinsoft.wifiautoreconnect.plist ~/Library/LaunchAgents/

launchctl unload ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist 
launchctl load ~/Library/LaunchAgents/net.martinsoft.wifiautoreconnect.plist
