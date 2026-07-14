#!/bin/bash

echo "========================================="
echo "           DIRECTORY BACKUP TOOL"
echo "========================================="

echo ""
echo "Enter the full directory path to backup:"
read directory_path


# Check whether the directory exists
if [ ! -d "$directory_path" ]; then
    echo ""
    echo "Error: Directory does not exist."
    exit 1
fi


# Create backups directory if it doesn't exist
mkdir -p ../backups


# Get directory name
directory_name=$(basename "$directory_path")


# Generate timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")


# Create backup file name
backup_file="../backups/${directory_name}_${timestamp}.tar.gz"


echo ""
echo "Creating backup..."


# Compress the directory
tar -czf "$backup_file" "$directory_path"


echo ""
echo "Backup created successfully!"

echo ""
echo "Backup Location:"
echo "$backup_file"

echo ""
echo "========================================="
echo "            BACKUP COMPLETED"
echo "========================================="
