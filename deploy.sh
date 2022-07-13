#!/bin/bash
RWD=$(pwd)
echo "[gta-resources] Zipping files..."
cd ~/Git/gta-resources/pack
zip -r ../gta-resources.zip assets pack.mcmeta
cd ../
cp gta-resources.zip ~/.minecraft/resourcepacks/
echo "[gta-resources] Uploading to server"
echo -n -e "Please enter password for root@tallie.dev:4195 >> "
read -s PASSWD
export LFTP_PASSWORD=${PASSWD}
lftp --env-password sftp://root@tallie.dev:4195 -e "cd /srv/http/modtool/packs/; put gta-resources.zip; bye"
export LFTP_PASSWORD=""
cd $RWD
