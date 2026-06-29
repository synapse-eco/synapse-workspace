# synapse-release

## Overview
`synapse-release` is the core identity package for Synapse OS.

It defines operating system identification, login banners, and branding assets in a way that is fully compatible with standard Linux conventions.

This package is required for correct system identification by tools such as:
- systemd
- desktop environments
- package managers
- login shells
- system utilities

---

## Repository Structure
.
├── docs
│ └── FILES.md
├── LICENSE
├── PKGBUILD
├── README.md
├── root
└── src
├── issue
├── issue.net
├── os-release
├── synapse-logo.png
└── synapse-release


---

## Purpose

This package provides Synapse OS identity and branding components while strictly following Linux filesystem standards.

It ensures Synapse OS is correctly recognized as an Arch-based system while maintaining its own distinct identity.

---

## Installation Mapping

When installed, this package places files in the following standard locations:

### System identity

- `src/os-release` → `/usr/lib/os-release`  
  Primary operating system identification file used by Linux tools.

- `/usr/lib/os-release` → `/etc/os-release` (copied or symlinked)  
  Compatibility location for legacy and user-space tools.

---

### Login banners

- `src/issue` → `/etc/issue`  
  Local terminal (TTY) login banner.

- `src/issue.net` → `/etc/issue.net`  
  Remote login banner (SSH and network services).

---

### Synapse-specific identity (extension)

- `src/synapse-release` → `/etc/synapse-release`  
  Human-readable Synapse OS release information (non-standard extension).

---

### Branding assets

- `src/synapse-logo.png` → `/usr/share/pixmaps/synapse-logo.png`  
  System logo used by desktop environments and system tools.

---

## Version Information

- Version: 0.1.0-alpha
- Codename: Genesis
- Release Type: Rolling (Development build)

---

## Design Principles

This package follows these rules:

### 1. Linux compatibility first
All standard files follow official Linux filesystem hierarchy conventions.

### 2. No replacement of system standards
This package does not redefine or break existing Linux identity mechanisms.

### 3. Extension only where necessary
Custom Synapse identity is added via `/etc/synapse-release` without affecting standard behavior.

---

## Scope

### Included
- OS identity files
- Login banners
- Branding assets
- Synapse-specific release metadata

### Excluded
- Kernel
- Package manager configuration
- Desktop environments
- Themes
- Applications

---

## Notes

- `/usr/lib/os-release` is the authoritative system identity file in modern Linux.
- `/etc/os-release` is maintained for compatibility.
- This package is minimal, core, and required for system identification.
