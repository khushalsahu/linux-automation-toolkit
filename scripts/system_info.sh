#!/bin/bash

echo "========================================="
echo "         SYSTEM INFORMATION"
echo "========================================="

echo ""
echo "Hostname:"
hostname

echo ""
echo "Username:"
whoami

echo ""
echo "Operating System:"
uname -o

echo ""
echo "Kernel Version:"
uname -r

echo ""
echo "CPU Information:"
lscpu | grep "Model name"

echo ""
echo "RAM Information:"
free -h

echo ""
echo "IP Address:"
hostname -I

echo ""
echo "Current Date & Time:"
date

echo ""
echo "========================================="
echo "      END OF SYSTEM INFORMATION"
echo "========================================="
