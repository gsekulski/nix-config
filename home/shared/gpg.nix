{ config, pkgs, lib, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  home.file.".gnupg/gpg-agent.conf" = lib.mkIf pkgs.stdenv.isDarwin {
    text = ''
      pinentry-program /opt/homebrew/bin/pinentry-mac
      default-cache-ttl 3600
      max-cache-ttl 7200
    '';
  };
}
