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
sudo dnf remove kernel* 
dnf5 -y copr enable bieszczaders/kernel-cachyos
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos
dnf5 -y copr enable bieszczaders/kernel-cachyos
dracut -f --regenerate-all



#### Example for enabling a System Unit File

systemctl enable podman.socket
