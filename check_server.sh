#! /bin/bash

# Simple script to print current data and a message.
# =============================================
# Linux System Info Script
# Author : jinsoo
# Day 2 - Add Disk/Memory/Uptime
# =============================================

# Now time
current_time=$(date)

# usage disk(root partition)
disk_usage=$(df / | tail -1 | awk '{pring $5}')

# usage memory(All of usage %)
mem_usage=$(free | awk '/Mem/ {printf "%.0f%%", $3/$2 * 100}')

# System uptime
uptime_info=$(uptime -p)

#Print
echo "========================================="
echo "Helo world! Starting server check..."
echo "Current time is: $current_time"
echo
echo "Disk Usage: $disk_usage"
echo "Memory Usage: $mem_usage"
echo "uptime:       $uptime_info"
echo "========================================="

# =============================================
# week 3 : automatic backup, delete old file.
# =============================================

# backup diretory
backup_dir="/var/log"
backup_dest="/tmp/log_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# if exsist dir, compression
if [ -d "$backup_dir" ]; then
	echo "Backing up $backup_dir to $backup_dest..."
	tar -czf "$backup_dest" "$backup_dir"
	echo "Backup complete!"
else
	echo "Diretory $backup_dir does not exist."
fi

# process delete old file (over 7day)
echo
echo "Checking for files older than 7 days in $backup_dir ..."
for file in $(find "$backup_dir" -type f -mtime 7); do
	# print safety instead of real delete
	echo "Would delete : $file"
done

echo "Script finished!"
