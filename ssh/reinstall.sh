#!/bin/bash
clear
echo "Killing all process..."
rm -rf /etc/xray/domain
rm -rf /etc/xray
systemctl stop ssrmu
systemctl stop websocket
systemctl stop ws-ovpn
systemctl stop xray.service
systemctl stop shadowsocks-libev
systemctl stop xl2tpd
systemctl stop pptpd
systemctl stop ipsec
systemctl stop accel-ppp
systemctl stop ws-ovpn
systemctl stop wg-quick@wg0
systemctl stop ssh-ohp
systemctl stop dropbear-ohp
systemctl stop openvpn-ohp
systemctl stop trojan-go
/etc/init.d/ssrmu stop
/etc/init.d/ssh stop
/etc/init.d/dropbear stop
/etc/init.d/sslh stop
/etc/init.d/stunnel5 stop
/etc/init.d/openvpn stop
/etc/init.d/fail2ban stop
/etc/init.d/cron stop
/etc/init.d/nginx stop
/etc/init.d/squid stop
pkill openvpn
pkill python
pkill screen
clear
sleep 2
echo "Removing installed applications..."
apt remove shadowsocks-libev -y --purge
apt remove simple-obfs -y --purge
apt remove openvpn -y --purge
apt remove -y wireguard --purge
apt remove -y wireguard-tools --purge
apt -y remove dropbear --purge
apt -y remove squid3 --purge
apt -y remove nginx php php-fpm php-cli php-mysql libxml-parser-perl --purge
apt -y remove dropbear --purge
apt -y remove squid3 --purge
apt -y remove sslh --purge
apt -y remove vnstat --purge
apt -y remove libsqlite3-dev --purge
apt -y remove fail2ban --purge
apt -y remove chrony --purge
rm -rf /etc/default/dropbear
rm -rf /var/lib/dpkg/info/dropbear*
apt autoremove
clear
sleep 2
echo "System fresh, commit installer..."
cd /root && rm log-install.txt
cd /root && wget https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/setup.sh && chmod +x setup.sh && ./setup.sh
cd /root && rm *.sh*