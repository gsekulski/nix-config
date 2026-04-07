{ config, lib, pkgs, identity, ... }:

{
  imports = [ ../shared ];
  home.homeDirectory = "/Users/${identity.username}";
}
