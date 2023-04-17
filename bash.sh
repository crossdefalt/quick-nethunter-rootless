#!/bin/bash

# Install Nethunter
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux

# Delete files
rm -f install-nethunter-termux
rm -f kalifs-arm64-full.sha512sum
rm -f kalifs-arm64-full.tar.xz
