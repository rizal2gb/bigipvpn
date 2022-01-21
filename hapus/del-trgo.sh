#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(curl -s ipinfo.io/ip);
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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Tidak ada akun Trojan-Go yang akan dihapus"
		sleep 1
        menu
        exit 0
	fi

	echo ""
	echo " Pilih akun Trojan-Go yang akan dihapus"
    echo " Tekan CTRL+C untuk membatalkan"
	echo " =========================================="
	echo "    No  User  Expired"
    echo " =========================================="
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 |      nl -s ') '
    echo " ------------------------------------------"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan-go/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
systemctl restart trojan-go
service cron restart
clear
echo
echo -e " Trojan-Go Account Deleted Successfully" | lolcat
echo -e " ======================================" | lolcat
echo -e " Client Name : $user" | lolcat
echo -e " Expired On  : $exp" | lolcat
echo -e " ======================================" | lolcat
echo ""
read -rp " Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
