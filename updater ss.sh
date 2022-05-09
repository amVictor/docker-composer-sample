#!/bin/sh
date=`date +"%Y%m%d"`
cd /root/shadowsocks-libev
docker-compose down | tee shadowsocks-libev_update_$date.txt > /dev/null
docker pull teddysun/shadowsocks-libev | tee -a shadowsocks-libev_update_$date.txt > /dev/null
docker-compose up -d | tee -a shadowsocks-libev_update_$date.txt > /dev/null
uptime | tee -a shadowsocks-libev_update_$date.txt > /dev/null
mail -s 'Ss_UPDATE' mail@mail.com < ./shadowsocks-libev_update_$date.txt
rm -rf ./shadowsocks-libev_update_$date.txt
