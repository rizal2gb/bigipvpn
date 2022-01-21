#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);
now=`date +"%Y-%m-%d"`
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
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"64"',"email": "'""$user""'"' /etc/v2ray/config.json
cat>/etc/v2ray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/Ronggolawe",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
systemctl restart v2ray
systemctl restart v2ray@none
service cron restart
clear
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e "           ${red}Vmess-Tls${NC}"
echo -e "════════════════════════════" | lolcat
echo -e "Remarks        : ${user}" | lolcat
echo -e "CITY           : $CITY" | lolcat
echo -e "ISP            : $ISP" | lolcat
echo -e "IP Address     : ${PUBLIC_IP}" | lolcat
echo -e "Domain         : ${domain}" | lolcat
echo -e "port TLS       : ${tls}" | lolcat
echo -e "id             : ${uuid}" | lolcat
echo -e "alterId        : 0" | lolcat
echo -e "Security       : auto" | lolcat
echo -e "network        : ws" | lolcat
echo -e "path           : /Ronggolawe" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "link TLS       : ${vmesslink1}" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "    ${red}Config Xderm-mini${NC}"
echo -e "════════════════════════════" | lolcat
echo -e "host=${PUBLIC_IP}" | lolcat
echo -e "port=${none}" | lolcat
echo -e "pudp=7300" | lolcat
echo -e "user=${user}" | lolcat
echo -e "pass=${user}" | lolcat
echo -e "sni=masukkan bug di sini" | lolcat
echo -e "${vmesslink1}" | lolcat
echo -e "mode=1" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Created        : $now" | lolcat
echo -e "Expired On     : $exp" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "AutoScriptSSH By Ronggolawe" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
