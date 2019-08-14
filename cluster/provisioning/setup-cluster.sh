#!/bin/bash

# Save trace setting
XTRACE=$(set +o | grep xtrace)
set -o xtrace

CLUSTER_ROLE=$1

echo '{"insecure-registries": ["100.100.0.10:30001"],"registry-mirrors": ["https://3w7si8fh.mirror.aliyuncs.com"]}' | sudo tee /etc/docker/daemon.json
sudo groupadd docker
sudo gpasswd -a `whoami` docker
sudo systemctl restart docker

if [[ "${CLUSTER_ROLE}" = "master" ]]; then
    sudo mkdir -p /nfsdata/registry \
      && sudo mkdir -p /nfsdata/jenkins \
      && sudo mkdir -p /nfsdata/sonarqube/postgresql \
      && sudo mkdir -p /nfsdata/sonarqube/data \
      && sudo chmod -R a+rw /nfsdata
    echo "/nfsdata *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee /etc/exports
    sudo systemctl enable nfs-server && sudo systemctl start nfs-server

    sleep 10

    kubectl create -f /vagrant/provisioning/flannel.yaml
    kubectl create -f /vagrant/provisioning/registry.yaml
fi

# Restore xtrace
$XTRACE
