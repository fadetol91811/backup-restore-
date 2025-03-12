#!/bin/bash

# Automated Backup & Restore System (Local Version)
# Author: Folasanmi Adetola 
# Description: Creates compressed backups of important directories and restores them when needed.

BACKUP_DIR="/backup"
LOG_FILE="/var/log/backup_restore.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/system_backup_$TIMESTAMP.tar.gz"

# Directories to back up
DIRS_TO_BACKUP=("/etc" "/home" "/var/log")

# Function to log actions
log_action() {
    echo "$(date) - $1" | tee -a "$LOG_FILE"
}

# Function to create a backup
create_backup() {
    mkdir -p "$BACKUP_DIR"
    tar -czf "$BACKUP_FILE" "${DIRS_TO_BACKUP[@]}" 2>/dev/null

    if [ $? -eq 0 ]; then
        log_action "Backup created: $BACKUP_FILE"
        echo "Backup successful! Stored at: $BACKUP_FILE"
    else
        log_action "Backup failed."
        echo "Error: Backup failed!"
    fi
}

# Function to restore a backup
restore_backup() {
    echo "Available backups:"
    ls -lh $BACKUP_DIR/system_backup_*.tar.gz
    read -p "Enter the full path of the backup file to restore: " BACKUP_TO_RESTORE

    if [ -f "$BACKUP_TO_RESTORE" ]; then
        tar -xzf "$BACKUP_TO_RESTORE" -C / 2>/dev/null
        log_action "Backup restored: $BACKUP_TO_RESTORE"
        echo "Restore successful from: $BACKUP_TO_RESTORE"
    else
        log_action "Restore failed. Backup file not found: $BACKUP_TO_RESTORE"
        echo "Error: Backup file not found!"
    fi
}

# Main Menu
while true; do
    echo -e "\n=== Automated Backup & Restore System ==="
    echo "1) Create Backup"
    echo "2) Restore Backup"
    echo "3) Exit"
    read -p "Choose an option: " OPTION

    case $OPTION in
        1) create_backup ;;
        2) restore_backup ;;
        3) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done

