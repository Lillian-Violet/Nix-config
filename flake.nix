# /etc/nixos/flake.nix
{
  description = "flake for EDI";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    EDI = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          # Pin nixpkgs to the version used to build the system
          nix.registry.nixpkgs.flake = nixpkgs;

          home-manager = {
            useGlobalPkgs = true; # <--------------------------------
            useUserPackages = true;
            users = let
              homeCfg = import ./home.nix;
            in
              {
                root = homeCfg;
                malte = homeCfg;
              };
          };
        }
      ];
    };
  };
}