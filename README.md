# Selecting Versions of Ansible

Based on Alpine, Debian and Ubuntu base images.
Images on DockerHub will be updated periodically.

The following options are available:

Alpine:

    FROM corbanr/ansible:2.9-alpine3.13
    FROM corbanr/ansible:2.9-alpine

Debian:

    FROM corbanr/ansible:2.9-debian10.8
    FROM corbanr/ansible:2.9-debian

Ubuntu:

    FROM corbanr/ansible:2.9-ubuntu20.04
    FROM corbanr/ansible:2.9-ubuntu

# TODO
- Maybe add ansible minor tags. Example: `ansible:2.9.1-ubuntu`
  - Add latest tag, if minor tags are added. Example: `ansible:latest-ubuntu`
