#!/bin/bash
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
apt remove shadowsocks-libev -y
apt remove simple-obfs -y
apt remove openvpn -y
apt remove -y wireguard
apt remove -y wireguard-tools
apt -y remove dropbear
apt -y remove squid3
apt -y remove nginx php php-fpm php-cli php-mysql libxml-parser-perl
apt -y remove dropbear
apt -y remove squid3
apt -y remove sslh
apt -y remove vnstat
apt -y remove libsqlite3-dev
apt -y remove fail2ban
apt -y remove chrony
rm -rf /etc/default/dropbear
rm -rf /var/lib/dpkg/info/dropbear*
apt autoremove
sleep 2
clear
echo "System fresh, commit installer..."
cd /root && wget https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/setup.sh && chmod +x setup.sh && ./setup.sh