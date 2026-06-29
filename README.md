# Synapse Workspace

The Synapse Workspace is the primary development environment for **Synapse OS**. It contains the package sources, PKGBUILDs, and project structure used to build the operating system.

This repository is intended for developers and contributors.

## Repository Structure

```text
synapse-workspace/
├── synapse-core/
├── synapse-desktop/
└── synapse-extra/
```

### synapse-core

Contains essential packages required for the base operating system.

Examples include:

* release and branding packages
* system configuration
* base utilities
* core operating system components

### synapse-desktop

Contains desktop environment packages, themes, applications, and user interface components.

### synapse-extra

Contains optional packages that are not required for a minimal Synapse OS installation.

## Building Packages

Each package is maintained as a standard Arch Linux `PKGBUILD`.

To build a package:

```bash
cd <package-directory>
makepkg -si
```

## Repository Workflow

1. Modify or create a package.
2. Build the package using `makepkg`.
3. Copy the generated package into the Synapse package repository.
4. Update the repository database using `repo-add`.
5. Commit and push both the workspace and repository.

## Project Status

Current development stage:

**Genesis (Alpha)**

The project is under active development and package layouts, repository structure, and workflows may evolve.

## License

Each package may define its own license.

Unless otherwise specified, source files in this repository are licensed under the MIT License.
