#!/bin/bash
[[ -e /bin/xdarnix/msg ]] && source /bin/xdarnix/msg || source <(curl -sSL https://gitea.com/xdarnix/msg/raw/branch/main/msg)
ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/darnix1/permission/main/ipmini"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
        echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
        echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
        echo -e "            ${RED}PERMISSION DENIED !${NC}"
        echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
        echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
        echo -e "             \033[0;33mContact Your Admin ${NC}"
        echo -e "     \033[0;36mTelegram${NC}: https://t.me/Rmblvpn1"
        echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
        exit
    fi
}
checking_sc




domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
WH='\033[1;37m'
#install
restart-bot(){
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mEspere... \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mEspere... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    systemctl restart kyt
}
netfilter-persistent
clear
msg -bar
echo -e " \e[1;97;101m        REINICIANDO BOT MANGER          \e[0m"
msg -bar
echo -e ""
echo -e "  \033[1;91m Bot Reiniciado\033[1;37m"
fun_bar 'res1'
msg -bar
echo -e ""
read -n 1 -s -r -p "Presiona [ Enter ] para ir al menu"
m-bot.sh
}

function install-bot(){
apt update -y && apt upgrade -y
apt install python3 python3-pip git speedtest-cli -y
sudo apt-get install -y p7zip-full
cd /usr/bin
clear
wget https://raw.githubusercontent.com/darnix1/vip/main/menu/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/darnix1/vip/main/menu/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
clear
cd /usr/bin/kyt/bot
chmod +x *
mv -f * /usr/bin
rm -rf /usr/bin/kyt/bot
rm -rf /usr/bin/*.zip
cd
rm -rf /etc/tele

clear
msg -bar
msg -tit
msg -bar
print_center " PANEL DE CONTROL BOT TELEGRAM"
msg -bar
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "${grenbo}Tutorial Crear Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Crear Bot y Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , dominio /info${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/var.txt
rm -rf /usr/bin/kyt/database.db
echo -e ""
read -e -p "[*] Ingrese su token de bot : " bottoken
read -e -p "[*] Ingrese su ID Telegram :" admin

cat >/usr/bin/kyt/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$admin"
DOMAIN="$domain"
EOF

echo 'TEXT=$'"(cat /etc/notiftele)"'' > /etc/tele
echo "TIMES=10" >> /etc/tele
echo 'KEY=$'"(cat /etc/per/token)"'' >> /etc/tele

echo "$bottoken" > /etc/per/token
echo "$admin" > /etc/per/id
echo "$bottoken" > /usr/bin/token
echo "$admin" > /usr/bin/idchat
echo "$bottoken" > /etc/perlogin/token
echo "$admin" > /etc/perlogin/id
clear

echo "SHELL=/bin/sh" >/etc/cron.d/cekbot
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >>/etc/cron.d/cekbot
echo "*/1 * * * * root /usr/bin/cekbot" >>/etc/cron.d/cekbot

cat > /usr/bin/cekbot << END
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    echo -ne
else
    systemctl restart kyt
    systemctl start kyt
fi

kyt=$( systemctl status kyt | grep "TERM" | wc -l )
if [[ $kyt == "0" ]]; then
echo -ne
else
    systemctl restart kyt
    systemctl start kyt
fi
END

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=syslog.target network-online.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null

echo "Done"
echo " Instalaciones completas, escribe /start en tu bot"
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
}
cd
if [ -e /usr/bin/kyt ]; then
echo -ne
else
install-bot
fi

#isi data
clear
msg -bar
msg -tit
msg -bar
print_center " PANEL DE CONTROL BOT TELEGRAM"
msg -bar
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  \033[1;37mCAMBIAR LA BOT       ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 2 ]  \033[1;37mACTUALIZAR BOT     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 3 ]  \033[1;37mELIMINAR BOT     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 4 ]  \033[1;37mCAMBIAR NOMBRE DE LLAMADA DEL BOT (SERVIDOR MÚLTIPLE)     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1│  [ 5 ]  \033[1;37mAÑADIR ADMINISTRADOR     ${NC}"
echo -e "$COLOR1│  "                                        
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $domain2 =~ ^[1-5]+$ ]]; do 
read -p "   Por favor seleccione los números 1 al 5 : " domain2
done

if [[ $domain2 == "1" ]]; then
clear
msg -bar
msg -tit
msg -bar
print_center " PANEL DE CONTROL BOT TELEGRAM"
msg -bar
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Crear Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/var.txt
rm -rf /usr/bin/kyt/database.db
echo -e ""
read -e -p "[*] Ingrese su token de bot : " bottoken
read -e -p "[*] Ingrese su Id Telegram :" admin

cat >/usr/bin/kyt/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$admin"
DOMAIN="$domain"
EOF

echo "$bottoken" > /etc/per/token
echo "$admin" > /etc/per/id
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=syslog.target network-online.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload &> /dev/null
systemctl stop kyt &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null

