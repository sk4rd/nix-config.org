{ user, ... }:

{
  # Basic HomeManager config
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    # Do not change this
    home.stateVersion = "24.11";
  };

  # Let HomeManager install itself
  programs.home-manager.enable = true;

  # Let fonts be managed by HomeManager
  fonts.fontconfig.enable = true;

  # Reload services on config switch
  systemd.user.startServices = "sd-switch";
}
