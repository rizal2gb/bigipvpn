#!/bin/bash
rm -rf /etc/xray/domain
rm -rf /etc/xray
systemctl stop ssrmu
systemctl stop ws-tls
systemctl stop ws-nontls
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
sleep 2
clear
echo "System fresh, commit installer..."
cd /root && wget https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/setup.sh && chmod +x setup.sh && ./setup.sh