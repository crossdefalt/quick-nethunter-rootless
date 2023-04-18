#!/bin/bash

# Define spinner animation frames
spinner=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

# Install Nethunter
termux-setup-storage
apt update -y
apt upgrade -y -o Dpkg::Options::="--force-confold"
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux

# Loop through spinner animation while installation is running
./install-nethunter-termux | {
  while read line; do
    # Check for [?] character and prompt user to continue or abort
    if [[ "$line" == *"[?]"* && "$line" != *"[?][?]"* ]]; then
      read -p "The script has encountered a [?] character. Please type 'y' and press enter to continue, or press any other key to exit: " choice
      if [ "$choice" == "y" ]; then
        echo "y" >> /tmp/install-nethunter-termux-answers.txt
      else
        echo "Installation aborted."
        exit 1
      fi
    else
      # Print current spinner frame and current line of output from installation
      printf "\r${spinner[i++ % ${#spinner[@]}]} $line"
    fi
  done

  # Print final message
  echo ""
  echo "Installation finished. Use 'nh' command to start Nethunter."
}
