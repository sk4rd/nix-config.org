{ config, pkgs, ... }:

let
  username = "miko"; # Change this value to your own
  description = "Mikolaj Bajtkiewicz"; # Usually set to your name
in
{
  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    inherit description;
    isNormalUser = true;
    useDefaultShell = true;
    extraGroups = [
      "wheel"
      "dialout"
      (if config.networking.networkmanager.enable then "networkmanager" else "")
      (if config.virtualisation.docker.enable then "docker" else "")
    ];
  };

  # Give the user the password 'test' in a vm
  virtualisation.vmVariant = {
    users.users.${username}.password = "test";
  };
}
