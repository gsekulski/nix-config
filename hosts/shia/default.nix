{ config, pkgs, lib, identity, ... }:

{
  imports = [ ./hardware.nix ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "openssl-1.1.1w" ];
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ identity.username ];
  };

  networking.hostName = "shia";

  users.users.${identity.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  system.stateVersion = "25.05";
}
