# Log Archive Tool (Bash)

A lightweight command-line utility for archiving log files into compressed tar.gz archives with timestamp tracking.

Project from: [https://roadmap.sh/projects/log-archive-tool](https://roadmap.sh/projects/log-archive-tool)

---
## Features

- Creates timestamped `.tar.gz` archives of log directories
- Automatically excludes previous archives from new archives
- Maintains an audit log of all archiving operations
- Simple single-file implementation with no dependencies
- Safe directory handling and error checking

---
## Requirements

- Bash (v4.0 or newer)
- Standard GNU tar utility
- Common Unix tools (date, mkdir, etc.)

---
## Installation

No installation required - just make the script executable:

```bash
chmod +x log_archive.sh
```

---
## Usage

```bash
./log_archive.sh <log-directory>
```

Example:
```bash
./log_archive.sh /var/log
```

---
## Output Structure

The tool creates:
- Compressed archives in: `<log-directory>/archives/`
- Operation log at: `<log-directory>/archives/archive_log.txt`

Archive naming format:
```
logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

---
## Cron Automation

To run daily at midnight, add to crontab:
```bash
0 0 * * * /path/to/log_archive.sh /var/log
```

---
## Safety Features

- Fails immediately if any command fails (`set -e`)
- Validates input directory exists
- Prevents archiving of previous archives
- Creates necessary directory structure automatically

---
## Limitations

- Currently archives all files in the directory
- No file age filtering (archives everything)
- No automatic cleanup of old archives

