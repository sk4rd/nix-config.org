{
  description = "Sk4rd's NixOS & HomeManager Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHosts =
        systems:
        inputs.nixpkgs.lib.genAttrs (builtins.attrNames systems) (
          name:
          inputs.nixpkgs.lib.nixosSystem {
            inherit pkgs;
            modules = [ ./hosts/${name} ] ++ systems.${name}.extraModules or [ ];
            specialArgs = { hostname = name; }; # Pass hostname to modules
          }
        );

      mkHomes =
        users:
        inputs.nixpkgs.lib.genAttrs (builtins.attrNames users) (
          name:
          let
            parts = builtins.split "@" name;
            username = builtins.elemAt parts 0;
            hostname = builtins.elemAt parts 2;
          in
          inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home/${username}/${hostname} ] ++ users.${name}.extraModules or [ ];
            extraSpecialArgs = { inherit username hostname; }; # Pass username and hostname to modules
          }
        );
    in
    {
      nixosConfigurations = mkHosts {
        "laptop".extraModules = [ inputs.nixos-hardware.nixosModules.lenovo-thinkpad-z13-gen1 ];
        "desktop".extraModules = [
          inputs.nixos-hardware.nixosModules.common-cpu-amd
          inputs.nixos-hardware.nixosModules.common-gpu-amd
          inputs.nixos-hardware.nixosModules.common-pc-ssd
        ];
      };

      homeConfigurations = mkHomes {
        "miko@laptop" = { };
        "miko@desktop" = { };
      };
    };
}
