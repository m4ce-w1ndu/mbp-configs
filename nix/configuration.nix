{ config, pkgs, ... }:

{
  # Define user account for Homebrew ownership
  users.users.quark = {
    name = "quark";
    home = "/Users/quark";
  };

  system.primaryUser = "quark";

  # Import the separate Brew configuration
  imports = [
    ./brew.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = [
    # --- CLI Tools ---
    pkgs.wget
    pkgs.nmap
    pkgs.tree
    pkgs.yt-dlp
    pkgs.usbutils
    pkgs.fastfetch
    pkgs.nix-search-cli

    # --- Editors (CLI) ---
    pkgs.vim

    # --- Dev Tools & Languages ---
    pkgs.php
    pkgs.nil
    pkgs.nixd
    pkgs.nodejs_latest
    pkgs.android-tools
    pkgs.rustup
    pkgs.sqlite
    pkgs.mariadb
    pkgs.ninja
    pkgs.cmake
    pkgs.google-cloud-sdk
    pkgs.cmake-language-server
    pkgs.javaPackages.compiler.openjdk25

    # --- Heavy Lifting ---
    pkgs.texliveFull

    # --- Containers (CLI only) ---
    pkgs.kubectl
    pkgs.podman
    pkgs.podman-compose

    # --- AI Tools ---
    pkgs.ollama

    # --- Custom Scripts ---
    (pkgs.writeShellScriptBin "ollama-manager" (builtins.readFile ../scripts/nix-ollama-manager.sh))
  ];

  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.caskaydia-mono
  ];

  # Shell & System
  programs.zsh.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  system.stateVersion = 6;
}
