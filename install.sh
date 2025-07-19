#!/bin/bash
set -e
source "$(dirname "$0")/.env"
apt update -y && apt upgrade -y
wget -O install_aapanel.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh
bash install_aapanel.sh
echo "✅ aaPanel installed. Visit http://$DOMAIN_NAME:8888 to log in and re-run install.sh"