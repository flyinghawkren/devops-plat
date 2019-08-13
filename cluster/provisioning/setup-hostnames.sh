#!/bin/bash

# Save trace setting
XTRACE=$(set +o | grep xtrace)
set -o xtrace

# ARGS:
# $1: Master IP
# $2: Master hostname
# $3: Minion1 IP
# $4: Minion1 hostname

MASTER_IP=$1
MASTER_HOSTNAME=$2
SLAVE1_IP=$3
SLAVE1_HOSTNAME=$4
SLAVE2_IP=$5
SLAVE2_HOSTNAME=$6

cat << EOF >> /etc/hosts
$MASTER_IP $MASTER_HOSTNAME
$SLAVE1_IP $SLAVE1_HOSTNAME
$SLAVE2_IP $SLAVE2_HOSTNAME
EOF

# Restore xtrace
$XTRACE
