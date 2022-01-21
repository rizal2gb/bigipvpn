#!/bin/bash
# Created by Mei 2020
# Modified by IDTunnel
#multi port debian / ubuntu

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://github.com/rizal2gb/bigipvpn/raw/main/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://github.com/rizal2gb/bigipvpn/raw/main/badvpn-udpgw64"
fi

wget -O /bin/badvpn-udpgw "https://github.com/rizal2gb/bigipvpn/raw/main/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /bin/badvpn-udpgw "https://github.com/rizal2gb/bigipvpn/raw/main/badvpn-udpgw64"
fi

#port BadVPN 7100
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local

#port BadVPN 7200
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local

#port BadVPN 7300
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local

#permission
chmod +x /usr/bin/badvpn-udpgw

#badvpn video call
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
