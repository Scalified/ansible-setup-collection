# SSL

Manages SSL certificates and keys

## Usage

```yaml
---
- name: Manage SSL certificates
  hosts: all
  roles:
    - scalified.setup.ssl
```

## Variables

| Variable                                  | Description                              | Default Value                                                        |
|-------------------------------------------|------------------------------------------|----------------------------------------------------------------------|
| `ssl_domain`                              | Domain name for certificates             | `{{ domain }}`                                                       |
| `ssl_keys_ca_src`                         | CA private key source path               |                                                                      |
| `ssl_keys_ca_name`                        | CA private key filename                  | `ca.key`                                                             |
| `ssl_keys_ca_dir`                         | CA private key directory                 | See [SSL Directories](#ssl-directories)                              |
| `ssl_keys_server_name`                    | Server private key filename              | `{{ ssl_domain }}.key`                                               |
| `ssl_keys_server_dir`                     | Server private key directory             | See [SSL Directories](#ssl-directories)                              |
| `ssl_keys_server_mode`                    | File mode for server private key         | `"0600"`                                                             |
| `ssl_keys_server_owner`                   | Owner for server private key             | `root`                                                               |
| `ssl_keys_server_group`                   | Group for server private key             | `root`                                                               |
| `ssl_certs_ca_src`                        | CA certificate source path               |                                                                      |
| `ssl_certs_ca_name`                       | CA certificate filename                  | `ca.crt`                                                             |
| `ssl_certs_ca_dir`                        | CA certificate directory                 | See [SSL Directories](#ssl-directories)                              |
| `ssl_certs_server_generate`               | Generate SSL server certificate          | `true`                                                               |
| `ssl_certs_server_name`                   | Server certificate filename              | `{{ ssl_domain }}.crt`                                               |
| `ssl_certs_server_dir`                    | Server certificate directory             | See [SSL Directories](#ssl-directories)                              |
| `ssl_certs_server_mode`                   | File mode for server certificate         | `"0644"`                                                             |
| `ssl_certs_server_owner`                  | Owner for server certificate             | `root`                                                               |
| `ssl_certs_server_group`                  | Group for server certificate             | `root`                                                               |
| `ssl_bundle_generate`                     | Generate SSL bundle                      | `false`                                                              |
| `ssl_bundle_name`                         | Certificate bundle filename              | `{{ ssl_domain }}-bundle.pem`                                        |
| `ssl_bundle_mode`                         | File mode for certificate bundle         | `"0600"`                                                             |
| `ssl_bundle_owner`                        | Owner for certificate bundle             | `root`                                                               |
| `ssl_bundle_group`                        | Group for certificate bundle             | `root`                                                               |
| `ssl_certs_not_after`                     | Certificate validity period              | `"+52000w"`                                                          |
| `ssl_csr_country_name`                    | Country for CSR subject                  | `UA`                                                                 |
| `ssl_csr_state_or_province_name`          | State or province for CSR subject        | `Kyiv`                                                               |
| `ssl_csr_locality_name`                   | Locality (city) for CSR subject          | `Kyiv`                                                               |
| `ssl_csr_organization_name`               | Organization for CSR subject             | `""`                                                                 |
| `ssl_csr_organizational_unit_name`        | Organizational unit for CSR subject      | `""`                                                                 |
| `ssl_csr_email_address`                   | Email address for CSR subject            | `team@{{ ssl_domain }}`                                              |
| `ssl_csr_ca_common_name`                  | Common name for CA CSR                   | `{{ ssl_domain }}`                                                   |
| `ssl_csr_ca_country_name`                 | Country for CA CSR                       | `{{ ssl_csr_country_name }}`                                         |
| `ssl_csr_ca_state_or_province_name`       | State or province for CA CSR             | `{{ ssl_csr_state_or_province_name }}`                               |
| `ssl_csr_ca_locality_name`                | Locality (city) for CA CSR               | `{{ ssl_csr_locality_name }}`                                        |
| `ssl_csr_ca_organization_name`            | Organization for CA CSR                  | `{{ ssl_csr_organization_name }}`                                    |
| `ssl_csr_ca_organizational_unit_name`     | Organizational unit for CA CSR           | `{{ ssl_csr_organizational_unit_name }}`                             |
| `ssl_csr_ca_email_address`                | Email address for CA CSR                 | `{{ ssl_csr_email_address }}`                                        |
| `ssl_csr_server_common_name`              | Common name for server CSR               | `"*.{{ ssl_domain }}"`                                               |
| `ssl_csr_server_country_name`             | Country for server CSR                   | `{{ ssl_csr_country_name }}`                                         |
| `ssl_csr_server_state_or_province_name`   | State or province for server CSR         | `{{ ssl_csr_state_or_province_name }}`                               |
| `ssl_csr_server_locality_name`            | Locality (city) for server CSR           | `{{ ssl_csr_locality_name }}`                                        |
| `ssl_csr_server_organization_name`        | Organization for server CSR              | `{{ ssl_csr_organization_name }}`                                    |
| `ssl_csr_server_organizational_unit_name` | Organizational unit for server CSR       | `{{ ssl_csr_organizational_unit_name }}`                             |
| `ssl_csr_server_email_address`            | Email address for server CSR             | `{{ ssl_csr_email_address }}`                                        |
| `ssl_csr_server_subject_alt_name`         | Subject Alternative Names for server CSR | `["DNS:*.{{ ssl_domain }}", "DNS:{{ ssl_domain }}", "IP:127.0.0.1"]` |

## SSL Directories

The following table lists the default values for key and certificate directories depending on the operating system:

| Variable               | Description                  | Debian/Ubuntu                      | RedHat/CentOS                      |
|------------------------|------------------------------|------------------------------------|------------------------------------|
| `ssl_keys_ca_dir`      | CA private key directory     | `/etc/ssl/private`                 | `/etc/pki/CA/private`              |
| `ssl_keys_server_dir`  | Server private key directory | `/etc/ssl/private`                 | `/etc/pki/tls/private`             |
| `ssl_certs_ca_dir`     | CA certificate directory     | `/usr/local/share/ca-certificates` | `/etc/pki/ca-trust/source/anchors` |
| `ssl_certs_server_dir` | Server certificate directory | `/etc/ssl/certs`                   | `/etc/pki/tls/certs`               |

## Copy CA Certificate and Key

When both `ssl_certs_ca_path` and `ssl_keys_ca_path` are set, the existing CA certificate and key are copied instead of being generated
