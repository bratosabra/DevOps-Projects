#!/bin/bash

# Log Archive Tool (Bash-only version)

# Exit on any error
set -e

# Check input
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR="$1"

# Check if log directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory $LOG_DIR does not exist."
  exit 1
fi

# Create archive directory inside the log directory
ARCHIVE_DIR="$LOG_DIR/archives"
mkdir -p "$ARCHIVE_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# Create tar.gz archive excluding the archive folder itself
tar --exclude="$ARCHIVE_DIR" -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# Log the archive creation
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "[$TIMESTAMP] Archived $LOG_DIR to $ARCHIVE_PATH" >> "$LOG_FILE"

echo "✅ Logs archived successfully to: $ARCHIVE_PATH"
