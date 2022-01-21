#!/bin/bash
clear
echo Installing Websocket-SSH Python
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
#Buat name user github dan nama folder
GitUser="rizal2gb"
namafolder="websocket"
#wget https://github.com/${GitUser}/main/${namafolder}/

#Install system auto run
#System OpenSSH Websocket-SSH Python

cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-dropbear.service
#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-stunnel.service
##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-ovpn.service

#Install Script Websocket-SSH Python

cd /usr/local/bin/
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-dropbear && chmod +x /usr/local/bin/ws-dropbear
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-stunnel && chmod +x /usr/local/bin/ws-stunnel
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/${GitUser}/bigipvpn/main/${namafolder}/ws-ovpn && chmod +x /usr/local/bin/ws-ovpn
#

systemctl daemon-reload

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
