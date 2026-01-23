# macOS Hybrid Configuration

![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey?logo=apple&style=flat-square)
![System](https://img.shields.io/badge/System-Nix--Darwin-blue?logo=nixos&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

A comprehensive, reproducible environment for macOS.

This repository implements a **Hybrid Configuration Strategy**:
1.  **Immutable System Infrastructure:** Managed by **nix-darwin**. This handles the heavy lifting—package installation, system services, daemon management, and macOS defaults.
2.  **Mutable User Environment:** Managed by a custom bootstrap script. This handles standard dotfiles (`wezterm`, `nvim`, etc.) via symlinks, preserving the flexibility to edit user configs on the fly without rebuilding the system.

## 📂 Repository Structure

```plaintext
~/Projects/mbp-configs
├── install.sh              # Master bootstrap script
├── apps/                   # User-space configuration files
│   ├── fastfetch/
│   │   └── config.jsonc
│   └── wezterm/
│       └── wezterm.lua
├── nix/                    # System-space configuration files
│   ├── configuration.nix
│   └── brew.nix
└── scripts/
    └── nix-ollama-manager.sh
