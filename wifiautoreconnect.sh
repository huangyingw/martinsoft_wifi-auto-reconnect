#!/bin/bash

ROUTER_IP_ADDRESS="ROUTER_IP_ADDRESS_VAR"
WIFI_DEVICE=`networksetup -listallhardwareports | grep --after-context=1 Wi-Fi | sed -n -e 's/^Device: //p'`


function isNetworkReachable {
    ping -q -o -t 5 -c 5 $ROUTER_IP_ADDRESS > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo 1
    else
        echo 0
    fi
}

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
    if [ $(isNetworkReachable) -eq 0 ]; then
        echo "Network is no longer reachable!"
        networkReboot
    else
        echo "Network is reachable"
    fi
    sleep 10
done
