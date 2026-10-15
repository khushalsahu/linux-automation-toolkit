#!/usr/bin/env bash

# Interactive cleanup utility.
# Destructive operations require confirmation. Temporary cleanup is limited
# to items owned by the current user that are older than 7 days.

set -u

CACHE_DIR="${HOME}/.cache"
TEMP_DIR="/tmp"

pause() {
    printf '\n'
    read -r -p "Press Enter to return to the cleanup menu..." _
}

confirm() {
    local answer
    read -r -p "$1 [y/N]: " answer
    [[ "$answer" == "y" || "$answer" == "Y" ]]
}

show_cache_size() {
    printf '\nCache directory size:\n'
    if [[ -d "$CACHE_DIR" ]]; then
        du -sh -- "$CACHE_DIR" 2>/dev/null || true
    else
        printf 'No cache directory found at %s\n' "$CACHE_DIR"
    fi
}

show_temp_size() {
    printf '\nTemporary directory size:\n'
    du -sh -- "$TEMP_DIR" 2>/dev/null || true
    printf '\nNote: cleanup only targets items owned by your user and older than 7 days.\n'
}

clean_cache() {
    if [[ ! -d "$CACHE_DIR" ]]; then
        printf '\nNo cache directory found. Nothing to clean.\n'
        return
    fi

    printf '\nThis will remove the contents of: %s\n' "$CACHE_DIR"
    printf 'Applications may need to recreate cached data.\n'
    if confirm "Continue with cache cleanup?"; then
        find "$CACHE_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +
        printf 'Cache cleanup completed.\n'
    else
        printf 'Cache cleanup cancelled.\n'
    fi
}

clean_old_temp_files() {
    printf '\nThis will remove items in %s that are owned by your user and older than 7 days.\n' "$TEMP_DIR"
    if confirm "Continue with temporary-file cleanup?"; then
        find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -user "$(id -un)" -mtime +7 -exec rm -rf -- {} +
        printf 'Old temporary-file cleanup completed.\n'
    else
        printf 'Temporary-file cleanup cancelled.\n'
    fi
}

while true; do
    printf '\n'
    printf '%s\n' '========================================='
    printf '%s\n' '          SYSTEM CLEANUP TOOL'
    printf '%s\n' '========================================='
    printf '%s\n' '1. View cache directory size'
    printf '%s\n' '2. View temporary directory size'
    printf '%s\n' '3. Clean cache files (confirmation required)'
    printf '%s\n' '4. Clean old temporary files owned by you (7+ days)'
    printf '%s\n' '5. Perform complete cleanup (confirmation for each step)'
    printf '%s\n' '6. Exit'
    printf '\n'
    read -r -p "Enter your choice [1-6]: " choice

    case "$choice" in
        1) show_cache_size; pause ;;
        2) show_temp_size; pause ;;
        3) clean_cache; pause ;;
        4) clean_old_temp_files; pause ;;
        5)
            clean_cache
            clean_old_temp_files
            pause
            ;;
        6)
            printf '\nExiting System Cleanup Tool.\n'
            break
            ;;
        *)
            printf '\nInvalid choice. Please enter a number from 1 to 6.\n'
            pause
            ;;
    esac
done
