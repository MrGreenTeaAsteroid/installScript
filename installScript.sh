#!/bin/bash

# Check if system uses yum or apt-get
if command -v yum &> /dev/null; then
    installer="yum"
    echo "Using yum package manager."
elif command -v apt-get &> /dev/null; then
    installer="apt-get"
    echo "Using apt-get package manager."
else
    echo "Could not detect package manager. Exiting."
    exit 1
fi

# Ask user what they want to do
while true; do
    echo "Please choose an option:"
    echo "1. Update system and install common tools"
    echo "2. Install a wide range of applications for DevOps"
    echo "3. Install a wide range of applications for SysAdmin work"
    echo "4. Install a wide range of applications for Network engineering"
    echo "5. Install a wide range of applications for Network Security and pentesting"
    echo "6. Exit"
    echo "7. Reboot"
    echo "8. Shutdown"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Updating system and installing common tools..."
            sudo $installer update -y
            sudo $installer install -y wget vim nano snapd synaptic firefox thunderbird ruby python3 python3-pip ssh notepad-plus-plus telegram-desktop signal-desktop skypeforlinux git wmctrl
            echo "Done."
            ;;
        2)
            echo "Installing a wide range of applications for DevOps..."
            sudo $installer update -y
            sudo $installer install -y docker.io docker-compose kubectl helm minikube jenkins gitlab-runner ansible puppet saltstack terraform packer vault
            echo "Done."
            ;;
        3)
            echo "Installing a wide range of applications for SysAdmin work..."
            sudo $installer update -y
            sudo $installer install -y htop iftop nmon sysstat tcpdump traceroute lsof ncdu lnav
            echo "Done."
            ;;
        4)
            echo "Installing a wide range of applications for Network engineering..."
            sudo $installer update -y
            sudo $installer install -y wireshark nmap tcpdump traceroute mtr net-tools
            echo "Done."
            ;;
        5)
            echo "Installing a wide range of applications for Network Security and pentesting..."
            sudo $installer update -y
            sudo $installer install -y nmap tcpdump wireshark hydra john nikto metasploit-framework aircrack-ng hashcat ettercap-graphical
            echo "Done."
            ;;
        6)
            echo "Exiting."
            exit 0
            ;;
        7)
            echo "Rebooting..."
            sudo reboot
            ;;
        8)
            echo "Shutting down..."
            sudo poweroff
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