echo "Done"
echo " Instalaciones completas, escribe /menu en tu bot"
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
fi
if [[ $domain2 == "2" ]]; then
clear
cp -r /usr/bin/kyt/var.txt /usr/bin &> /dev/null
rm -rf /usr/bin/kyt.zip
rm -rf /usr/bin/kyt
sleep 2
cd /usr/bin
wget https://raw.githubusercontent.com/darnix1/vip/main/menu/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/darnix1/vip/main/menu/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
clear
cd /usr/bin/kyt/bot
chmod +x *
mv -f * /usr/bin
rm -rf /usr/bin/kyt/bot
rm -rf /usr/bin/*.zip
mv /usr/bin/var.txt /usr/bin/kyt
cd
clear

systemctl daemon-reload &> /dev/null
systemctl stop kyt &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null
clear
echo -e "Actualización exitosa de BOT Telegram"
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
fi

if [[ $domain2 == "3" ]]; then
clear
rm -rf /usr/bin/kyt
echo -e "Eliminación exitosa de BOT Telegram"
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
fi

if [[ $domain2 == "4" ]]; then
clear
msg -bar
msg -tit
msg -bar
print_center " PANEL DE CONTROL BOT TELEGRAM"
msg -bar
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "${grenbo}Esto se usa si quieres usar solo 1 bot sin necesitarlo. ${NC}"
echo -e "${grenbo}Muchos de estos bots de creación se utilizan para crear cuentas. ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -e -p "[*] Ingrese el apodo del bot : " namabot

sed -i "s/77/${namabot}/g" /usr/bin/kyt/modules/menu.py
sed -i "s/77/${namabot}/g" /usr/bin/kyt/modules/start.py
sed -i "s/"sshovpn"/"sshovpn${namabot}"/g" /usr/bin/kyt/modules/menu.py
sed -i "s/"vmess"/"vmess${namabot}"/g" /usr/bin/kyt/modules/menu.py
sed -i "s/"vless"/"vless${namabot}"/g" /usr/bin/kyt/modules/menu.py
sed -i "s/"trojan"/"trojan${namabot}"/g" /usr/bin/kyt/modules/menu.py
sed -i "s&.menu|/menu&.${namabot}|/${namabot}&g" /usr/bin/kyt/modules/menu.py
sed -i "s&.start|/start&.start${namabot}|/start${namabot}&g" /usr/bin/kyt/modules/start.py
sed -i "s&.admin|/admin&.admin${namabot}|/admin${namabot}&g" /usr/bin/kyt/modules/admin.py
sed -i "s/b'start'/b'start${namabot}'/g" /usr/bin/kyt/modules/start.py
sed -i "s/b'admin'/b'admin${namabot}'/g" /usr/bin/kyt/modules/admin.py
sed -i "s/b'menu'/b'${namabot}'/g" /usr/bin/kyt/modules/menu.py
sed -i "s/b'menu'/b'${namabot}'/g" /usr/bin/kyt/modules/start.py
sed -i "s/add-ip/add-ip${namabot}/g" /usr/bin/kyt/modules/admin.py
sed -i "s/change-ip/change-ip${namabot}/g" /usr/bin/kyt/modules/admin.py
sed -i "s/add-key/add-key${namabot}/g" /usr/bin/kyt/modules/admin.py
sed -i "s/7-/${namabot}-/g" /usr/bin/kyt/modules/vmess.py
sed -i "s/b'vmess'/b'vmess${namabot}'/g" /usr/bin/kyt/modules/vmess.py
sed -i "s/7-/${namabot}-/g" /usr/bin/kyt/modules/vless.py
sed -i "s/b'vless'/b'vless${namabot}'/g" /usr/bin/kyt/modules/vless.py
sed -i "s/7-/${namabot}-/g" /usr/bin/kyt/modules/trojan.py
sed -i "s/b'trojan'/b'trojan${namabot}'/g" /usr/bin/kyt/modules/trojan.py
sed -i "s/7-/${namabot}-/g" /usr/bin/kyt/modules/ssh.py
sed -i "s/b'sshovpn'/b'sshovpn${namabot}'/g" /usr/bin/kyt/modules/ssh.py
sed -i "s/"menu"/"${namabot}"/g" /usr/bin/kyt/modules/vmess.py
sed -i "s/"menu"/"${namabot}"/g" /usr/bin/kyt/modules/vless.py
sed -i "s/"menu"/"${namabot}"/g" /usr/bin/kyt/modules/trojan.py
sed -i "s/"menu"/"${namabot}"/g" /usr/bin/kyt/modules/ssh.py
sed -i "s/"menu"/"${namabot}"/g" /usr/bin/kyt/modules/menu.py

clear
echo -e "Éxito al cambiar el apodo del BOT de Telegram"
echo -e "Si desea llamar al menú del bot, toque .${namabot} atau /${namabot}"
echo -e "Si desea llamar al bot de inicio, escriba .start${namabot} atau /start${namabot}"
systemctl restart kyt
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
fi


if [[ $domain2 == "5" ]]; then
clear
msg -bar
msg -tit
msg -bar
print_center " PANEL DE CONTROL BOT TELEGRAM"
msg -bar
echo -e ""
read -e -p "[*] Ingrese el usuario ejemplo @darnix0 : " user
userke=$(cat /usr/bin/kyt/var.txt | wc -l)
sed -i '/(ADMIN,))/a hello	c.execute("INSERT INTO admin (user_id) VALUES (?)",(USER'""$userke""',))' /usr/bin/kyt/__init__.py
cat >>/usr/bin/kyt/var.txt <<EOF
USER${userke}="$user"
EOF
sed -i "s/hello//g" /usr/bin/kyt/__init__.py

echo 'curl -s --max-time $TIMES -d "chat_id='""$user""'&disable_web_page_preview=1&text=$TEXT&parse_mode=html" https://api.telegram.org/bot$KEY/sendMessage >/dev/null' >> /etc/tele
clear
echo -e "Succes TAMBAH Admin BOT Telegram"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/database.db
systemctl restart kyt 
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
menu
fi
