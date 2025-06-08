#!/bin/bash

set -ouex pipefail

#Check for updates to the system and install them 
dnf5 -y update 
dnf5 -y upgrade 

dnf5 -y install distrobox podman

dnf5 -y clean all 

# NOTICE - Kernel installation will be moved to a separate script/Containerfile - as of 08/06/25 - trying this now in build.sh
dnf5 -y config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-steam.repo
dnf5 -y config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-rar.repo
dnf5 -y config-manager setopt "*fedora*".exclude="mesa-* kernel-core-* kernel-modules-* kernel-uki-virt-*"
# Add SELinux override to install kernel
setsebool -P domain_kernel_load_modules on
sudo dnf5 -y remove kernel-uki-virt
dnf5 -y copr enable bieszczaders/kernel-cachyos
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos
dnf5 -y copr enable bieszczaders/kernel-cachyos

#Regenerate Kernel Modules (Just in Case)
dracut -f --regenerate-all


# Install Browser 
dnf5 -y install dnf-plugins-core

dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

dnf5 -y install brave-browser

#Remove firefox 
dnf5 -y remove firefox --allowerasing 

# Install steam - code taken from ublue-rolling-images 
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 -y update --refresh

#Install CachyOS optimisations
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y update
dnf5 -y install libcap-ng libcap-ng-devel procps-ng procps-ng-devel
dnf5 -y install cachyos-settings ananicy-cpp uksmd --allowerasing
systemctl enable uksmd.service
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons
dnf5 -y clean all

 #Install Steam Package
dnf5 -y install steam --allowerasing





#### Example for enabling a System Unit File

systemctl enable podman.socket
