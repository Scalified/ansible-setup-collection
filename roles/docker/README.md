# Docker

Installs and configures Docker

## Usage

```yaml
---
- name: Install Docker
  hosts: all
  roles:
    - scalified.setup.docker
```

## Variables

| Variable                   | Description                                   | Default Value           |
|----------------------------|-----------------------------------------------|-------------------------|
| `docker_user`              | User to add to the docker group               | `{{ ansible_user_id }}` |
| `docker_system_prune_cron` | Docker system prune cron schedule             | `17 1 * * *`            |
| `docker_swarm_enabled`     | Enable Docker Swarm mode                      | `false`                 |
| `docker_registries`        | Docker registry authentication configuration  |                         |
| `docker_networks`          | Docker networks configuration                 |                         |

## Docker Networks

**Docker** networks that need to be created must be defined in the `docker_networks` variable:

```yaml
docker_networks:
  web:
    name: web
    subnet: 172.20.0.0/16
    interface_name: br-web
  db:
    name: db
    driver: overlay
    attachable: true
    internal: true
```

## Docker Registries

The role can authenticate with private Docker registries, allowing containers to be pulled from secured repositories.

### Configuration

Private **Docker** registries that need to be authenticated must be defined in the `docker_registries` variable:

```yaml
docker_registries:
  docker_hub:
    host: https://index.docker.io/v1/
    username: myuser
    password: mypassword
  private_registry:
    host: registry.example.com
    username: registryuser
    password: registrypass
```
