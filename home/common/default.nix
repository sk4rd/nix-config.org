{ username, ... }:

{
  imports = [
    ./emacs.nix
    ./kitty.nix
    ./hyprland.nix
  ];

  # Basic HomeManager config
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    # Do not change this
    stateVersion = "24.11";
  };

  # Let HomeManager install itself
  programs.home-manager.enable = true;

  # Let fonts be managed by HomeManager
  fonts.fontconfig.enable = true;

  # Reload services on config switch
  systemd.user.startServices = "sd-switch";

}
