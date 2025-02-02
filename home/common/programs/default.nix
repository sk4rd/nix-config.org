{ pkgs, lib, ... }:

{
  # Imports of programs with larger configs
  imports = [
    ./emacs.nix
    ./git.nix
    ./hyprland.nix
    ./hyprpanel.nix
    ./kitty.nix
    ./lf.nix
    ./tofi.nix
  ];

  home.packages = with pkgs; [
    bottles
    brave
    file
    libreoffice-qt6-fresh
    orca-slicer
    spotify
    vesktop
  ];

  # Programs with short or simple configs which are automatically enabled
  programs = lib.enableAll {
    home-manager = { }; # Let HomeManager install itself
    bat = { };
    btop = { };
    imv = { };
    mpv = { };
    zathura = { };
    direnv.nix-direnv.enable = true;
    gpg.scdaemonSettings.disable-ccid = true; # Disable the integrated support for CCID compliant readers
    ssh.extraConfig = "IdentityAgent /run/user/1000/gnupg/S.gpg-agent.ssh"; # Use the GPG agent for SSH authentication
  };
}
