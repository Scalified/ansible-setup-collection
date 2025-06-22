# 2.0.0

* [#2 Packages Role](https://github.com/Scalified/ansible-setup-collection/issues/2)
* [#4 Firewall Role](https://github.com/Scalified/ansible-setup-collection/issues/4)

## Features

- **Firewall Role**: Added new role for host firewall management
    - Supports Debian (UFW) and RedHat (firewalld) firewalls
    - Allows custom rule definitions and SSH/ports configuration
- **Packages Role**: Introduced a new role for package management and configuration
    - Installs essential system packages and supports user-defined package lists
    - Handles OS-specific package installation logic
    - Installs and configures VIM with a custom .vimrc
    - Installs AGE encryption tool and manages secure private key deployment

# 1.0.0

* [#1 System Role](https://github.com/Scalified/ansible-setup-collection/issues/1)

## Features

- **System Updates**: Added comprehensive package management with configurable update policies
- **Virtual Memory Tuning**: Added `vm.max_map_count` configuration for memory-intensive applications
- **MOTD Banner**: Implemented customizable warning banner for production systems with contact information
- **Container-Aware Operations**: Tasks now conditionally execute based on environment detection
