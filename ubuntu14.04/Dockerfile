# Latest Ubuntu LTS (Trusty 14.04)
FROM ubuntu:latest
MAINTAINER Corban Raun
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
