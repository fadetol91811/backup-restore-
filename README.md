# 🔄 Automated Backup & Restore System

## 📌 Overview
The **Automated Backup & Restore System** is a Bash script designed to **create, compress, and restore system backups**. It ensures critical directories are backed up and can be restored when needed.

## 🚀 Features
✔️ **Backs up important directories** (`/etc/`, `/home/`, `/var/log/`)  
✔️ **Compresses backups using `tar`** (to save space)  
✔️ **Stores backups in `/backup/` with timestamps**  
✔️ **Provides a restore function** (to recover lost files)  
✔️ **Logs backup & restore actions** in `/var/log/backup_restore.log`  
✔️ **Can be scheduled via `cron` for automation**  

---

## 🛠 Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/fadetol91811/backup-restore.git
   cd backup-restore

