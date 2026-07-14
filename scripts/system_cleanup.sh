#!/bin/bash

while true
do

echo ""
echo "========================================="
echo "          SYSTEM CLEANUP TOOL"
echo "========================================="
echo ""
echo "1. View Cache Directory Size"
echo "2. View Temporary Files Size"
echo "3. Clean Cache Files"
echo "4. Clean Temporary Files"
echo "5. Perform Complete Cleanup"
echo "6. Exit"
echo ""
echo "Enter your choice:"

read choice

case $choice in

1)
    echo ""
    echo "Cache Directory Size:"
    du -sh ~/.cache 2>/dev/null
    ;;

2)
    echo ""
    echo "Temporary Files Size:"
    du -sh /tmp 2>/dev/null
    ;;

3)
    echo ""
    echo "Cleaning Cache Files..."
    rm -rf ~/.cache/*
    echo "Cache files cleaned successfully."
    ;;

4)
    echo ""
    echo "Cleaning Temporary Files..."
    rm -rf /tmp/*
    echo "Temporary files cleaned successfully."
    ;;

5)
    echo ""
    echo "Performing Complete Cleanup..."

    rm -rf ~/.cache/*
    rm -rf /tmp/*

    echo ""
    echo "System cleanup completed successfully."
    ;;

6)
    echo ""
    echo "Exiting System Cleanup Tool..."
    break
    ;;

*)
    echo ""
    echo "Invalid choice. Please try again."
    ;;

esac

done
