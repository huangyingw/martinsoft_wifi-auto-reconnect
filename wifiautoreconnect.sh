#!/bin/bash

WIFI_DEVICE=`networksetup -listallhardwareports | grep --after-context=1 Wi-Fi | sed -n -e 's/^Device: //p'`

function turnWifiOff {
    networksetup -setairportpower $WIFI_DEVICE off
}

function turnWifiOn {
    networksetup -setairportpower $WIFI_DEVICE on
}

function isWifiOn {
    device_power=`networksetup -getairportpower $device_name`
    if [[ $device_power == *": Off" ]]; then
        echo 0
    else
        echo 1
    fi
}

function networkReboot {
    echo "Turning wifi off"
    turnWifiOff
    sleep 5
    echo "Turning wifi on"
    turnWifiOn
}

while [ 1 ]; do
    if [ $(networksetup -getinfo Wi-Fi | grep -c 'IP address:') = '1' ]
    then 
        echo "Network is reachable"
    else
        echo "Network is no longer reachable!"
        networkReboot
    fi
    sleep 10
done
