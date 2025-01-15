{ lib, ... }:

{
  imports = [
    ./zsh.nix
    ./gpg-agent.nix
  ];

  programs = lib.enableAll {
    hyprland = { };
    hyprlock = { };
  };
}
