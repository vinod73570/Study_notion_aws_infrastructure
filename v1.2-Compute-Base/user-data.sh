#!/bin/bash
set -e

# Basic OS update
apt-get update -y
apt-get upgrade -y

# Install basic tools (useful later)
apt-get install -y curl unzip
