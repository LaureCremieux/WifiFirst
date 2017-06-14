#!/bin/sh

route -n

# Grep names of Iface for wifi and usb ethernet
first=`route -n | awk 'NF>1{print $NF}' | tail -n+3 | awk 'NR==1{print $1}'`
second=`route -n | awk 'NF>1{print $NF}' | tail -n+3 | awk 'NR==2{print $1}'`
first1="$(echo $first | head -c 1)"
second1="$(echo $second | head -c 1)"

if [ "$first1" != "w" ]; then
    if  [ $second1 != "w" ]; then
	echo ee
    else
	echo ew
	sh WifiFirst.sh
	test=$(ping -c 4 8.8.8.8 | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1 )
	if [ $test -ge 1000 ]; then
	    echo response time of Wifi is too long, swapping back to 3G
	    sh 3gFirst.sh
	else
	    echo response time of Wifi is good, sticking to Wifi
	fi
    fi
else
    echo we or ww
    test=$(ping -c 4 8.8.8.8 | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1 )
    if [ $test -ge 1000 ]; then
	echo response time of Wifi is too long, swapping to 3G
	sh 3gFirst.sh
    else
	echo response time of Wifi is good, sticking to Wifi
    fi
fi
