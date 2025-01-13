{
  description = "Sk4rd's NixOS & HomeManager Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      hyprpanel,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
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
            modules = [ ./hosts/${name} ] ++ systems.${name}.extraModules or [ ];
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
            modules = [ ./home/${username}/${hostname} ] ++ users.${name}.extraModules or [ ];
            extraSpecialArgs = { inherit lib username hostname; }; # Pass username and hostname to modules
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
