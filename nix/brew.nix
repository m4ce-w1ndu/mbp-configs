{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap"; 
    };

    taps = [
      # "koekeishiya/formulae" # Uncomment if you use yabai/skhd later
    ];

    # Casks (GUI Applications)
    casks = [
      "google-chrome"
      "proton-mail"
      "podman-desktop"
      "zed" 
      "wezterm"
      "antigravity"
    ];

    # If you want fonts via Brew (optional, since you have them in Nix config too)
    # Note: New naming convention often uses "font-" prefix
    # casks = [ "font-caskaydia-mono-nerd-font" ];
  };
}
