#!/bin/bash

set -ouex pipefail

#Check for updates to the system and install them 
dnf5 -y update 
dnf5 -y upgrade 

dnf5 -y install distrobox podman

dnf5 -y clean all 

# NOTICE - Kernel installation will be moved to a separate script/Containerfile



#### Example for enabling a System Unit File

systemctl enable podman.socket
