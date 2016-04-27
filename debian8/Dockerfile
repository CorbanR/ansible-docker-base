# Latest Debian Stable (jessie)
FROM debian:jessie
MAINTAINER Corban Raun

RUN apt-get update && \
    apt-get install --no-install-recommends -y python-support \
    python-markupsafe python-ecdsa libyaml-0-2 \
    python-jinja2 python-yaml python-paramiko python-httplib2 \
    python-crypto sshpass wget python-setuptools && \
    wget https://launchpad.net/~ansible/+archive/ubuntu/ansible/+files/ansible_2.0.2.0-1ppa~trusty_all.deb && \
    dpkg -i ansible_2.0.2.0-1ppa~trusty_all.deb && \
    rm -rf ansible* && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
