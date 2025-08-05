# Roles: NUT

Installs and configures Network UPS Tools (NUT) for UPS monitoring and management

## Usage

```yaml
---
- name: Configure UPS monitoring
  hosts: all
  roles:
    - scalified.setup.nut
```

## Variables

| Variable                        | Description                                                          | Default Value                       |
|---------------------------------|----------------------------------------------------------------------|-------------------------------------|
| `nut_mode`                      | NUT operation mode: `none`, `standalone`, `netserver`, `netclient`   | `netserver`                         |
| `nut_ups_name`                  | Unique identifier for the UPS device in NUT configuration (required) |                                     |
| `nut_upsd_listen_hosts`         | List of hosts/interfaces to listen on                                | `["*"]`                             |
| `nut_upsd_listen_port`          | Port for UPS daemon to listen on                                     | `3493`                              |
| `nut_users_admin_name`          | Username for administrative access                                   | `nutadmin`                          |
| `nut_users_admin_password`      | Password for administrative access                                   | `nutadmin`                          |
| `nut_users_monitor_name`        | Username for monitoring access                                       | `upsmon`                            |
| `nut_users_monitor_password`    | Password for monitoring access                                       | `nut`                               |
| `nut_users_upsmon_runas_name`   | User to run UPS monitor as                                           | `nutmon`                            |
| `nut_upsmon_server`             | UPS server hostname/IP to connect to                                 | `localhost`                         |
| `nut_upsmon_port`               | UPS server port to connect to                                        | `{{ nut_upsd_listen_port }}`        |
| `nut_upsmon_priority`           | UPS monitor priority (`primary` or `secondary`)                      | `primary`                           |
| `nut_upsmon_powerdownflag`      | Path to powerdown flag file                                          | `/etc/killpower`                    |
| `nut_upssched_run_dir`          | Directory for UPS scheduler runtime files                            | `/run/nut/upssched`                 |
| `nut_upssched_run_user`         | User to run UPS scheduler as                                         | `{{ nut_users_upsmon_runas_name }}` |

## UPS Configuration

```yaml
nut_mode: netserver
nut_ups_name: eaton
nut_ups_config:
  driver: usbhid-ups
  port: auto
  vendor: EATON
  vendorid: "0463"
  product: Ellipse PRO
  productid: "FFFF"
  serial: "G358R13004"
  bus: "003"
nut_ups_variables:
  override.ups.delay.shutdown: "30"
```
