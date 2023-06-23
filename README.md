# cPanel Uninstallation Script

This script is designed to uninstall cPanel from a server. It will stop all cPanel related services, remove cPanel related files and directories, delete cPanel users, and remove cPanel related cron jobs.

The script will also uninstall Apache and reboot your system at the end.

Please note that running this script will delete data and the action is irreversible. You should ensure you have made appropriate backups before running this script.

## Usage

1. Save the script in a file, for example `uninstall_cpanel.sh`.

2. Give the script executable permissions:

```bash
chmod +x uninstall_cpanel.sh
```

3. Run the script as root:

```
sudo ./uninstall_cpanel.sh
```

This will begin the uninstallation process. It may take several minutes depending on the system and network speeds.

**Warning: This script should only be used if you're sure you want to remove cPanel. This process will delete all cPanel related data and it is irreversible.**
