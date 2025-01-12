{ lib, ... }:

{
  imports = [
    ./gpg-agent.nix
    ./hypridle.nix
  ];

  services = lib.enableAll {
    ssh-agent = { };
    hyprpaper = { };
    syncthing.extraOptions = [ "--no-default-folder" ];
  };
}
