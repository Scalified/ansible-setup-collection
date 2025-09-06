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

| Variable                      | Description                                                          | Default Value                       |
|-------------------------------|----------------------------------------------------------------------|-------------------------------------|
| `nut_mode`                    | NUT operation mode: `none`, `standalone`, `netserver`, `netclient`   | `netserver`                         |
| `nut_ups_name`                | Unique identifier for the UPS device in NUT configuration (required) |                                     |
| `nut_upsd_listen_hosts`       | List of hosts/interfaces to listen on                                | `["*"]`                             |
| `nut_upsd_listen_port`        | Port for UPS daemon to listen on                                     | `3493`                              |
| `nut_users_admin_name`        | Username for administrative access                                   | `nutadmin`                          |
| `nut_users_admin_password`    | Password for administrative access                                   | `nutadmin`                          |
| `nut_users_monitor_name`      | Username for monitoring access                                       | `upsmon`                            |
| `nut_users_monitor_password`  | Password for monitoring access                                       | `nut`                               |
| `nut_users_upsmon_runas_name` | User to run UPS monitor as                                           | `nutmon`                            |
| `nut_upsmon_server`           | UPS server hostname/IP to connect to                                 | `localhost`                         |
| `nut_upsmon_port`             | UPS server port to connect to                                        | `{{ nut_upsd_listen_port }}`        |
| `nut_upsmon_priority`         | UPS monitor priority (`primary` or `secondary`)                      | `primary`                           |
| `nut_upssched_run_user`       | User to run UPS scheduler as                                         | `{{ nut_users_upsmon_runas_name }}` |

## UPS Configuration

The UPS configuration can be supplied in one of the following ways:

1. **On-Demand** Configuration
   UPS devices are automatically scanned and selected during the execution of the `nut` role.
   This method is used only if the `ups` configuration key is not defined in the configuration files.

2. **Manual** Configuration via Host File
   This method requires setting up the configuration before running the `nut` role or any playbook that includes it.

   To manually configure a UPS for the target host (i.e., the host connected to the UPS):
   1. Ensure the `nut` (Network UPS Tools) package is installed on the host.
   2. Run the following command to detect and retrieve the UPS configuration:

     `sudo nut-scanner -UN`

   3. The command will output a configuration block. Use this output to configure the host manually.

Example:

```yaml
# NUT
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
# Optional
nut_ups_variables:
  override.ups.delay.shutdown: "30"
```
