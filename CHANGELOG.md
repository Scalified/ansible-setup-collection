# 2.0.0

* [#2 Roles: Packages](https://github.com/Scalified/ansible-setup-collection/issues/2)
* [#4 Roles: Firewall](https://github.com/Scalified/ansible-setup-collection/issues/4)
* [#6 Roles: FS](https://github.com/Scalified/ansible-setup-collection/issues/6)
* [#8 Roles: Mail](https://github.com/Scalified/ansible-setup-collection/issues/8)
* [#10 Roles: Baseline](https://github.com/Scalified/ansible-setup-collection/issues/10)
* [#12 Roles: SSL](https://github.com/Scalified/ansible-setup-collection/issues/12)

## Features

- **Roles: SSL**: Manages SSL certificates, including creation, deployment, and trust configuration
    - Supports both generation and deployment of SSL certificates and keys
    - Handles CA and server certificate management
    - Updates system trust stores for supported platforms
- **Roles: Baseline**: Provides initial system configuration and essential settings
    - Sets up recommended system defaults and security hardening
    - Configures basic environment and system parameters
    - Prepares the system for further automation and role application
- **Roles: Mail**: Added new role for mail configuration
    - Sets up outgoing mail delivery
    - Redirects system mail to a specified address
    - Schedules periodic host statistics email reports
- **Roles: FS**: Added new role for filesystem management
    - Manages filesystems and mount points
    - Supports shares mount
- **Roles: Firewall**: Added new role for host firewall management
    - Supports Debian (UFW) and RedHat (firewalld) firewalls
    - Allows custom rule definitions and SSH/ports configuration
- **Roles: Packages**: Introduced a new role for package management and configuration
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
