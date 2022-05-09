#!/bin/sh
date=`date +"%Y%m%d"`
cd /root/vaultwarden
docker-compose down | tee vaultwarden_update_$date.txt > /dev/null
docker pull vaultwarden/server | tee -a vaultwarden_update_$date.txt > /dev/null
docker-compose up -d | tee -a vaultwarden_update_$date.txt > /dev/null
uptime | tee -a vaultwarden_update_$date.txt > /dev/null
mail -s 'VaultWarden_UPDATE' mail@mail.com < ./vaultwarden_update_$date.txt
rm -rf ./vaultwarden_update_$date.txt

