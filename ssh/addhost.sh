#!/bin/bash
# Feel free to use
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN="skipped"
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e 
echo -e 
echo -e 
echo -e 
exit 0
fi
clear
read -rp "Domain/Host : " -e domain
echo "IP=$domain" >>/var/lib/joyvpn/ipvps.conf
echo $domain > /etc/xray/domain
echo start
systemctl stop xray.service
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
systemctl start xray.service
echo Done
sleep 1.5
clear
neofetch