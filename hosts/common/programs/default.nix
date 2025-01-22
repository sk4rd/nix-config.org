{ pkgs, lib, ... }:

{
  imports = [
    ./zsh.nix
    ./gpg-agent.nix
  ];

  environment.systemPackages = with pkgs; [
    unzip
  ];

  programs = lib.enableAll {
    hyprland = { };
    hyprlock = { };
  };
}
