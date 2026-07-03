#!/bin/sh
set -e
PKGNAME=synapse-sddm-theme-0.1.0-alpha
tar czf ${PKGNAME}.tar.gz --exclude='.git' --exclude='*.swp' --exclude='assets/fonts/*' .
echo "Created ${PKGNAME}.tar.gz"
