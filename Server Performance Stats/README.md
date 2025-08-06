# Server Performance Stats (Bash Script)

A simple Bash script to analyze basic server performance statistics on any Linux server.  
Useful for quickly assessing the health and load of a system without installing additional tools.

---

## 🚀 Features

- ✅ 100% Bash — no dependencies or Python required
- 🧠 Displays memory usage
- ⚙️ Shows total CPU usage
- 💽 Reports disk usage of the root partition
- 🔍 Lists top 5 processes by:
  - CPU usage
  - Memory usage
- 🛡️ (Optional) Includes additional stats:
  - OS version
  - Uptime
  - Load average
  - Number of logged-in users
  - Failed login attempts in the last 24 hours

---

## 🧰 Requirements

- Linux or Unix-based system
- Bash shell (`bash`)
- Standard system utilities: `top`, `ps`, `df`, `free`, `uptime`, `who`, `journalctl` or `auth.log`

---

## 📦 Installation

1. Download the script:

```bash
curl -O https://your-repo-url/server-stats.sh
```
Make it executable:

```bash
chmod +x server-stats.sh
```
Run it:

```bash
./server-stats.sh
```
