#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

if [ $MYIP = $MYIP ]; then
echo -e "${green}Akses Di Izinkan...${NC}"
else
echo -e "${red}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083856228182"
exit 0
fi
clear
trgo="$(cat ~/log-install.txt | grep -i Trojan-go | cut -d: -f2|sed 's/ //g')"
echo -e "      Change Port $trgo"
read -p "New Port Trojan-go: " trgo2
if [ -z $trgo2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $trgo2)
if [[ -z $cek ]]; then
sed -i "s/$trgo/$trgo2/g" /etc/trojan-go/config.json
sed -i "s/   - Trojan-go                  : $trgo/   - Trojan-go                  : $trgo2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trgo -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trgo -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trgo2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trgo2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan-go > /dev/null
echo -e "\e[032;1mPort $trgo2 modified successfully\e[0m"
else
echo "Port $trgo2 is used"
fi
