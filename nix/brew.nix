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
      "xcodegen"
    ];

    # Casks (GUI Applications)
    casks = [
      "zed"
      "steam"
      "signal"
      "iterm2"
      "openmtp"
      "spotify"
      "discord"
      "stremio"
      "affinity"
      "onlyoffice"
      "arduino-ide"
      "claude-code"
      "pearcleaner"
      "wine-stable"
      "transmission"
      "brave-browser"
      "wireshark-app"
      "google-chrome"
      "android-studio"
      "navigraph-charts"
    ];

    # Mac App Store apps
    masApps = {
      "UTM" = 1538878817;
      "Xcode" = 497799835;
      "LanScan" = 472226235;
      "Bitwarden" = 1352778147;
      "Wireguard" = 1451685025;
      "Parallels Client" = 600925318;
      "WhatsApp Messenger" = 310633997;
      "Blackmagic Disk Test" = 425264550;
      "Xiaomi Interconnectivity" = 6673908449;
    };

    # If you want fonts via Brew (optional, since you have them in Nix config too)
    # Note: New naming convention often uses "font-" prefix
    # casks = [ "font-caskaydia-mono-nerd-font" ];
  };
}
