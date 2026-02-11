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
    ];

    # Brews (CLI apps)
    brews = [
      "mas"
    ];

    # Casks (GUI Applications)
    casks = [
      "zed"
      "signal"
      "openmtp"
      "wezterm"
      "spotify"
      "discord"
      "stremio"
      "arduino-ide"
      "libreoffice"
      "pearcleaner"
      "proton-mail"
      "wine-stable"
      "wireshark-app"
      "helium-browser"
      "podman-desktop"
    ];

    # Mac App Store apps
    masApps = {
      "UTM" = 1538878817; # Paid app, you need to buy it first
      "Bitwarden" = 1352778147;
      "Wireguard" = 1451685025;
      "Parallels Client" = 600925318;
      "WhatsApp Messenger" = 310633997;
      "Blackmagic Disk Test" = 425264550;
    };

    # If you want fonts via Brew (optional, since you have them in Nix config too)
    # Note: New naming convention often uses "font-" prefix
    # casks = [ "font-caskaydia-mono-nerd-font" ];
  };
}
