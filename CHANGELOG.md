# 2.7.2

[#38 Fix Idempotency](https://github.com/Scalified/ansible-setup-collection/issues/38)

# 2.7.1

[#37 Permission denied on initial docker networks creation](https://github.com/Scalified/ansible-setup-collection/issues/37)

# 2.7.0

[#35 Replace apt_key with deb822_repository](https://github.com/Scalified/ansible-setup-collection/issues/35)

# 2.6.2

[#34 Downgrade community.docker to version 4.8.2](https://github.com/Scalified/ansible-setup-collection/issues/34)

# 2.6.1

[#33 Wrong SSL Keys Server path](https://github.com/Scalified/ansible-setup-collection/issues/33)

# 2.6.0

[#31 SSL Directories as defaults](https://github.com/Scalified/ansible-setup-collection/issues/31)

# 2.5.0

[#29 System Update Only](https://github.com/Scalified/ansible-setup-collection/issues/29)

# 2.4.1

[#26 Cache valid time issue on Debian](https://github.com/Scalified/ansible-setup-collection/issues/26)

# 2.4.0

* [#24 Change sysctl](https://github.com/Scalified/ansible-setup-collection/issues/24)

# 2.3.0

* [#22 Roles: NUT](https://github.com/Scalified/ansible-setup-collection/issues/22)

## Features

- **Roles: NUT**: Added new role for Network UPS Tools (NUT) configuration and monitoring
    - Installs NUT server and client packages
    - Configures UPS monitoring with support for various UPS models
    - Provides comprehensive UPS status monitoring and alerting
    - Supports automatic shutdown on battery events
    - Includes flexible configuration for multiple UPS devices
    - Provides comprehensive molecule tests and documentation

# 2.2.0

* [#20 Roles Reorganization](https://github.com/Scalified/ansible-setup-collection/pull/21)

# 2.1.0

* [#18 Roles: Samba](https://github.com/Scalified/ansible-setup-collection/issues/18)

## Features

- **Samba**: Added new role for Samba server configuration and file sharing
    - Installs Samba server packages and dependencies
    - Configures SMB shares with customizable permissions and ownership
    - Supports user authentication and password management
    - Provides flexible share configuration with browseable/writeable settings
    - Includes comprehensive molecule tests and documentation


# 2.0.0

* [#2 Roles: Packages](https://github.com/Scalified/ansible-setup-collection/issues/2)
* [#4 Roles: Firewall](https://github.com/Scalified/ansible-setup-collection/issues/4)
* [#6 Roles: FS](https://github.com/Scalified/ansible-setup-collection/issues/6)
* [#8 Roles: Mail](https://github.com/Scalified/ansible-setup-collection/issues/8)
* [#10 Roles: Baseline](https://github.com/Scalified/ansible-setup-collection/issues/10)
* [#12 Roles: SSL](https://github.com/Scalified/ansible-setup-collection/issues/12)
* [#15 Roles: Docker](https://github.com/Scalified/ansible-setup-collection/issues/15)

## Features

- **Docker**: Added new role for Docker installation and configuration
    - Installs Docker Engine and Docker Compose
    - Configures Docker daemon settings and user permissions
    - Supports container runtime management and Docker service control
- **SSL**: Manages SSL certificates, including creation, deployment, and trust configuration
    - Supports both generation and deployment of SSL certificates and keys
    - Handles CA and server certificate management
    - Updates system trust stores for supported platforms
- **Baseline**: Provides initial system configuration and essential settings
    - Sets up recommended system defaults and security hardening
    - Configures basic environment and system parameters
    - Prepares the system for further automation and role application
- **Mail**: Added new role for mail configuration
    - Sets up outgoing mail delivery
    - Redirects system mail to a specified address
    - Schedules periodic host statistics email reports
- **FS**: Added new role for filesystem management
    - Manages filesystems and mount points
    - Supports shares mount
- **Firewall**: Added new role for host firewall management
    - Supports Debian (UFW) and RedHat (firewalld) firewalls
    - Allows custom rule definitions and SSH/ports configuration
- **Packages**: Introduced a new role for package management and configuration
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
