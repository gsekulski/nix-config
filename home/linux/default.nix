{ config, lib, pkgs, identity, ... }:

{
  imports = [
    ../shared
    ./firefox.nix
    ./keepassxc.nix
  ];

  home.homeDirectory = "/home/${identity.username}";

  home.packages = with pkgs; [
    inetutils
    libreoffice
    man
    signal-desktop
    thunderbird
  ];
}
