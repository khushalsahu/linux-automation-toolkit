#!/bin/bash

echo "========================================="
echo "         DISK USAGE MONITOR"
echo "========================================="


echo ""
echo "Disk Usage Summary:"
df -h /

echo ""


# Extract disk usage percentage
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')


echo "Current Disk Usage: ${usage}%"


# Check if usage exceeds 80%
if [ "$usage" -ge 80 ]
then
    echo ""
    echo "WARNING: Disk usage is above 80%!"
else
    echo ""
    echo "Disk usage is within normal limits."
fi


echo ""
echo "Top 5 Largest Directories (Current Location):"

du -h --max-depth=1 . 2>/dev/null | sort -hr | head -n 5


echo ""
echo "========================================="
echo "       DISK USAGE CHECK COMPLETED"
echo "========================================="
