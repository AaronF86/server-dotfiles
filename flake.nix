{
  description = "being a nix configuration for a server";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
}

