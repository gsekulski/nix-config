{
  description = "gsekulski's nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, agenix, ... }:
  let
    identity = import ./lib/identity.nix;
  in {
    darwinConfigurations.ln = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit identity; };
      modules = [
        ./hosts/ln
        agenix.darwinModules.default
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit identity; };
          home-manager.users.${identity.username} = import ./home/darwin;
        }
      ];
    };

    nixosConfigurations.shia = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit identity; };
      modules = [
        ./hosts/shia
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit identity; };
          home-manager.users.${identity.username} = import ./home/linux;
        }
      ];
    };
  };
}
