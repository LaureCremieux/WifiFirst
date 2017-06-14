#!/bin/sh

# Copying the interfaces config file prioritizing the Wifi
sudo cp ./interfaces/interfacesWifiFirst /etc/network/interfaces

# Restarting networking service to activate the changes
sudo ifdown --exclude=lo -a && sudo ifup --exclude=lo -a
echo "The wifi was set as your priority network"

# Copying the interfaces config file that doesn't prioritize to avoid bugs on reboot (remains unactivated)
sudo cp ./interfaces/interfacesVirgin /etc/network/interfaces



