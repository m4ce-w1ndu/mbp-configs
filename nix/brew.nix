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

    # Brews (CLI apps)
    brews = [
      "mas"
    ];

    # Casks (GUI Applications)
    casks = [
      "zed"
      "orion"
      "signal"
      "wezterm"
      "pearcleaner"
      "proton-mail"
      "antigravity"
      "google-chrome"
      "podman-desktop"
    ];

    # Mac App Store apps
    masApps = {
      "UTM" = 1538878817; # Paid app, you need to buy it first
      "Bitwarden" = 1352778147;
      "Wireguard" = 1451685025;
    };

    # If you want fonts via Brew (optional, since you have them in Nix config too)
    # Note: New naming convention often uses "font-" prefix
    # casks = [ "font-caskaydia-mono-nerd-font" ];
  };
}
