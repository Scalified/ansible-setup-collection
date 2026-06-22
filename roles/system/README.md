# System

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

**Reset SSH connection** to allow user changes to affect *current login user*

```yaml
- name: Add user to the group
  ansible.builtin.user:
    name: "{{ ansible_user_id }}"
    groups: admins
    append: true
  become: true
  notify: "system : reset connection"
```

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

| Variable                        | Description                                     | Default Value                                            |
|---------------------------------|-------------------------------------------------|----------------------------------------------------------|
| `system_reboot_timeout`         | Timeout in seconds for system reboot operations | `300`                                                    |
| `system_update_only`            | Only perform system updates, skip other tasks   | `false`                                                  |
| `system_update_type`            | Type of system updates: `safe` or `full`        | `safe`                                                   |
| `system_update_autoremove`      | Remove unused packages after updates            | `true`                                                   |
| `system_update_autoclean`       | Clean package cache after updates               | `true`                                                   |
| `system_hostname`               | Hostname to set on target servers               | `{{ ansible_hostname }}`                                 |
| `system_timezone`               | Timezone to set on target servers               | `UTC`                                                    |
| `system_locale_default`         | Default system locale                           | `en_US.UTF-8`                                            |
| `system_locales`                | List of system locales                          | `[]`                                                     |
| `system_sysctl`                 | System kernel parameters                        | `{"vm.max_map_count": 262144, "fs.aio-max-nr": 1048576}` |
| `system_motd_src`               | MOTD banner template source path                | `motd.j2`                                                |
| `system_motd_contacts`          | Array of contact information for MOTD banner    | `[]`                                                     |
| `system_scripts_default`        | Default scripts deployed to `/usr/local/bin`    | `['thermal']`                                            |
| `system_scripts`                | Scripts deployed to `/usr/local/bin`            | `[]`                                                     |
| `system_services`               | Service management (see [services](#services))  | `[]`                                                     |

### MOTD Contact Configuration

The `system_motd_contacts` variable accepts an array of contact objects with the following structure:

```yaml
system_motd_contacts:
  - name: "Contact Name"          # Required
    position: "Job Title"         # Optional
    email: "email@domain.com"     # Optional
    mobile: "+1-555-0123"         # Optional
```

### Services

The `system_services` variable accepts an array of services with the following structure:

```yaml
system_services:
  - name: getty@tty1
    enabled: false
    state: stopped
    masked: true
```

## Facts

| Fact                     | Description                                           | Example Values             |
|--------------------------|-------------------------------------------------------|----------------------------|
| `system_os_family`       | Lowercase version of the operating system family      | `debian`, `redhat`, `suse` |
| `system_architecture`    | Normalized architecture string for package management | `amd64`, `arm64`, `armhf`  |
| `system_containerized`   | Indicates if the system is running in a container     | `true`, `false`            |
| `system_systemd_managed` | Indicates if the system is managed by systemd         | `true`, `false`            |

## Scripts

| Name      | Description                                              | Usage Example |
|-----------|----------------------------------------------------------|---------------|           
| `thermal` | Displays `thermal_zone*` temperature readings in Celsius | `thermal`     |
