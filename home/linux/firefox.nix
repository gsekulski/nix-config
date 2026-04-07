{ config, pkgs, identity, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    profiles.default = {
      id = 0;
      isDefault = true;
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      DisableAccounts = false;
      DisableFirefoxAccounts = false;

      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        Downloads = true;
        FormData = true;
        History = true;
        Sessions = false;
        SiteSettings = false;
        OfflineApps = true;
        Locked = true;
      };

      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      DisablePasswordReveal = true;
      DisableMasterPasswordCreation = true;
      NativeMessagingHosts = [ pkgs.keepassxc ];

      Permissions = {
        Location.BlockNewRequests = true;
        Notifications.BlockNewRequests = true;
        VirtualReality.BlockNewRequests = true;
        Autoplay.BlockNewRequests = true;
      };

      DisplayBookmarksToolbar = "always";
      DontCheckDefaultBrowser = true;
      CaptivePortal = false;
      HardwareAcceleration = true;
      SearchBar = "unified";

      DownloadDirectory = {
        Value = "${config.home.homeDirectory}/Downloads";
        Locked = true;
      };

      Homepage = {
        URL = "https://www.google.com";
        StartPage = "homepage";
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };

      Extensions.Install = [
        "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi"
      ];

      SearchEngines = {
        Default = "Google";
        Remove = [ "Bing" "Amazon.com" "eBay" "Wikipedia (en)" ];
      };

      NoDefaultBookmarks = true;
      Bookmarks = [
        { Title = "GitHub"; URL = "https://github.com/${identity.github}"; Folder = "VCS"; Placement = "toolbar"; }
        { Title = "Codeberg"; URL = "https://codeberg.org/${identity.codeberg}"; Folder = "VCS"; Placement = "toolbar"; }
        { Title = "GitLab"; URL = "https://gitlab.com/${identity.gitlab}"; Folder = "VCS"; Placement = "toolbar"; }
        { Title = "SourceHut"; URL = "https://sr.ht/~${identity.sourcehut}"; Folder = "VCS"; Placement = "toolbar"; }
        { Title = "Project Euler"; URL = "https://projecteuler.net"; Folder = "Challenges"; Placement = "toolbar"; }
        { Title = "Advent of Code"; URL = "https://adventofcode.com"; Folder = "Challenges"; Placement = "toolbar"; }
        { Title = "Codeforces"; URL = "https://codeforces.com"; Folder = "Challenges"; Placement = "toolbar"; }
        { Title = "Szkopuł"; URL = "https://szkopul.edu.pl"; Folder = "Challenges"; Placement = "toolbar"; }
        { Title = "TryHackMe"; URL = "https://tryhackme.com"; Folder = "Security"; Placement = "toolbar"; }
        { Title = "HackTheBox"; URL = "https://hackthebox.com"; Folder = "Security"; Placement = "toolbar"; }
        { Title = "hack.cert.pl"; URL = "https://hack.cert.pl"; Folder = "Security"; Placement = "toolbar"; }
      ];
    };
  };
}
