#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set the version to install (default to 'latest' if not provided)
version="${1:-latest}"

# Install the Octopus CLI
sudo yum install -y epel-release &&
sudo yum install -y curl &&
sudo rpm --import https://apt.octopus.com/public.key &&
sudo sh -c "echo -e '[octopus]\nname=Octopus Deploy\nbaseurl=https://apt.octopus.com/ stable main\ngpgcheck=1\ngpgkey=https://apt.octopus.com/public.key\nenabled=1\nautorefresh=1\ntype=rpm-md' > /etc/yum.repos.d/octopus.repo" &&
sudo yum install -y octopuscli
