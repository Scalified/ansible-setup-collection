# Baseline

Baseline role that coordinates the execution of multiple essential roles for system setup and configuration

## Usage

```yaml
---
- name: Apply baseline configuration
  hosts: all
  roles:
    - scalified.setup.baseline
```

## Variables

| Variable                    | Description                         | Default Value |
|-----------------------------|-------------------------------------|---------------|
| `baseline_firewall_enabled` | Enables firewall configuration role | `true`        |
| `baseline_mail_enabled`     | Enables mail configuration role     | `true`        |

## Dependent Roles

- `scalified.setup.system`
- `scalified.setup.packages`
- `scalified.setup.firewall`
- `scalified.setup.fs`
- `scalified.setup.mail`
