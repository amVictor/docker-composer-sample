#!/bin/sh 
date=`date +"%Y%m%d"` 
cd /root/nezha
./nezha.sh restart_and_update | tee nezha_update_$date.txt > /dev/null
uptime | tee -a nezha_update_$date.txt > /dev/null
mail -s 'NEZHA_UPDATE' mail@mail.com < ./nezha_update_$date.txt
rm -rf ./nezha_update_$date.txt
