#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

if [ $MYIP = $MYIP]; then
echo -e "${green}Akses Di Izinkan...${NC}"
else
echo -e "${merah}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083856228182"
exit 0
fi
clear
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     AutoKick JAGOANNEON      " | lolcat
echo -e ""
echo -e "     [1]  AutoKick After 5 Minutes" | lolcat
echo -e "     [2]  AutoKick After 15 Minutes" | lolcat
echo -e "     [3]  AutoKick After 30 Minutes" | lolcat
echo -e "     [4]  Turn Off AutoKick/MultiLogin" | lolcat
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat                                                                                        
echo -e ""
read -p "     Select From Options [1-4 or x] :  " AutoKick
echo -e ""
case $AutoKick in
                1)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e "      AutoKick By JAGOANNEON    " | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : 2" | lolcat
                echo -e "      AutoKick Every     : 5 Minutes"     | lolcat  
                echo -e ""
                echo -e "======================================"                                                                                                                                 
                exit                                                                  
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      AutoKick By JAGOANNEON     " | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : 2" | lolcat
                echo -e "      AutoKick Every     : 15 Minutes" | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                rm -f /etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang" > /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      AutoKick By JAGOANNEON     " | lolcat
                echo -e ""
                echo -e "      Allowed MultiLogin : 2" | lolcat
                echo -e "      AutoKick Every     : 30 Minutes" | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                4)
                clear
                rm -f /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================" | lolcat
                echo -e ""
                echo -e "      AutoKick By JAGOANNEON     " | lolcat
                echo -e ""
                echo -e "      AutoKick MultiLogin Turned Off  " | lolcat
                echo -e ""
                echo -e "======================================" | lolcat
                exit
                ;;
                x)
                clear
                exit
                ;;
        esac
