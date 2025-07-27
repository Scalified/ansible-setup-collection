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
|-------------------------------------|----------------------------------------|-------------------------------|
| `fs_files`                          | List of files or directories to manage | `[]`                          |
| `fs_drives`                         | List of drive mount configurations     | `[]`                          |
| `fs_mount_auto_remount_scripts_dir` | Directory for auto-remount scripts     | `/usr/local/lib/auto-remount` |
| `fs_mount_cifs`                     | List of CIFS mount definitions         | `[]`                          |

### Drives

To mount drives, a drive mount configuration must be provided.
Before configuring the mount, identify the device path using one of the following commands:

  - `sudo lsblk`
  - `sudo fdisk -l`

To format the disk, enable the `format.enabled` option by setting it to `true` (`false` 
by default). If the drive is already formatted, it will not be formatted again unless the 
`format.force` option is set to `true` (`false` by default). 

> Force formatting will work only if the drive is not in use and can be successfully unmounted.
If the device is busy or cannot be unmounted, you will need to manually remove it from the
boot-time mount configuration

Below is an example configuration for mounting drives:

```yaml
fs_drives:
  - path: /dev/nvme0n1
    format:
      enabled: true # disabled by default
      force: true # force formatting anyway
    fstype: ext4
    mount_point: /mnt/media
    mount_opts: nodev,noatime,nodiratime,data=ordered,barrier=1,commit=30,discard
```

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
    owner: root
    group: root
    mode: "0770"
    username: "user"
    password: "pass"
    cron: "17 * * * *"  # Optional: custom cron schedule for auto remount
```

### Auto Remount

The autoremount process ensures that mounts stay available even after temporary disruptions such as network issues or server reboots

The role installs an `auto-remount` script and configures a cron job for each mount, scheduled by default to run every 17 minutes. This cron job regularly invokes the script, providing the mount point path as an argument. The script verifies the status of the mount and, if it is missing or unresponsive, automatically remounts it using the original credentials and options

Additionally, whenever a remount occurs, `auto-remount` executes all scripts located in the directory specified by `fs_mount_auto_remount_scripts_dir`.
