#!/bin/bash

while true
do

echo ""
echo "========================================="
echo "         PACKAGE UPDATE MANAGER"
echo "========================================="
echo ""
echo "1. Check Available Updates"
echo "2. Update Package Lists"
echo "3. Upgrade Installed Packages"
echo "4. Remove Unnecessary Packages"
echo "5. Clean Package Cache"
echo "6. Perform Full System Update"
echo "7. Exit"
echo ""
echo "Enter your choice:"

read choice

case $choice in

1)
    echo ""
    echo "Available Package Updates:"
    apt list --upgradable
    ;;

2)
    echo ""
    echo "Updating Package Lists..."
    sudo apt update
    ;;

3)
    echo ""
    echo "Upgrading Installed Packages..."
    sudo apt upgrade -y
    ;;

4)
    echo ""
    echo "Removing Unnecessary Packages..."
    sudo apt autoremove -y
    ;;

5)
    echo ""
    echo "Cleaning Package Cache..."
    sudo apt autoclean
    ;;

6)
    echo ""
    echo "Performing Full System Update..."

    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean

    echo ""
    echo "System updated successfully."
    ;;

7)
    echo ""
    echo "Exiting Package Update Manager..."
    break
    ;;

*)
    echo ""
    echo "Invalid choice. Please try again."
    ;;

esac

done
