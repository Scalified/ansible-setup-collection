# Roles: System

Configures essential system settings and performs server setup

## Usage

```yaml
---
- name: Configure servers
  hosts: all
  roles:
    - scalified.setup.system
```

## Handlers

**Reboot:** regardless of system state

```yaml
- name: Critical system change requiring immediate reboot
  ansible.builtin.command: some-critical-command
  notify: "system : reboot"
```

**Reboot request:** for most scenarios as it only reboots when necessary
```yaml
- name: Install critical security update
  ansible.builtin.package:
    name: kernel
    state: latest
  notify: "system : request reboot"
```

## Variables

| Variable                        | Description                                     | Default Value            |
|---------------------------------|-------------------------------------------------|--------------------------|
| `system_reboot_timeout`         | Timeout in seconds for system reboot operations | `300`                    |
| `system_update_type`            | Type of system updates: `safe` or `full`        | `safe`                   |
| `system_update_cache_valid_time`| Package cache validity time in seconds          | `3600`                   |
| `system_update_autoremove`      | Remove unused packages after updates            | `true`                   |
| `system_update_autoclean`       | Clean package cache after updates               | `true`                   |
| `system_hostname`               | Hostname to set on target servers               | `{{ ansible_hostname }}` |
| `system_timezone`               | Timezone to set on target servers               | `UTC`                    |
| `system_vm_max_map_count`       | Virtual memory max map count for applications   | `262144`                 |
| `system_motd_src`               | MOTD banner template source path                | `motd`                   |
| `system_motd_contacts`          | Array of contact information for MOTD banner    | `[]`                     |
| `system_bash_aliases`           | Array of bash aliases to configure              | `[]`                     |

### MOTD Contact Configuration

The `system_motd_contacts` variable accepts an array of contact objects with the following structure:

```yaml
system_motd_contacts:
  - name: "Contact Name"          # Required
    position: "Job Title"         # Optional
    email: "email@domain.com"     # Optional
    mobile: "+1-555-0123"         # Optional
```

### Bash Aliases Configuration

The `system_bash_aliases` variable accepts an array of alias objects with the following structure:

```yaml
system_bash_aliases:
  - alias: "myalias"              # Required: alias name
    command: "echo 'Hello World'" # Required: command to execute
    comment: "My custom alias"    # Optional: descriptive comment
  - alias: "ll"                   # Override built-in aliases
    command: "ls -la --color=auto"
```

**Built-in aliases provided:**
- `ll` - Long listing with human-readable format (`ls -lah`)
- `lt` - List sorted by size (`ll -s -1 -FS`)
- `grep` - Colored grep output (`grep --color=auto`)
- `hg` - Search command history (`history|grep`)

## Facts

| Fact                     | Description                                           | Example Values             |
|--------------------------|-------------------------------------------------------|----------------------------|
| `system_os_family`       | Lowercase version of the operating system family      | `debian`, `redhat`, `suse` |
| `system_architecture`    | Normalized architecture string for package management | `amd64`, `arm64`, `armhf`  |
| `system_containerized`   | Indicates if the system is running in a container     | `true`, `false`            |
| `system_systemd_managed` | Indicates if the system is managed by systemd         | `true`, `false`            |
