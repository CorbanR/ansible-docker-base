# Selecting Versions of Ansible

Based on Alpine, Debian and Ubuntu base images.
Images on DockerHub will be updated periodically.

The following options are available:

Alpine:

    FROM corbanr/ansible:2.8-alpine3.9
    FROM corbanr/ansible:2.8-alpine

Debian:

    FROM corbanr/ansible:2.8-debian9.8
    FROM corbanr/ansible:2.8-debian

Ubuntu:

    FROM corbanr/ansible:2.8-ubuntu18.04
    FROM corbanr/ansible:2.8-ubuntu

# TODO
- Maybe add ansible minor tags. Example: `ansible:2.8.2-ubuntu`
  - Add latest tag, if minor tags are added. Example: `ansible:latest-ubuntu`
