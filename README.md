# Linux Automation Toolkit

A menu-driven Bash toolkit for common Linux system administration and development tasks. Run one launcher and choose a task instead of remembering each script path.

## Features

- **Interactive main menu** to launch the tools from one place.
- **System information:** hostname, user, OS, kernel, CPU, RAM, IP address, and date/time.
- **Disk usage monitor:** filesystem utilization, usage warning, and largest directories.
- **Process monitor:** CPU/memory-heavy processes, process count, uptime, and load.
- **Directory backup:** create timestamped `.tar.gz` backups.
- **System cleanup:** inspect cache/temp usage and perform confirmed cleanup.
- **APT package manager:** inspect updates, update package lists, upgrade packages, and clean packages.
- **Project setup:** create a starter project structure and optionally initialize Git.
- **Quick Linux commands:** current directory, files, disk, memory, uptime, user/host, IP addresses, and top CPU processes.

## Requirements

- Linux or WSL2 running a Linux distribution such as Ubuntu.
- Bash and standard utilities such as `df`, `free`, `ps`, `tar`, and `find`.
- `sudo` access for APT operations (only on Debian/Ubuntu-based systems).
- Some optional commands, such as `lscpu`, may not exist on every minimal Linux installation.

## Quick start

Clone the repository and run the launcher from its root directory:

```bash
git clone https://github.com/khushalsahu/linux-automation-toolkit.git
cd linux-automation-toolkit
chmod +x toolkit.sh
./toolkit.sh
```

You can also run it without changing file permissions:

```bash
bash toolkit.sh
```

Choose a number from the main menu. The selected utility runs and then returns you to the menu. Choose **Quick Linux commands** for common read-only commands.

## Project structure

```text
linux-automation-toolkit/
├── toolkit.sh
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

## Individual scripts

The scripts in `scripts/` can still be run individually:

- `system_info.sh` — summarize machine details.
- `backup.sh` — prompt for a directory and create a timestamped compressed archive in the repository's `backups/` directory when launched through the main menu.
- `disk_usage_monitor.sh` — inspect root filesystem usage and the largest directories under the current working directory.
- `process_monitor.sh` — display process and load information.
- `system_cleanup.sh` — view cache/temp sizes and optionally clean files.
- `package_update.sh` — interactive APT maintenance menu for Debian/Ubuntu.
- `project_setup.sh` — create a starter project directory.

## Safety notes

- Cleanup operations can delete files. The cleanup menu asks for confirmation before removing cache files; temporary cleanup is limited to items in `/tmp` owned by the current user and older than seven days.
- Package upgrades and removals can change the system. Review each action before choosing it, and only run APT options on a Debian/Ubuntu-based system.
- Backups should be checked before deleting or changing the source directory.
- Review shell scripts before running them on important systems. Test in a disposable VM or WSL environment first.

## Concepts covered

Bash scripting, Linux command-line utilities, file management, package management, monitoring, backups, interactive CLI design, and Git/GitHub workflows.

## Author

Khushal Sahu
