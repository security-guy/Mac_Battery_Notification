#!/bin/bash

echo "[+] Changing Permissions of file"
chmod +x Battery_Status.sh

echo "[+] Moving file to /usr/local/bin PATH"

mv Battery_Status.sh /usr/local/bin/

echo "[+] Creating Cronjob to run the Battery_Status.sh script every 30 minutes"
cat <(crontab -l) <(echo "PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin" && echo "*/30 * * * * battery_checker.sh") | crontab -
