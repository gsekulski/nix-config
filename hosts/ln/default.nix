{ config, pkgs, lib, identity, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ identity.username ];
  };

  environment.systemPackages = with pkgs; [ vim ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    casks = [ "firefox" "keepassxc" "zed" "signal" ];
    brews = [ "pinentry-mac" ];
  };

  system.defaults = {
    alf = {
      globalstate = 1;
      stealthenabled = 1;
      allowsignedenabled = 0;
      allowdownloadsignedenabled = 0;
    };

    loginwindow = {
      GuestEnabled = false;
      DisableConsoleAccess = true;
    };

    screensaver = {
      askForPassword = true;
      askForPasswordDelay = 0;
    };

    screencapture = {
      location = "~/Pictures/Screenshots";
      disable-shadow = true;
    };

    NSGlobalDomain = {
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticWindowAnimationsEnabled = false;
      NSWindowResizeTime = 0.001;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;
      AppleShowScrollBars = "WhenScrolling";
      NSScrollAnimationEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      NSDisableAutomaticTermination = false;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.4;
      show-recents = false;
      tilesize = 48;
      launchanim = false;
      mineffect = "scale";
      expose-animation-duration = 0.1;
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXEnableExtensionChangeWarning = false;
      FXDefaultSearchScope = "SCcf";
      _FXShowPosixPathInTitle = true;
      QuitMenuItem = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    spaces.spans-displays = false;

    menuExtraClock = {
      Show24Hour = true;
      ShowSeconds = false;
    };

    LaunchServices.LSQuarantine = false;

    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.DiskUtility" = {
        DUDebugMenuEnabled = true;
        "advanced-image-options" = true;
      };
      "com.apple.assistant.support" = {
        "Siri Data Sharing Opt-In Status" = 0;
      };
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
  programs.zsh.enable = true;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
