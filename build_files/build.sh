#!/bin/bash

set -ouex pipefail
SCRIPTS_DIR="/ctx/scripts"
# Branding
    echo "Branding started"

    BRANDING_DIR="/ctx/branding/"

    # Generate the Build Timestamp
    BUILD_VERSION=$(date -u +%Y%m%d%H%M)
    echo "Generated Build Version Timestamp: $BUILD_VERSION"

    # Replace placeholders with the timestamp
    cp "$BRANDING_DIR/os-release" /tmp/os-release.tmp
    sed -i "s/COMMIT_HASH/$BUILD_VERSION/g" /tmp/os-release.tmp

    # Inject custom os-release file into the system
    if [ -f /usr/lib/os-release ]; then
        sudo cp /tmp/os-release.tmp /usr/lib/os-release
        ln -sf /usr/lib/os-release /etc/os-release
    fi
    # Configure GRUB distributor name
    if [ -f /etc/default/grub ]; then
        sudo sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR="eduOS"/' /etc/default/grub
    fi
    echo "Branding Finished"
# Installing base packages
    dnf5 clean all # hopefully this fixes the build fail
    dnf5 install -y fastfetch
    dnf5 install -y chromium
    dnf5 install -y kwrite
    dnf5 install -y vlc
    dnf5 install -y https://github.com/veyon/veyon/releases/download/v4.10.3/veyon-4.10.3.0-fedora.44.x86_64.rpm # Installs Veyon (temp until not available in fedora repos or copr)
    
# Disabling Veyon
    systemctl disable veyon.service
    rm /usr/share/applications/veyon-master.desktop
    rm /usr/share/applications/veyon-configurator.desktop

# Automatic updates for user flatpaks
    mkdir -p /etc/skel/.config/systemd/user/default.target.wants
    cp "$SCRIPTS_DIR/autoupdate/user-flatpak-update.service" /etc/skel/.config/systemd/user/
    cp "$SCRIPTS_DIR/autoupdate/user-flatpak-update.timer" /etc/skel/.config/systemd/user/
    ln -s ../user-flatpak-update.timer \
        /etc/skel/.config/systemd/user/default.target.wants/user-flatpak-update.timer