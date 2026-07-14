#!/bin/bash

echo "========================================="
echo "          PROCESS MONITOR"
echo "========================================="


echo ""
echo "Top 10 CPU Consuming Processes:"
echo "------------------------------------------"

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 11


echo ""
echo "Top 10 Memory Consuming Processes:"
echo "------------------------------------------"

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 11


echo ""
echo "Total Running Processes:"
echo "------------------------------------------"

ps -e | wc -l


echo ""
echo "System Uptime:"
echo "------------------------------------------"

uptime -p


echo ""
echo "Load Average:"
echo "------------------------------------------"

uptime


echo ""
echo "========================================="
echo "      PROCESS MONITOR COMPLETED"
echo "========================================="
