# CLAUDE.md

This file provides context and structure for Claude Code (claude.ai/code) to work effectively with this repository.

## Overview

This is an **Ansible Collection** for server setup automation, published as: `scalified.setup`.

- Complies with **Ansible Galaxy** standards.
- Supports and is tested on **Debian** and **RedHat** systems.

## Development Commands

- `ansible-lint` — validates code style and Ansible best practices.
- `molecule test` — runs the full test suite.

> ⚠️ On Windows, use `wsl` to run these commands, e.g., `wsl ansible-lint`

## Repository Structure

- `roles/` — Role definitions (e.g., system, packages, docker)
- `molecule/default/` — Molecule test scenario configuration
- `galaxy.yml` — Ansible Galaxy metadata
- `.ansible-lint.yml` — Ansible Lint rules configuration

## Code Style & Conventions

* All files must end with a newline.
* Follow all ansible-lint rules:
    * Use **Fully Qualified Collection Names (FQCN)**.
    * Provide descriptive task names.
    * Variables names from within roles must use `<role>_` as a prefix.
* Use consistent **indentation**, **naming**, and **file structure** across all roles.
* Prefer **Ansible modules** over `ansible.builtin.shell` or `ansible.builtin.command`.
* Avoid `set_fact` unless required.
* Each role must include:
    * `README.md` — usage documentation, consistent format.
    * `meta/main.yml` — Galaxy metadata and role dependencies.

### System Role Facts

- `system_os_family` — Operating system family. Possible values: `Debian`, `RedHat`.
- `system_containerized` — Boolean. Indicates if the system is running in a container.
- `system_systemd_managed` — Boolean. Indicates if `systemd` is available on the system.
- `system_architecture` — System architecture. Possible values: `amd64`, `arm64`.

### Distribution-Specific Logic

* Use lowercase folders for each OS (e.g., `debian/`, `redhat/`).
* Reference these using the `system_os_family` variable dynamically in tasks and vars.

## Molecule Tests

* Run integration tests with: molecule test.
* Every file with logic must have a corresponding test file in: `molecule/default/roles/<role>/tasks/`
* Role-level verifications are placed in: `molecule/default/verify.yml`
* Use the following test files as templates:
    * `packages/tasks/packages.yml` — verify package installations.
    * `fs/tasks/mount.yml` — verify files, directories, scripts attributes and content.
    * `docker/tasks/setup.yml` - verify user group.
