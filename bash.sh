#!/bin/bash

# Install Nethunter
termux-setup-storage
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
echo "1" > /tmp/install-nethunter-termux-answers.txt
echo "y" >> /tmp/install-nethunter-termux-answers.txt
echo "y" >> /tmp/install-nethunter-termux-answers.txt
./install-nethunter-termux < /tmp/install-nethunter-termux-answers.txt

if [ "$?" -eq 0 ]; then
  echo "Nethunter installation completed successfully!"
else
  echo "Nethunter installation failed."
fi
