{ config, lib, pkgs, identity, ... }:

{
  imports = [ ../shared ];
  home.username = "gratian";
  home.homeDirectory = "/Users/gratian";
}
