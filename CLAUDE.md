# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository

## Overview

**Ansible** collection for server setup automation. Published on **Ansible Galaxy** as `scalified.setup` and must conform to **Galaxy** standards. Designed primarily for `Debian/RedHat` OS and tested on them

## Commands

- `ansible-lint` - Lint validation  
- `molecule test` - Full test cycle

> On **Windows** machines, before running any of the above commands, launch **WSL** by executing the `wsl` command

## Structure

- `roles/` - Individual setup roles (system, packages, docker, etc.)
- `molecule/default/` - Test configuration in molecule.yml
- `galaxy.yml` - Collection metadata
- `.ansible-lint.yml` - Lint rules

## Development

- Each role must include:
    - `README.md` - usage examples documentation (must follow the same style for all roles)
    - `meta/main.yml` - **Galaxy** information and role dependencies
- Prefer **Ansible** modules over raw `ansible.builtin.shell` or `ansible.builtin.command` usage
- Avoid using `set_fact` unless absolutely necessary
- The `system` role sets the following **Ansible** facts:
    - `system_os_family` - OS family (`Debian/RedHat`)
    - `system_containerized` - indicates if running inside a container
    - `system_systemd_managed` - indicates if `systemd` is available
    - `system_architecture` - system architecture (`amd64`, `arm64`)
- Use `molecule test` for integration testing
- Role-specific verifications are defined in `molecule/default/verify.yml`
- Each file containing logic that requires testing must have a corresponding **Molecule** verification file with the same name
- For test scenarios with multiple steps, use `block` to group **Molecule** tasks logically

## Code Style

- All files must end with a newline
- Follow consistent indentation, naming, and structure across roles and tasks
