#!/bin/bash

set -ouex pipefail
# Installing base packages
dnf5 install -y fastfetch
dnf5 install -y chromium
dnf5 install -y kwrite
dnf5 install -y vlc
dnf5 install -y https://github.com/veyon/veyon/releases/download/v4.10.3/veyon-4.10.3.0-fedora.44.x86_64.rpm # Installs Veyon (temp until not available in fedora repos or copr)

systemctl enable podman.socket
