# Roles: System

Configures essential system settings and performs baseline server setup including:

* **System Updates** - Package management with configurable update policies
* **Hostname Configuration** - Sets system hostname (skipped in containers)
* **Time Synchronization** - Configures system timezone (skipped in containers) 
* **Virtual Memory Tuning** - Optimizes memory mapping limits (skipped in containers)
* **MOTD Banner** - Sets up warning banner for production systems

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

| Variable                        | Description                                     | Default Value        |
| ------------------------------- | ----------------------------------------------- | -------------------- |
| `system_reboot_timeout`         | Timeout in seconds for system reboot operations | `300`                |
| `system_update_type`            | Type of system updates: `safe` or `full`        | `safe`               |
| `system_update_cache_valid_time`| Package cache validity time in seconds          | `3600`               |
| `system_update_autoremove`      | Remove unused packages after updates            | `true`               |
| `system_update_autoclean`       | Clean package cache after updates               | `true`               |
| `system_hostname`               | Hostname to set on target servers               | `{{ ansible_host }}` |
| `system_timezone`               | Timezone to set on target servers               | `UTC`                |
| `system_vm_max_map_count`       | Virtual memory max map count for applications   | `262144`             |
| `system_motd_banner_file`       | Template file for MOTD banner                   | `motd`               |
| `system_motd_contacts`          | Array of contact information for MOTD banner    | `[]`                 |
| `system_bash_aliases`           | Array of bash aliases to configure              | `[]`                 |

### MOTD Contact Configuration

The `system_motd_contacts` variable accepts an array of contact objects with the following structure:

```yaml
system_motd_contacts:
  - name: "Contact Name"          # Required
    position: "Job Title"         # Optional
    email: "email@domain.com"     # Optional
    mobile: "+1-555-0123"         # Optional
```
