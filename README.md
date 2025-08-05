# Ansible Setup Collection

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build](https://github.com/Scalified/ansible-setup-collection/actions/workflows/build.yml/badge.svg)](https://github.com/Scalified/ansible-setup-collection/actions)
[![Release](https://img.shields.io/github/v/release/Scalified/ansible-setup-collection?style=flat-square)](https://github.com/Scalified/ansible-setup-collection/releases/latest)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-scalified.setup-blue.svg)](https://galaxy.ansible.com/scalified/setup)

Ansible collection for server setup with system configuration and essential tools

## Requirements

- **Ansible:** >= 2.16.0
- **Python:** >= 3.6
- **Target OS:** Debian, Rocky
- **Privileges:** Most roles require `become: true` (sudo access)

## Installation

### Ansible Galaxy

```bash
ansible-galaxy collection install scalified.setup
```

### Git Repository

```bash
ansible-galaxy collection install git+https://github.com/scalified/ansible-setup-collection.git
```

### Requirements File

`requirements.yml`:
```yaml
---
collections:
  - name: scalified.setup
```

```bash
ansible-galaxy collection install -r requirements.yml
```

## Roles

* [Roles: System](roles/system/README.md)
* [Roles: Packages](roles/packages/README.md)
* [Roles: Firewall](roles/firewall/README.md)
* [Roles: FS](roles/fs/README.md)
* [Roles: Mail](roles/mail/README.md)
* [Roles: Baseline](roles/baseline/README.md)
* [Roles: SSL](roles/ssl/README.md)
* [Roles: Docker](roles/docker/README.md)
* [Roles: Samba](roles/samba/README.md)

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**
