#!/bin/bash

# Install Nethunter
termux-setup-storage
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux

# Run install-nethunter-termux and handle any [?] characters that appear
while true; do
    ./install-nethunter-termux |& tee output.txt
    if grep -q '\[?\]' output.txt; then
        read -p "The script has encountered a [?] character. Please type 'y' and press enter to continue, or press any other key to exit: " choice
        if [ "$choice" == "y" ]; then
            sed -i 's/\[?\]/y/g' install-nethunter-termux
        else
            echo "Installation aborted."
            exit 1
        fi
    else
        break
    fi
done

echo "Installation is finished. Press 'nh' to start Nethunter."
read -n 2 -p "> " start_nethunter
if [ "$start_nethunter" == "nh" ]; then
    # Start Nethunter
    # ...
    echo "Nethunter started."
else
    echo "Nethunter not started."
fi

# Clean up output.txt
rm output.txt
