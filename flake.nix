{
  description = "Sk4rd's NixOS & HomeManager Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    wallpapers.url = "git+https://codeberg.org/sk4rd/wallpapers.git";
    wallpapers.flake = false;
    profile-picture.url = "https://avatars.githubusercontent.com/u/42469640";
    profile-picture.flake = false;
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      hyprpanel,
      catppuccin,
      wallpapers,
      profile-picture,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            brave = prev.brave.override {
              commandLineArgs = "--ozone-platform=wayland";
            };
          })
        ];
      };

      mkLib = nixpkgs:
        nixpkgs.lib.extend (final: prev: (import ./lib final) // home-manager.lib);
      
      lib = mkLib nixpkgs;

      mkHosts =
        systems:
        nixpkgs.lib.genAttrs (builtins.attrNames systems) (
          name:
          nixpkgs.lib.nixosSystem {
            inherit pkgs;
            modules = [ ./hosts/${name} catppuccin.nixosModules.catppuccin { catppuccin.enable = true; }] ++ systems.${name}.extraModules or [ ];
            specialArgs = { inherit lib; hostname = name; }; # Pass hostname to modules
          }
        );

      mkHomes =
        users:
        nixpkgs.lib.genAttrs (builtins.attrNames users) (
          name:
          let
            parts = builtins.split "@" name;
            username = builtins.elemAt parts 0;
            hostname = builtins.elemAt parts 2;
          in
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                ./home/${username}/${hostname}
                  catppuccin.homeManagerModules.catppuccin
                  {
                    catppuccin.enable = true;
                    catppuccin.cursors.enable = true;
                    catppuccin.cursors.accent = "dark";
                    catppuccin.gtk.gnomeShellTheme = true;
                  }
              ] ++ users.${name}.extraModules or [ ];
              extraSpecialArgs = {
                inherit
                  lib
                  username
                  hostname
                  wallpapers
                  profile-picture
                ;
              }; # Pass username and hostname to modules
            }
        );
    in
    {
      nixosConfigurations = mkHosts {
        "laptop".extraModules = [ nixos-hardware.nixosModules.lenovo-thinkpad-z13-gen1 ];
        "desktop".extraModules = [
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-pc-ssd
        ];
      };

      homeConfigurations = mkHomes {
        "miko@laptop".extraModules = [ hyprpanel.homeManagerModules.hyprpanel ];
        "miko@desktop".extraModules = [ hyprpanel.homeManagerModules.hyprpanel ];
      };
    };
}
