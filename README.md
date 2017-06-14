# WifiFirst

# 0. Unzip the WifiFirst folder in the location of your choice (later called "location"")

# 1. Run : sh CreateInterfaces.sh to initialise interfaces files

# 2. Create cron as root :
  # 2a. Run : sudo crontab -e 
  # 2b. In the file, copy : */5 * * * * /"location"/WifiFirst/setNetwork.sh
  # 2c. Save and exit


