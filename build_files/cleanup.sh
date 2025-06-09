#!/usr/bin/bash

set -eoux pipefail

dnf5 clean all
rm -rf /tmp/* || true

# Clean /var directory while preserving essential files
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;


# Restore and setup directories
mkdir -p /var/tmp
chmod -R 1777 /var/tmp


ostree container commit