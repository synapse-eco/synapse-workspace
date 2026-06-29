# synapse-release - FILES

This document describes all files included in the `synapse-release` package and their purpose in Synapse OS.

---

## Source Files (src/)

These files are maintained in the repository and installed into the system.

### os-release
- **Installed to:** `/usr/lib/os-release`
- **Also available at:** `/etc/os-release`

Purpose:
Standard Linux operating system identification file.
Used by system tools, package managers, and desktop environments to detect the OS.

---

### synapse-release
- **Installed to:** `/etc/synapse-release`

Purpose:
Human-readable Synapse OS release information.
Used for display, debugging, and system inspection.
Not a standard Linux file (Synapse-specific extension).

---

### issue
- **Installed to:** `/etc/issue`

Purpose:
Local terminal (TTY) login banner displayed before login prompt.

---

### issue.net
- **Installed to:** `/etc/issue.net`

Purpose:
Remote login banner used by SSH and network login services.

---

### synapse-logo.png
- **Installed to:** `/usr/share/pixmaps/synapse-logo.png`

Purpose:
System branding logo used by desktop environments and system tools.

---

## Installation Summary

| Source File | Destination Path |
|-------------|-----------------|
| src/os-release | /usr/lib/os-release |
| src/os-release | /etc/os-release |
| src/synapse-release | /etc/synapse-release |
| src/issue | /etc/issue |
| src/issue.net | /etc/issue.net |
| src/synapse-logo.png | /usr/share/pixmaps/synapse-logo.png |

---

## Notes

- `/usr/lib/os-release` is the primary system identity file in modern Linux.
- `/etc/os-release` exists for compatibility with older tools.
- `/etc/synapse-release` is Synapse-specific and optional for external systems.
- This package does not include system configuration, desktop environments, or applications.

---

## Design Principle

This package strictly follows Linux filesystem standards while adding minimal Synapse-specific extensions where necessary.
