#!/bin/bash

set -ouex pipefail

dnf5 -y install distrobox podman

dnf5 -y clean all 

# Add SELinux override to install kernel
setsebool -P domain_kernel_load_modules on

#Regenerate Kernel Modules (Just in Case)
dracut -f --regenerate-all

#Install CachyOS optimisations
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y update
dnf5 -y install libcap-ng libcap-ng-devel procps-ng procps-ng-devel
dnf5 -y install cachyos-settings scx-scheds uksmd --allowerasing
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons
dnf5 -y clean all

dnf5 -y copr enable danayer/mesa-git 
dnf5 -y copr enable danayer/Vulkan-Git
dnf5 -y copr enable danayer/libdrm-git
dnf5 -y update --refresh -y --allowerasing
dnf5 -y clean all
dnf5 -y copr disable danayer/mesa-git 
dnf5 -y copr disable danayer/Vulkan-Git
dnf5 -y copr disable danayer/libdrm-git

#Install icon themes
dnf5 -y install papirus-icon-theme

#### Example for enabling a System Unit File
systemctl enable podman.socket
