{ profile-picture, ... }:

{
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    settings = {
      bar.launcher.icon = "󱄅";
      menus.dashboard.powermenu.avatar.image = "${profile-picture}";
      theme.bar.menus.menu.dashboard.profile.radius = "12px";
    };
  };
}
