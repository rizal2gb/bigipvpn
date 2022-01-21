#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);
now=`date +"%Y-%m-%d"`
echo "Checking VPS"

if [ $MYIP = $MYIP]; then
echo -e "${green}Akses Di Izinkan...${NC}"
else
echo -e "${red}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083856228182"
exit 0
fi
clear
uuid=$(cat /etc/trojan/uuid.txt)
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
tr="$(cat ~/log-install.txt | grep -i Trojan | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:2087"
trojanlinkip="trojan://${PUBLIC_IP}:2087/bug.com#${user}"
clear
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e "           ${red}Trojan-GFW${NC}"
echo -e "════════════════════════════" | lolcat
echo -e "Remarks        : ${user}" | lolcat
echo -e "CITY           : $CITY" | lolcat
echo -e "ISP            : $ISP" | lolcat
echo -e "IP Address     : ${PUBLIC_IP}" | lolcat
echo -e "Host/IP        : ${domain}" | lolcat
echo -e "port           : 2087" | lolcat
echo -e "Key            : ${user}" | lolcat
echo -e "link           : ${trojanlink}" | lolcat
echo -e "link-inputWRT  : ${trojanlinkip}" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "    ${red}Config Xderm-mini${NC}"
echo -e "════════════════════════════" | lolcat
echo -e "host=${PUBLIC_IP}" | lolcat
echo -e "port=2087" | lolcat
echo -e "pudp=7300" | lolcat
echo -e "user=${user}" | lolcat
echo -e "pass=${user}" | lolcat
echo -e "sni=${domain}" | lolcat
echo -e "trojan://${PUBLIC_IP}:2087/bug.com" | lolcat
echo -e "mode=2" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Created        : $now" | lolcat
echo -e "Expired On     : $exp" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "${red}AutoScriptSSH By Ronggolawe${NC}"
echo -e "════════════════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
