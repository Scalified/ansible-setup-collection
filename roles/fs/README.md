# Roles: FS

Manages files, directories and automates the mounting process

## Usage

```yaml
---
- name: Manage filesystem
  hosts: all
  roles:
    - scalified.setup.fs
```

## Variables

| Variable                            | Description                            | Default Value                 |
| ------------------------------------| -------------------------------------- | ----------------------------- |
| `fs_files`                          | List of files or directories to manage | `[]`                          |
| `fs_mount_auto_remount_scripts_dir` | Directory for auto-remount scripts     | `/usr/local/lib/auto-remount` |
| `fs_mount_cifs`                     | List of CIFS mount definitions         | `[]`                          |

### Files and Directories Management

```yaml
fs_files:
  - path: /opt/mydir
    state: directory
    owner: myuser
    group: mygroup
    mode: "0755"
  - path: /opt/myfile.txt
    state: touch
    owner: myuser
    group: mygroup
    mode: "0644"
```

### CIFS Mounts

```yaml
fs_mount_cifs:
  - name: "share1"
    url: "//server/share"
    path: "/mnt/share1"
    username: "user"
    password: "pass"
    cron: "17 * * * *"  # Optional: custom cron schedule for auto remount
```

### Auto Remount

The autoremount process ensures that mounts stay available even after temporary disruptions such as network issues or server reboots

The role installs an `auto-remount` script and configures a cron job for each mount, scheduled by default to run every 17 minutes. This cron job regularly invokes the script, providing the mount point path as an argument. The script verifies the status of the mount and, if it is missing or unresponsive, automatically remounts it using the original credentials and options

Additionally, whenever a remount occurs, `auto-remount` executes all scripts located in the directory specified by `fs_mount_auto_remount_scripts_dir`.
