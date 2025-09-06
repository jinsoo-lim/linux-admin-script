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
mem_usage=$(free | awk '/Mem/ {printf("%.0f%%", $3/$2 * 100)}')

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
