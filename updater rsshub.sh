#!/bin/sh 
date=`date +"%Y%m%d"` 
cd /root/rsshub
docker-compose down | tee rsshub_update_$date.txt > /dev/null
docker pull diygod/rsshub | tee -a rsshub_update_$date.txt > /dev/null
docker-compose up -d | tee -a rsshub_update_$date.txt > /dev/null
uptime | tee -a rsshub_update_$date.txt > /dev/null
df -hl / /boot | tee -a rsshub_update_$date.txt > /dev/null
mail -s 'RSSHUB_UPDATE' mail@mail.com < ./rsshub_update_$date.txt
rm -rf ./rsshub_update_$date.txt
