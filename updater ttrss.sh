#!/bin/sh 
date=`date +"%Y%m%d"` 
cd /root/ttrss
docker-compose down | tee ttrss_update_$date.txt > /dev/null
docker pull wangqiru/ttrss | tee -a ttrss_update_$date.txt > /dev/null
docker-compose up -d | tee -a ttrss_update_$date.txt > /dev/null
uptime | tee -a ttrss_update_$date.txt > /dev/null
mail -s 'TTRSS_UPDATE' mail@mail.com < ./ttrss_update_$date.txt
rm -rf ./ttrss_update_$date.txt
