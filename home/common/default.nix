{ username, pkgs, ... }:

{
  imports = [
    ./programs
    ./services
  ];

  # Basic HomeManager config
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin Mocha Dark";
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
    # Do not change this
    stateVersion = "24.11";
  };

  # Let fonts be managed by HomeManager
  fonts.fontconfig.enable = true;

  # Reload services on config switch
  systemd.user.startServices = "sd-switch";

}
