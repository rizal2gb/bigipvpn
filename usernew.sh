#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
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
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
IP=$(wget -qO- ipinfo.io/ip);
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
db="$(cat ~/log-install.txt | grep -w "Dropbear" | cut -d: -f2)"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
wssl="$(cat ~/log-install.txt | grep -w "CDN TLS" | cut -d: -f2)"
wsovpn="$(cat ~/log-install.txt | grep -w "CDN Ovpn" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
echo Ping Host | lolcat
echo Cek Hak Akses... | lolcat
sleep 0.5
echo Permission Accepted | lolcat
clear
sleep 0.5
echo Membuat Akun: $Login | lolcat
sleep 0.5
echo Setting Password: $Pass | lolcat
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "════════════════════════════" | lolcat
echo -e "Terimakasih Telah Berkunjung Ke Server Kami" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Berikut Adalah Informasi" | lolcat
echo -e "Akun SSH & OpenVPN By ${domain}" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Username       : $Login " | lolcat
echo -e "Password       : $Pass" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Domain         : ${domain}" | lolcat
echo -e "Host           : $IP" | lolcat
echo -e "ISP            : $ISP" | lolcat
echo -e "CITY           : $CITY" | lolcat
echo -e "OpenSSH        : 22" | lolcat
echo -e "Dropbear       : 109, 69, 77" | lolcat
echo -e "SSL/TLS        : $ssl" | lolcat
echo -e "Port SSH CDN   : 8880" | lolcat
echo -e "Port CDN TLS   : 443" | lolcat
echo -e "Port CDN OVPN  : $wsovpn" | lolcat
echo -e "Port Squid     : $sqd" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "OpenVPN        : TCP $ovpn http://$IP:81/client-tcp-$ovpn.ovpn" | lolcat
echo -e "OpenVPN        : UDP $ovpn2 http://$IP:81/client-udp-$ovpn2.ovpn" | lolcat
echo -e "OpenVPN        : SSL 442 http://$IP:81/client-tcp-ssl.ovpn" | lolcat
echo -e "badvpn         : 7100-7300" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "PAYLOAD WS DB" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "PAYLOAD WS SSL" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "GET ${domain}://bug.com/ HTTP/1.1[crlf]Host: ${domain}[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "Created        : $now" | lolcat
echo -e "Expired On     : $exp" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "AutoScript By JAGOANNEON" | lolcat
echo -e "════════════════════════════" | lolcat
echo -e "~ Beli Dong Masa Engga Hehehe ~" | lolcat
echo -e "~ Garansi 30Hari ~" | lolcat
echo -e "~ Mulai Dari Tanggal Pembelian ~" | lolcat
echo -e "~ Terimakasih Selamat Menikmati ~" | lolcat
echo -e""
read -p "Ketik Enter Untuk Kembali Ke Menu...."
sleep 1
menu
exit 0
fi
