#!/bin/bash

# Install Nethunter
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux

# Delete files
rm -f install-nethunter-termux
rm -f kalifs-arm64-full.sha512sum
rm -f kalifs-arm64-full.tar.xz
