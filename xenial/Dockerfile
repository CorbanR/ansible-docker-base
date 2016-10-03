FROM ubuntu:xenial
MAINTAINER Corban Raun

RUN apt update && \
    apt install --no-install-recommends -y python-minimal software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt update && \
    apt install -y ansible \
    python-markupsafe python-ecdsa libyaml-0-2 \
    python-jinja2 python-yaml python-paramiko python-httplib2 \
    python-crypto sshpass && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
