{ config, pkgs, lib, ... }:

{
  programs.keepassxc = {
    enable = true;
    settings = {
      browserIntegration.firefox = true;
      General = {
        ConfigVersion = "2";
        MinimizeAfterUnlock = true;
        RememberLastDatabases = true;
        UseAtomicSaves = true;
      };
      Browser = {
        Enabled = true;
        SearchInAllDatabases = true;
      };
      FdoSecrets = lib.mkIf pkgs.stdenv.isLinux {
        Enabled = true;
      };
      GUI = {
        AdvancedSettings = true;
        ApplicationTheme = "dark";
        CompactMode = true;
        DisableAnimations = true;
        HidePasswords = true;
      };
      Security = {
        ClearClipboardTimeout = 30;
        IconDownloadFallback = true;
        LockDatabaseIdle = true;
        LockDatabaseIdleSeconds = 3600;
        LockDatabaseOnSleep = true;
        LockDatabaseOnSessionLock = true;
      };
      SSHAgent = {
        Enabled = false;
      };
    }; 
  };
}