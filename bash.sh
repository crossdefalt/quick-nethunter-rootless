#!/bin/bash

# Install Nethunter
termux-setup-storage
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux

# Create answers file for prompts
touch /tmp/install-nethunter-termux-answers.txt
echo "1" >> /tmp/install-nethunter-termux-answers.txt
echo "y" >> /tmp/install-nethunter-termux-answers.txt
echo "y" >> /tmp/install-nethunter-termux-answers.txt

./install-nethunter-termux | while read line; do
  if [[ "$line" == *"[?]"* && "$line" != *"[?][?]"* ]]; then
    read -p "The script has encountered a [?] character. Please type 'y' and press enter to continue, or press any other key to exit: " choice
    if [ "$choice" == "y" ]; then
      echo "y" >> /tmp/install-nethunter-termux-answers.txt
    else
      echo "Installation Finished."
      exit 1
    fi
  else
    echo "$line"
  fi
done

if [ $? -eq 0 ]; then
  echo "crossdefalt"
else
  echo "crossdefalt"
fi
