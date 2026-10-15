#!/usr/bin/env bash

# Linux Automation Toolkit - interactive launcher
# Runs the existing scripts and provides quick read-only Linux commands.

set -u

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

if [[ ! -d "$SCRIPTS_DIR" ]]; then
    printf 'Error: scripts directory not found: %s\n' "$SCRIPTS_DIR" >&2
    exit 1
fi

pause() {
    printf '\n'
    read -r -p "Press Enter to return to the menu..." _
}

run_script() {
    local script_name="$1"
    local script_path="$SCRIPTS_DIR/$script_name"

    if [[ ! -f "$script_path" ]]; then
        printf '\nError: script not found: %s\n' "$script_path"
        pause
        return
    fi

    printf '\n--- Running: %s ---\n\n' "$script_name"
    bash "$script_path"
    local status=$?

    if (( status != 0 )); then
        printf '\nThe script exited with status %s.\n' "$status"
    fi
    pause
}

run_backup() {
    # The existing backup script stores backups relative to the scripts directory.
    printf '\n--- Running: backup.sh ---\n\n'
    (cd -- "$SCRIPTS_DIR" && bash ./backup.sh)
    local status=$?

    if (( status != 0 )); then
        printf '\nBackup exited with status %s.\n' "$status"
    fi
    pause
}

basic_commands_menu() {
    local choice

    while true; do
        printf '\n'
        printf '%s\n' '========================================='
        printf '%s\n' '          QUICK LINUX COMMANDS'
        printf '%s\n' '========================================='
        printf '%s\n' '1. Show current directory'
        printf '%s\n' '2. List files (including hidden files)'
        printf '%s\n' '3. Show disk space'
        printf '%s\n' '4. Show memory usage'
        printf '%s\n' '5. Show uptime and load'
        printf '%s\n' '6. Show current user and hostname'
        printf '%s\n' '7. Show IP addresses'
        printf '%s\n' '8. Show top CPU-consuming processes'
        printf '%s\n' '9. Return to main menu'
        printf '\n'
        read -r -p "Choose an option [1-9]: " choice

        case "$choice" in
            1) printf '\nCurrent directory:\n'; pwd ;;
            2) printf '\nFiles in current directory:\n'; ls -lah ;;
            3) printf '\nDisk space:\n'; df -h ;;
            4) printf '\nMemory usage:\n'; free -h ;;
            5) printf '\nUptime and load:\n'; uptime ;;
            6)
                printf '\nCurrent user: '; whoami
                printf 'Hostname: '; hostname
                ;;
            7)
                printf '\nIP addresses:\n'
                if command -v ip >/dev/null 2>&1; then
                    ip -brief address
                else
                    hostname -I 2>/dev/null || printf 'Could not determine IP addresses.\n'
                fi
                ;;
            8)
                printf '\nTop CPU-consuming processes:\n'
                ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
                ;;
            9) return ;;
            *) printf '\nInvalid choice. Enter a number from 1 to 9.\n' ;;
        esac

        if [[ "$choice" != "9" ]]; then
            pause
        fi
    done
}

main_menu() {
    local choice

    while true; do
        printf '\n'
        printf '%s\n' '================================================'
        printf '%s\n' '             LINUX AUTOMATION TOOLKIT'
        printf '%s\n' '================================================'
        printf '%s\n' ' 1. System information'
        printf '%s\n' ' 2. Disk usage monitor'
        printf '%s\n' ' 3. Process monitor'
        printf '%s\n' ' 4. Back up a directory'
        printf '%s\n' ' 5. System cleanup'
        printf '%s\n' ' 6. Package update manager (APT)'
        printf '%s\n' ' 7. Project setup'
        printf '%s\n' ' 8. Quick Linux commands'
        printf '%s\n' ' 9. Exit'
        printf '%s\n' '================================================'
        printf '\n'
        read -r -p "What would you like to do? [1-9]: " choice

        case "$choice" in
            1) run_script "system_info.sh" ;;
            2) run_script "disk_usage_monitor.sh" ;;
            3) run_script "process_monitor.sh" ;;
            4) run_backup ;;
            5) run_script "system_cleanup.sh" ;;
            6) run_script "package_update.sh" ;;
            7) run_script "project_setup.sh" ;;
            8) basic_commands_menu ;;
            9)
                printf '\nExiting Linux Automation Toolkit. Goodbye!\n'
                return 0
                ;;
            *)
                printf '\nInvalid choice. Enter a number from 1 to 9.\n'
                pause
                ;;
        esac
    done
}

main_menu
