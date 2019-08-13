#!/bin/bash

# Save trace setting
XTRACE=$(set +o | grep xtrace)
set -o xtrace

K8S_VERSION=$1
OVERLAY_IP=$2

sudo kubeadm init --kubernetes-version ${K8S_VERSION} \
    --pod-network-cidr=10.244.0.0/16 \
    --apiserver-advertise-address=$OVERLAY_IP \
	--service-cidr=10.96.0.0/24 2>&1 | tee kubeadm.log
sed -n '/^kubeadm join /,$p' kubeadm.log | sudo tee /vagrant/kubeadm.log

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Wait till kube-apiserver is up
while true; do
    kubectl get node $NODE_NAME
    if [ $? -eq 0 ]; then
        break
    fi
    echo "waiting for kube-apiserver to be up"
    sleep 1
done

# Let master run pods too.
kubectl taint nodes --all node-role.kubernetes.io/master-

# Restore xtrace
$XTRACE
