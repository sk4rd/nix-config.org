# [[file:README.org::*Flake][Flake:1]]
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

      mkHostConfig =
        {
          extraModules ? [ ],
        }:
        host:
        inputs.nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [ ./hosts/${host} ] ++ extraModules;
        };

      mkNixosConfigs =
        configs:
        inputs.nixpkgs.lib.genAttrs (builtins.attrNames configs) (
          name: mkHostConfig { extraModules = configs.${name}.extraModules or [ ]; } name
        );

      mkHomeConfig =
        {
          extraModules ? [ ],
        }:
        user: host:
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/${user}/${host} ] ++ extraModules;
        };

      mkHomeManagerConfigs =
        configs:
        inputs.nixpkgs.lib.genAttrs (builtins.attrNames configs) (
          name:
          let
            parts = builtins.split "@" name;
            user = builtins.elemAt parts 0;
            host = builtins.elemAt parts 2;
          in
          mkHomeConfig {
            extraModules = configs.${name}.extraModules or [ ];
          } user host
        );
    in
    {
      nixosConfigurations = mkNixosConfigs {
        "laptop".extraModules = [ inputs.nixos-hardware.nixosModules.lenovo-thinkpad-z13-gen1 ];
        "desktop".extraModules = [
          inputs.nixos-hardware.nixosModules.common-cpu-amd
          inputs.nixos-hardware.nixosModules.common-gpu-amd
          inputs.nixos-hardware.nixosModules.common-pc-ssd
        ];
        "vm".extraModules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users."miko" = {
              imports = [ ./home/common ];
              home.stateVersion = "24.11";
            };
          }
        ];
      };

      homeConfigurations = mkHomeManagerConfigs {
        "miko@laptop" = { };
        "miko@desktop" = { };
      };
    };
}
# Flake:1 ends here
