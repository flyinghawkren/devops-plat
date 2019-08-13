#!/bin/bash

# Save trace setting
XTRACE=$(set +o | grep xtrace)
set -o xtrace

# Start kubelet join the cluster
cat /vagrant/kubeadm.log > kubeadm_join.sh
sudo sh kubeadm_join.sh

# Restore xtrace
$XTRACE
