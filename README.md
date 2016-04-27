Selecting Versions of Ansible
=============================
Based on Ubuntu and Debian base images.
Images on DockerHub will be updated periodically.

The following options are available:

Ubuntu:
    FROM corbanr/ansible:xenial
    FROM corbanr/ansible:trusty

Debian:
    FROM corbanr/ansible:jessie

Deprecation:
The following will eventually be depricated in favor of code names.

    FROM corbanr/ansible:ubuntu
    FROM corbanr/ansible:debian
