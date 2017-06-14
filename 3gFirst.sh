#!/bin/sh

# Copying the interfaces config file prioritizing the 3G
sudo cp ./interfaces/interfaces3gFirst /etc/network/interfaces

# Restarting networking service to activate the changes 
sudo /etc/init.d/networking restart
echo "The 3G was set as your priority network"

# Copying the interfaces config file that doesn't prioritize to avoid bugs on reboot (remains unactivated)
sudo cp ./interfaces/interfacesVirgin /etc/network/interfaces



