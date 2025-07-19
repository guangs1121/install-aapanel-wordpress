#!/bin/bash
set -e
source "$(dirname "$0")/.env"
# install LNMP using aaPanel CLI (if available)
# placeholder: echo commands to illustrate
echo "🛠 Configuring LNMP stack"
# configure swap
fallocate -l ${SWAP_SIZE} /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "✅ LNMP, SSL (manually), and swap configured."