#!/bin/bash
read -rp "Domain/Host: " -e host
echo "$host" >> /root/domain
echo "$host" >> /etc/v2ray/domain
systemctl restart v2ray
clear
read -p "Ketik Enter Untuk Kembali Ke Menu..."
sleep 1
menu
exit 0
fi
