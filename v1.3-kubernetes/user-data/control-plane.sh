#!/bin/bash
set -e

# Basic OS update
apt-get update -y
apt-get upgrade -y

# Install basic tools (useful for ops/debugging)
apt-get install -y \
  curl \
  wget \
  ca-certificates \
  gnupg \
  lsb-release \
  jq

# Enable required kernel modules (for later Kubernetes use)
modprobe br_netfilter

cat <<EOF >/etc/sysctl.d/99-kubernetes.conf
net.bridge.bridge-nf-call-iptables=1
net.ipv4.ip_forward=1
net.bridge.bridge-nf-call-ip6tables=1
EOF

sysctl --system
