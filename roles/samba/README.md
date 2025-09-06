# Samba

Installs and configures Samba server for file sharing

## Usage

```yaml
---
- name: Install Samba
  hosts: all
  roles:
    - scalified.setup.samba
```

## Variables

| Variable                  | Description                 | Default Value            |
|---------------------------|-----------------------------|--------------------------|
| `samba_user`              | Samba username              | `{{ ansible_user_id }}`  |
| `samba_password`          | Samba user password         |                          |
| `samba_interfaces`        | Network interface to bind   | `[]`                     |
| `samba_server_string`     | Server description          | `Samba Server`           |
| `samba_workgroup`         | Workgroup name              | `WORKGROUP`              |
| `samba_netbios_name`      | NetBIOS name                | `{{ ansible_hostname }}` |
| `samba_security`          | Security mode               | `user`                   |
| `samba_encrypt_passwords` | Encrypt passwords           | `yes`                    |
| `samba_log_file`          | Log file path               | `/var/log/samba/log.%m`  |
| `samba_max_log_size`      | Maximum log size            | `50`                     |
| `samba_dns_proxy`         | DNS proxy setting           | `no`                     |
| `samba_share_browseable`  | Share browseable setting    | `yes`                    |
| `samba_share_writeable`   | Share writeable setting     | `yes`                    |
| `samba_share_mode`        | Share permissions           | `0770`                   |
| `samba_share_owner`       | Share owner                 | `{{ ansible_user_id }}`  |
| `samba_share_group`       | Share group                 | `root`                   |
| `samba_share_comment`     | Share comment               | `Shared Folder`          |
| `samba_shares`            | List of shares to configure | `[]`                     |

## Samba Shares Configuration

```yaml
---
samba_shares:
  - name: documents
    path: /srv/samba/documents
    comment: "Shared documents"
  - name: media
    path: /srv/samba/media
    comment: "Shared media files"
    writeable: "no"
```
