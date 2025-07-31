# Roles: Packages

Installs and configures:

* Mandatory and additional packages
* **VIM** with a custom `.vimrc`
* **Bash** with custom aliases and completion
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
|---------------------------------|-----------------------------------------------------------------|--------------------------------------|
| `packages_list`                 | List of additional packages to install                          | `[]`                                 |
| `packages_bash_aliases`         | Array of bash aliases to configure                              | `[]`                                 |
| `packages_age_private_key_file` | Path to AGE private key file (enables AGE installation if set)  | undefined                            |
| `packages_age_config_dir`       | Directory for AGE configuration                                 | `{{ ansible_env.HOME }}/.config/age` |

### Age

To generate a new Age key pair and save it to a file, run:

```bash
age-keygen -o age.key
```

### Bash Aliases Configuration

The `packages_bash_aliases` variable accepts an array of alias objects with the following structure:

```yaml
packages_bash_aliases:
  - alias: "myalias"                # Required: alias name
    command: "echo 'Hello World'"   # Required: command to execute
    comment: "My custom alias"      # Optional: descriptive comment
  - alias: "ll"                     # Override built-in aliases
    command: "ls -la --color=auto"
```

**Built-in aliases provided:**
- `ll` - Long listing with human-readable format (`ls -lah`)
- `lt` - List sorted by size (`ll -s -1 -FS`)
- `grep` - Colored grep output (`grep --color=auto`)
- `hg` - Search command history (`history|grep`)
