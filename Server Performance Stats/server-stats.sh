#!/bin/bash

# Server Performance Stats Script

# Exit on error
set -e

echo "=============================="
echo "  Server Performance Report"
echo "Generated on: $(date)"
echo "=============================="

# OS and Uptime Info (Stretch Goal)
echo -e "\n OS and Uptime Info"
echo "OS: $(uname -srm)"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average: ' '{ print $2 }')"
echo "Logged in users: $(who | wc -l)"

# CPU Usage
echo -e "\n  CPU Usage"
CPU_IDLE=$(top -bn1 | grep "%Cpu" | awk '{print $8}')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
echo "Total CPU Usage: ${CPU_USAGE}%"

# Memory Usage
echo -e "\n Memory Usage"
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERC=$(echo "scale=2; $MEM_USED/$MEM_TOTAL*100" | bc)
echo "Total: ${MEM_TOTAL}MB | Used: ${MEM_USED}MB | Free: ${MEM_FREE}MB | Usage: ${MEM_PERC}%"

# Disk Usage
echo -e "\n Disk Usage (Root Partition)"
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERC=$(df -h / | awk 'NR==2 {print $5}')
echo "Total: $DISK_TOTAL | Used: $DISK_USED | Free: $DISK_FREE | Usage: $DISK_PERC"

# Top 5 Processes by CPU
echo -e "\n Top 5 Processes by CPU Usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t

# Top 5 Processes by Memory
echo -e "\n Top 5 Processes by Memory Usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | column -t

# Failed Login Attempts (Stretch Goal)
echo -e "\n Failed Login Attempts (last 24h)"
if command -v journalctl &>/dev/null; then
    journalctl -u ssh --since "24 hours ago" | grep "Failed password" | wc -l
else
    grep "Failed password" /var/log/auth.log | wc -l
fi

echo -e "\n Done!"
