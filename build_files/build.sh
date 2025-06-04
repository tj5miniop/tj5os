#!/bin/bash

set -ouex pipefail

#Check for updates to the system and install them 
dnf5 -y update 
dnf5 -y upgrade 

#Add CachyOS kernel COPR repo and replace the Kernel packages (this will break some stuff which I intend to fix after prototyping)
dnf5 -y copr enable bieszczaders/kernel-cachyos
rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos
dnf5 -y copr disable bieszczaders/kernel-cachyos

# Add cachy OS addons (modified instructions from COPR page https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos-addons/)
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y install libcap-ng-devel procps-ng-devel
dnf5 -y install uksmd

dnf5 -y install distrobox podman

dnf5 -y clean all 





#### Example for enabling a System Unit File

systemctl enable podman.socket
