# Roles: Packages

Installs and configures:

* Mandatory and additional packages
* **VIM** with a custom `.vimrc`
* **AGE** encryption tool (optionally)

## Usage

```yaml
---
- name: Install packages
  hosts: all
  roles:
    - scalified.setup.packages
```

## Variables

| Variable                        | Description                                                     | Default Value                        |
| ------------------------------- | --------------------------------------------------------------- | ------------------------------------ |
| `packages_list`                 | List of additional packages to install                          | `[]`                                 |
| `packages_age_private_key_file` | Path to AGE private key file (enables AGE installation if set)  | undefined                            |
| `packages_age_config_dir`       | Directory for AGE configuration                                 | `{{ ansible_env.HOME }}/.config/age` |
