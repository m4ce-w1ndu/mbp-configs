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
      "steam"
      "signal"
      "floorp"
      "openmtp"
      "wezterm"
      "spotify"
      "discord"
      "stremio"
      "affinity"
      "onlyoffice"
      "arduino-ide"
      "pearcleaner"
      "proton-mail"
      "wine-stable"
      "transmission"
      "wireshark-app"
      "google-chrome"
      "navigraph-charts"
    ];

    # Mac App Store apps
    masApps = {
      "UTM" = 1538878817; # Paid app, you need to buy it first
      "LanScan" = 472226235;
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
