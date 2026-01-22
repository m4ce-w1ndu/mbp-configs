# macOS Hybrid Configuration

![Platform](https://img.shields.io/badge/Platform-macOS-lightgrey?logo=apple&style=flat-square)
![System](https://img.shields.io/badge/System-Nix--Darwin-blue?logo=nixos&style=flat-square)
![Dotfiles](https://img.shields.io/badge/Dotfiles-GNU_Stow-orange?logo=gnu-bash&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

A comprehensive, reproducible environment for macOS 26.

This repository implements a **Hybrid Configuration Strategy**:
1.  **Immutable System Infrastructure:** Managed by **nix-darwin**. This handles the heavy lifting—package installation, system services, daemon management, and macOS defaults (defaults write).
2.  **Mutable User Environment:** Managed by **GNU Stow**. This handles standard dotfiles (`.zshrc`, `.vimrc`, `.config/*`) via symlinks, preserving the flexibility to edit user configs on the fly without rebuilding the system.

## 📂 Repository Structure

```plaintext
~/mbp-configs
├── nix/
│   ├── configuration.nix   # Main system configuration (symlinked to /etc/nix-darwin/)
│   └── brew.nix            # Homebrew Casks & Mac App Store definitions
├── apps/                   # Application specific configs
│   └── wezterm/
├── scripts/                # Bootstrapping, maintenance and custom scripts
└── README.md
