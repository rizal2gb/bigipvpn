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
echo "    Buat akun Trojan-Go"
echo "════════════════════════════"
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
if [[ "$IPHost" = "" ]]; then
PUBLIC_IP=$(wget -qO- ipv4.icanhazip.com);
else
PUBLIC_IP=$IPHost
fi
IP=$(curl -s ipinfo.io/ip);
trgo="$(cat ~/log-install.txt | grep -i Trojan-go | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Username: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo " Nama sudah ada, masukan nama yang lain."
			sleep 2
            add-trgo
		fi
	done
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
trogolink="trojan-go://${user}@${domain}:2096/?sni=${domain}&type=ws&host=${domain}&path=%2Ftrojan-go&encryption=none#${user}"
systemctl restart trojan-go
clear
echo
echo -e "════════════════════════════" | lolcat
echo -e "           ${red}Trojan-Go${NC}"
echo -e "════════════════════════════" | lolcat
echo -e "Address     : ${PUBLIC_IP}" | lolcat
echo -e "Host        : ${domain}" | lolcat
echo -e "Port        : 2096" | lolcat
echo -e "Key         : ${user}" | lolcat
echo -e "Type        : Websocket" | lolcat
echo -e "Patch       : /trojan-go" | lolcat
echo -e "Expired     : $exp" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Link        : ${trogolink}" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "${red}AutoScriptSSH By Ronggolawe${NC}"
echo -e "════════════════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
