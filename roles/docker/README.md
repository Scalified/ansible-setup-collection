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
