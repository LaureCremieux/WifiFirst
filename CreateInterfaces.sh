#!/bin/sh 


# Grep names of Iface for wifi and usb ethernet
first=`route -n | awk 'NF>1{print $NF}' | tail -n+3 | awk 'NR==1{print $1}'`
second=`route -n | awk 'NF>1{print $NF}' | tail -n+3 | awk 'NR==2{print $1}'`
first1="$(echo $first | head -c 1)"
second1="$(echo $second | head -c 1)"

#Extract the name of the wifi network to put it in the config files
if [ "$first1" = "w" ]; then
    wifi=$first
elif [ "$second1" = "w" ]; then
    wifi=$second
else
    wifi="wlan0"
fi

sudo sed -i -e "s/wlp1s0/"$wifi"/g" ./interfaces/interfaces3gFirst
sudo sed -i -e "s/wlp1s0/"$wifi"/g" ./interfaces/interfacesWifiFirst


