# Roles: Mail

Configures mail and stats

## Usage

```yaml
---
- name: Configure mail and stats
  hosts: all
  roles:
    - scalified.setup.mail
```

## Variables

| Variable               | Description                                          | Default Value            |
|------------------------|------------------------------------------------------|--------------------------|
| `mail_hostname`        | Hostname for mail configuration                      | `{{ ansible_hostname }}` |
| `mail_smtp_server`     | SMTP server hostname or IP address                   |                          |
| `mail_smtp_port`       | SMTP server port                                     |                          |
| `mail_smtp_username`   | SMTP authentication username                         |                          |
| `mail_smtp_password`   | SMTP authentication password                         |                          |
| `mail_recipient`       | Email address to forward root/system mail (required) |                          |
| `mail_host_stats_cron` | Host stats cron schedule (disabled if not provided)  |                          |
