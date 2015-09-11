# Latest Debian Stable
FROM debian:8.2
MAINTAINER Corban Raun
COPY ansible_1.9.3-0_all.deb /tmp/

RUN apt-get update && \
    apt-get install --no-install-recommends -y python-support \
    python-jinja2 python-yaml python-paramiko python-httplib2 \
    python-crypto sshpass && \
    dpkg -i /tmp/ansible_1.9.3-0_all.deb && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
