#!/bin/bash

set -ouex pipefail

#Check for updates to the system and install them 
dnf5 -y update 
dnf5 -y upgrade 

dnf5 -y install distrobox podman

dnf5 -y clean all 

# NOTICE - Kernel installation will be moved to a separate script/Containerfile - as of 08/06/25 - trying this now in build.sh - Note, kernel installation appears to be working
dnf5 -y config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-steam.repo
dnf5 -y config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-rar.repo
dnf5 -y config-manager setopt "*fedora*".exclude="mesa-* kernel-core-* kernel-modules-* kernel-uki-virt-*"
# Add SELinux override to install kernel
setsebool -P domain_kernel_load_modules on
dnf5 -y remove kernel-uki-virt
dnf5 -y copr enable bieszczaders/kernel-cachyos
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos
dnf5 -y copr enable bieszczaders/kernel-cachyos

#Regenerate Kernel Modules (Just in Case)
dracut -f --regenerate-all

#Remove firefox - Users can install their own browser
dnf5 -y remove firefox

# Install steam - code taken from ublue-rolling-images 
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 -y update --refresh

#Install CachyOS optimisations
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y update
dnf5 -y install libcap-ng libcap-ng-devel procps-ng procps-ng-devel
dnf5 -y install cachyos-settings scx-scheds uksmd --allowerasing
systemctl enable uksmd.service
systemctl enable scx.service
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons
dnf5 -y clean all

 #Install Steam Package
dnf5 -y install steam --allowerasing

dnf5 -y copr enable danayer/mesa-git 
dnf5 -y copr enable danayer/linux-firmware-git
dnf5 -y enable danayer/Vulkan-Git
dnf5 -y enable danayer/libdrm-git
dnf5 -y update --refresh -y
dnf5 -y clean all
dnf5 -y copr disable danayer/mesa-git 
dnf5 -y copr disable danayer/linux-firmware-git
dnf5 -y disable danayer/Vulkan-Git
dnf5 -y disable danayer/libdrm-git

#Install icon themes
dnf5 -y install papirus-icon-theme


#### Example for enabling a System Unit File

systemctl enable podman.socket
