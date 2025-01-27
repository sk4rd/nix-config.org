{ pkgs, lib, ... }:

{
  imports = [
    ./zsh.nix
    ./gpg-agent.nix
  ];

  environment.systemPackages = with pkgs; [
    fd
    fzf
    htop
    lsof
    ncdu
    nmap
    p7zip
    pulsemixer
    ripgrep
    screen
    unzip
    wget
    wl-clipboard
  ];

  programs = lib.enableAll {
    hyprland = { };
    hyprlock = { };
    xfconf = { };
    thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
