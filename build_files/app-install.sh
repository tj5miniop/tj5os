#!/bin/bash

set -ouex pipefail

flatpak update 

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpaks - Browser
#flatpak install flathub com.brave.Browser
#flatpak install flathub com.vysp3r.ProtonPlus
#flatpak install flathub com.github.tchx84.Flatseal
#flatpak install flathub com.ranfdev.DistroShelf
#flatpak uninstall --unused



 #Install Steam Package
dnf5 -y config-manager addrepo --from-repofile=https://negativo17.org/repos/fedora-steam.repo
dnf5 -y install steam --allowerasing