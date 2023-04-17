#!/bin/bash
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
echo "1" | ./install-nethunter-termux
