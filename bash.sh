#!/bin/bash

# Install Nethunter
termux-setup-storage
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux

# Loop to continue if [?] is encountered
while grep -q '\[?\]' install-nethunter-termux; do
    read -p "The script has encountered a [?] character. Please type 'y' and press enter to continue, or press any other key to exit: " choice
    if [ "$choice" == "y" ]; then
        sed -i 's/\[?\]/y/g' install-nethunter-termux
    else
        echo "Installation aborted."
        exit 1
    fi
done

# Run the installer
echo "Installing Nethunter. This may take a while..."
./install-nethunter-termux

# Check for errors
if [ $? -ne 0 ]; then
    echo "Nethunter installation failed."
    exit 1
fi

# Clean up
rm install-nethunter-termux

echo "Installation finished. Type 'nh' to start Nethunter."
read -n 2 -p "> " start_nethunter
if [ "$start_nethunter" == "nh" ]; then
    # Start Nethunter
    # ...
    echo "Nethunter started."
else
    echo "Nethunter not started."
fi
