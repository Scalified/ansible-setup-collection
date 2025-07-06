# Roles: Firewall

Installs and configures firewall

## Usage

```yaml
---
- name: Configure firewall
  hosts: all
  roles:
    - scalified.setup.firewall
```

## Variables

| Variable                 | Description                                | Default Value |
|--------------------------|--------------------------------------------|---------------|
| `firewall_in_deny_all`   | Deny all incoming connections by default   | `true`        |
| `firewall_in_allow_ssh`  | Allow incoming SSH connections             | `true`        |
| `firewall_out_allow_all` | Allow all outgoing connections             | `true`        |
| `firewall_rules`         | List of additional firewall rules to apply | `[]`          |

### Firewall Rules

#### Debian

```yaml
firewall_rules:
  - rule: allow
    port: 80
    protocol: tcp
    direction: in
    comment: "Allow HTTP"
  - rule: allow
    port: 443
    protocol: tcp
    direction: in
    comment: "Allow HTTPS"
  - rule: allow
    port: 53
    protocol: udp
    direction: in
    from: 192.168.1.0/24
    comment: "Allow DNS from local network"
```

#### RedHat

```yaml
firewall_rules:
  - service: http
    state: enabled
    permanent: true
  - port: 3306/tcp
    source: 192.168.1.0/24
    state: enabled
    permanent: true
  - rich_rule: 'rule family="ipv4" source address="10.0.0.0/8" port port="8080" protocol="tcp" accept'
    state: enabled
    permanent: true
```
