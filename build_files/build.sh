#!/bin/bash

set -ouex pipefail

# Branding
echo "Branding started"

# Search for the branding directory in the file system
echo "Searching for branding directory..."
BRANDING_DIR=$(find / -type d -path "*/build_files/branding" 2>/dev/null | head -n 1)

if [ -z "$BRANDING_DIR" ] || [ ! -d "$BRANDING_DIR" ]; then
    echo "Dumping root context layout to help debug:"
    ls -la / || true
    if [ -d /ctx ]; then ls -la /ctx || true; fi
    
    echo "ERROR: build_files/branding directory could not be located anywhere in the file system!"
    exit 1
fi

# Extracting commit hash
IMAGE_TAG=${IMAGE_TAG:-${GITHUB_SHA:-$(git rev-parse --short HEAD 2>/dev/null || echo "latest")}}
SHORT_HASH=$(echo "$IMAGE_TAG" | cut -c1-7)

# Replace placeholders with the actual commit hash
cp "$BRANDING_DIR/os-release" /tmp/os-release.tmp
sed -i "s/COMMIT_HASH/$SHORT_HASH/g" /tmp/os-release.tmp

# Inject custom os-release file into the system
if [ -f /usr/lib/os-release ]; then
    sudo cp /tmp/os-release.tmp /usr/lib/os-release
    ln -sf /usr/lib/os-release /etc/os-release
fi
# Configure GRUB distributor name
if [ -f /etc/default/grub ]; then
    sudo sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR="eduOS"/' /etc/default/grub
fi
# Installing base packages
dnf5 install -y fastfetch
dnf5 install -y chromium
dnf5 install -y kwrite
dnf5 install -y vlc
dnf5 install -y https://github.com/veyon/veyon/releases/download/v4.10.3/veyon-4.10.3.0-fedora.44.x86_64.rpm # Installs Veyon (temp until not available in fedora repos or copr)

systemctl enable podman.socket
