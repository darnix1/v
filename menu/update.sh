#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading File"
sleep 2
wget -q -O /usr/bin/menu "https://mulyono.serv00.net/Repository/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/restore "https://mulyono.serv00.net/Repository/menu/restore.sh" && chmod +x /usr/bin/restore
wget -q -O /usr/bin/backup "https://mulyono.serv00.net/Repository/menu/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/m-noobz "https://mulyono.serv00.net/Repository/menu/m-noobz.sh" && chmod +x /usr/bin/m-noobz
wget -q -O /usr/bin/m-ip "https://mulyono.serv00.net/Repository/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-bot "https://mulyono.serv00.net/Repository/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/update "https://mulyono.serv00.net/Repository/menu/update.sh" && chmod +x /usr/bin/update
wget -q -O /usr/bin/m-theme "https://mulyono.serv00.net/Repository/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-vmess "https://mulyono.serv00.net/Repository/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://mulyono.serv00.net/Repository/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://mulyono.serv00.net/Repository/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-system "https://mulyono.serv00.net/Repository/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/m-sshovpn "https://mulyono.serv00.net/Repository/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -q -O /usr/bin/m-ssws "https://mulyono.serv00.net/Repository/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -q -O /usr/bin/running "https://mulyono.serv00.net/Repository/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/m-backup "https://mulyono.serv00.net/Repository/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/m-update "https://mulyono.serv00.net/Repository/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -q -O /usr/bin/speedtest "https://mulyono.serv00.net/Repository/speedtest_cli.py" && chmod +x /usr/bin/speedtest
wget -q -O /usr/bin/bckpbot "https://mulyono.serv00.net/Repository/menu/bckpbot.sh" && chmod +x /usr/bin/bckpbot
wget -q -O /usr/bin/tendang "https://mulyono.serv00.net/Repository/menu/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/bottelegram "https://mulyono.serv00.net/Repository/menu/bottelegram.sh" && chmod +x /usr/bin/bottelegram
wget -q -O /usr/bin/m-allxray "https://mulyono.serv00.net/Repository/menu/m-allxray.sh" && chmod +x /usr/bin/m-allxray
wget -q -O /usr/bin/xraylimit "https://mulyono.serv00.net/Repository/menu/xraylimit.sh" && chmod +x /usr/bin/xraylimit
wget -q -O /usr/bin/trialvmess "https://mulyono.serv00.net/Repository/menu/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -q -O /usr/bin/trialvless "https://mulyono.serv00.net/Repository/menu/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -q -O /usr/bin/trialtrojan "https://mulyono.serv00.net/Repository/menu/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -q -O /usr/bin/trialssh "https://mulyono.serv00.net/Repository/menu/trialssh.sh" && chmod +x /usr/bin/trialssh
wget -q -O /usr/bin/autocpu "https://mulyono.serv00.net/Repository/install/autocpu.sh" && chmod +x /usr/bin/autocpu
wget -q -O /usr/bin/bantwidth "https://mulyono.serv00.net/Repository/install/bantwidth" && chmod +x /usr/bin/bantwidth
echo -e " [INFO] Download File Successfully"
sleep 2
exit