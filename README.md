# Linux Automation Toolkit

## Description

Linux Automation Toolkit is a collection of shell scripts designed to automate common Linux system administration and development tasks. The project focuses on Linux automation, package management, system monitoring, backup utilities, and project scaffolding.

---

## Features

- System Information Utility
- Directory Backup Automation
- Disk Usage Monitoring
- Interactive System Cleanup Tool
- Process Monitoring Utility
- Interactive Package Update Manager
- Project Setup Automation Tool

---

## Technologies Used

- Linux
- Bash (Shell Scripting)
- Git & GitHub
- Linux System Administration Commands

---

## Project Structure

```
linux-automation-toolkit/

├── README.md
├── .gitignore

├── docs/
├── logs/

└── scripts/

    ├── backup.sh
    ├── disk_usage_monitor.sh
    ├── package_update.sh
    ├── process_monitor.sh
    ├── project_setup.sh
    ├── system_cleanup.sh
    └── system_info.sh
```

---

## Script Descriptions

### system_info.sh

Displays:

- Hostname
- Username
- Operating System
- Kernel Version
- CPU Information
- RAM Information
- IP Address
- Current Date and Time

---

### backup.sh

Features:

- Takes backup of any directory.
- Compresses the directory into a .tar.gz file.
- Adds timestamp to backup files.
- Automatically creates backup directories.

---

### disk_usage_monitor.sh

Features:

- Displays disk usage statistics.
- Shows current storage utilization.
- Displays the largest directories.
- Provides disk usage monitoring utilities.

---

### system_cleanup.sh

Interactive menu-driven utility.

Features:

- View cache directory size.
- View temporary files size.
- Clean cache files.
- Clean temporary files.
- Perform complete cleanup.
- Exit utility.

---

### process_monitor.sh

Displays:

- Top CPU consuming processes.
- Top memory consuming processes.
- Total running processes.
- System uptime.
- Load average.

---

### package_update.sh

Interactive menu-driven utility.

Features:

- Check available package updates.
- Update package lists.
- Upgrade installed packages.
- Remove unnecessary packages.
- Clean package cache.
- Perform full system update.
- Exit utility.

---

### project_setup.sh

Automates project creation.

Features:

- Creates project directory.
- Creates README.md.
- Creates .gitignore.
- Creates src folder.
- Creates docs folder.
- Initializes Git repository (optional).

---

## Concepts Covered

- Shell Scripting
- Linux Commands
- File Management
- Package Management
- System Monitoring
- Automation
- Interactive CLI Tools
- Git & GitHub Workflow

---

## How to Run

Move into the scripts directory:

```bash
cd scripts
```

Give executable permissions if required:

```bash
chmod +x filename.sh
```

Run the script:

```bash
./filename.sh
```

---

## Future Improvements

- Logging support.
- Command line argument support.
- Colored terminal output.
- Installation script.

---

## Author

Khushal Sahu
