# Latest Debian Stable
FROM debian:8.2
MAINTAINER Corban Raun

RUN apt-get update && \
    apt-get install --no-install-recommends -y python-support \
    python-markupsafe python-ecdsa libyaml-0-2 \
    python-jinja2 python-yaml python-paramiko python-httplib2 \
    python-crypto sshpass wget && \
    wget https://launchpad.net/~ansible/+archive/ubuntu/ansible/+files/ansible_1.9.3-1ppa~trusty_all.deb && \
    dpkg -i ansible_1.9.3-1ppa~trusty_all.deb && \
    rm -rf ansible* && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
