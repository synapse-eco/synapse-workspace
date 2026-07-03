# Synapse Genesis SDDM Theme

Synapse Genesis is a modern, glassmorphic SDDM theme designed for Synapse OS.

## Overview
- Design: Glassmorphism, calm, premium
- Framework: Qt Quick (QML)
- Target: SDDM greeter

## Project
- Name: Synapse Genesis SDDM Theme
- Part of: Synapse OS (synapse-core)
- Version: 0.1.0-alpha (Genesis)
- Maintainer: Aromal J
- Website: https://github.com/synapse-eco/

## Structure
See the `components/` folder for reusable UI atoms and `assets/` for placeholders.

## Local install (developer)
Copy the folder to `/usr/share/sddm/themes/Synapse` and restart SDDM.

```bash
sudo cp -r . /usr/share/sddm/themes/Synapse
sudo systemctl restart sddm
```

Note: restarting SDDM ends the current graphical session.

## Packaging
Run `./package.sh` to create `synapse-sddm-theme.tar.gz`.

## Development notes
- Toggle particle effects in `Background.qml` by setting `enableParticles`.
- Replace placeholder assets in `assets/` and `wallpapers/` with final imagery.
- Use `components/Theme.qml` to adjust design tokens.

