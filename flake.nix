{
  description = "Sk4rd's NixOS & HomeManager Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."laptop" = inputs.nixpkgs.lib.nixosSystem {
        inherit pkgs;
        modules = [
          ./hosts/laptop
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-z13-gen1
        ];
      };

      nixosConfigurations."desktop" = inputs.nixpkgs.lib.nixosSystem {
        inherit pkgs;
        modules = [
          ./hosts/desktop
          inputs.nixos-hardware.nixosModules.common-cpu-amd
          inputs.nixos-hardware.nixosModules.common-gpu-amd
          inputs.nixos-hardware.nixosModules.common-pc-ssd
        ];
      };

      homeConfigurations = {
      };
    };
}
