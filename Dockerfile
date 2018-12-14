FROM ubuntu:bionic

LABEL version="1.0"
LABEL maintainer="Guillaume Mazoyer"
LABEL description="Ubuntu 18.04 container for Ansible role testing"

ENV DEBIAN_FRONTEND noninteractive

# Install requirements
RUN apt-get update && \
    apt-get install -y software-properties-common systemd && \
    apt-get clean

# Install Ansible
RUN add-apt-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get clean

# Ansible inventory file
RUN mkdir -p /etc/ansible/roles \
    && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
