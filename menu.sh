#!/bin/bash
merah="\e[1;31m"
hijau="\e[1;32m"
kuning="\e[1;33m"
biru="\e[1;34m"
putih="\e[1;37m"
cyan="\e[1;36m"
NC="\e[1;37m"
clear
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	echo "═════════════ Welcome To Premium Script Menu ═════════════"
	echo "═════════════  Premium Script By JAGOANNEON ═════════════"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

        echo -e "${cyan}══════════════════════════════════════════${NC}"
	echo -e "|| ${merah}CPU Model${NC}${putih}:${NC} $cname"
	echo -e "|| ${merah}Number Of Cores${NC}${putih}:${NC} $cores"
	echo -e "|| ${merah}CPU Frequency${NC}${putih}:${NC} $freq MHz"
	echo -e "|| ${merah}Total Amount Of RAM${NC}${putih}:${NC} $tram MB"
	echo -e "|| ${merah}Total Amount Of Swap${NC}${putih}:${NC} $swap MB"
	echo -e "|| ${merah}System Uptime${putih}:${NC} $up"
	echo -e "|| ${merah}Isp Name${NC}${putih}:${NC} $ISP"
	echo -e "|| ${merah}City${NC}${putih}:${NC} $CITY"
	echo -e "|| ${merah}Time${NC}${putih}:${NC} $WKT"
	echo -e "|| ${merah}IPVPS${NC}${putih}:${NC} $IPVPS"
        echo -e "|| ${merah}WhatsApp${NC}${putih}:${NC} ${hijau}wa.me/+6283857684916${NC}"
        echo -e "|| ${merah}Facebook${NC}${putih}:${NC} ${biru}Generasi Ronggolawe Tuban${NC}"
        echo -e "${cyan}══════════════════════════════════════════${NC}"
	date | lolcat
	echo -e "-----------------------------------------------------"
echo -e ""
echo -e "${cyan}══════════════════════════════════════════${NC}"

echo -e "    >>>>>>Daftar Tunneling Menu<<<<<<" | lolcat -a -d 10

echo -e "${cyan}══════════════════════════════════════════${NC}"
echo -e " 1.)  Control Panel SSH & OVPN"

echo -e " 2.)  Control Panel Wireguard"

echo -e " 3.)  Control Panel L2TP & PPTP"

echo -e " 4.)  Control Panel SSTP"

echo -e " 5.)  Control Panel SSR & Shadowsocks"

echo -e " 6.)  Control Panel Vmess-V2ray"

echo -e " 7.)  Control Panel Vless"

echo -e " 8.)  Control Panel Trojan-GFW"

echo -e " 9.)  Control Panel Trojan-Go"

echo -e ""
echo -e "${cyan}══════════════════════════════════════════${NC}"

echo -e "       >>>>>>System Menu<<<<<<" | lolcat -a -d 10

echo -e "${cyan}══════════════════════════════════════════${NC}"
echo -e " 10.)   Add Subdomain Host For VPS"

echo -e " 11.)  Renew Certificate V2RAY"

echo -e " 12.)  Change Port All Account Hubungi Admin"

echo -e " 13.)  Autobackup Data VPS"

echo -e " 14.)  Backup Data VPS"

echo -e " 15.)  Restore Data VPS"

echo -e " 16.)  Webmin Menu"

echo -e " 17.)  Limit Bandwith Speed Server"

echo -e " 18.)  Check Usage of VPS Ram"

echo -e " 19.)  Reboot VPS"

echo -e " 20.)  Speedtest VPS"

echo -e " 21.)  Information Display System"

echo -e " 22.)  Info Script Auto Install"

echo -e " 23.)  Restart All Service"

echo -e " 24.)  Set Auto Reboot"

echo -e " 25.)  Set Multi Login Akun"

echo -e " 26.)  Install BBR"

echo -e ""
echo -e "${cyan}══════════════════════════════════════════${NC}"

echo -e "    >>>>>>Pointing Domain or Bug<<<<<<" | lolcat -a -d 10

echo -e "${cyan}══════════════════════════════════════════${NC}"
echo -e " 27.)  Wilcard Domain"

echo -e " 28.)  Add ID Cloudfare"

echo -e " 29.)  Cloudfare Add-Ons"

echo -e " 30.)  Pointing Bug"

echo -e " 31.)  Status Tunneling"

echo -e " 32.)  Auto Pointing IP"

echo -e "${merah}══════════════════════════════════════════${NC}"

echo -e " x.   ${biru}Exit From Putty / JuiceSSH / Termux${NC}"

echo -e "${merah}══════════════════════════════════════════${NC}"

echo -e ""

read -p "     Please Input Number  [1-31 or x] :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

wgg

;;

3)

ltp

;;

4)

ssstp

;;

5)

sssr

;;

6)

wss

;;

7)

vls

;;

8)

trj

;;

9)

trjgo

;;

10)

add-host

;;

11)

certv2ray

;;

12)

change-port

;;

13)

autobackup

;;

14)

backup

;;

15)

restore

;;

16)

wbmn

;;

17)

limit-speed

;;

18)

ram

;;

19)

reboot

;;

20)

speedtest

;;

21)

info

;;

22)

about

;;

23)

restart

;;

24)

auto-reboot

;;

25)

autokill

;;

26)

bbr

;;

27)

wilcard

;;

28)

cff

;;

29)

cfd

;;

30)

cfh

;;

31)

running

;;

32)

wget https://raw.githubusercontent.com/rizal2gb/bigipvpn/main/cf.sh && chmod +x cf.sh && ./cf.sh

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac
