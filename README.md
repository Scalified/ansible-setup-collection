# Ansible Setup Collection

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build](https://github.com/Scalified/ansible-setup-collection/actions/workflows/build.yml/badge.svg)](https://github.com/Scalified/ansible-setup-collection/actions)
[![Release](https://img.shields.io/github/v/release/Scalified/ansible-setup-collection?style=flat-square)](https://github.com/Scalified/ansible-setup-collection/releases/latest)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-scalified.setup-blue.svg)](https://galaxy.ansible.com/scalified/setup)

Ansible collection for server setup with system configuration and essential tools

## Requirements

- **Ansible:** >= 2.15.0
- **Python:** >= 3.6
- **Target OS:** Ubuntu, Rocky
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

## Usage

* [Roles: System](roles/system/README.md)
* [Roles: Packages](roles/packages/README.md)
* [Roles: Firewall](roles/firewall/README.md)

## License

```
MIT License

Copyright (c) 2025 Scalified

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

## Support

* [Scalified](http://www.scalified.com)
* [Scalified Official Facebook Page](https://www.facebook.com/scalified)
* <a href="mailto:info@scalified.com?subject=[Ansible Setup Collection]: Proposals And Suggestions">Scalified Support</a>

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**
