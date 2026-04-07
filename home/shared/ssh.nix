{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
      };
      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
      };
      "sr.ht" = {
        hostname = "git.sr.ht";
        user = "git";
        identitiesOnly = true;
      };
      "codeberg.org" = {
        hostname = "codeberg.org";
        user = "git";
      };
    };
  };

  services.ssh-agent.enable = lib.mkIf pkgs.stdenv.isLinux true;
}
