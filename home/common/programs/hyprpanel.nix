{ profile-picture, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
    settings = {
      bar.launcher.icon = "󱄅";

      menus.dashboard.shortcuts.left = {
        shortcut1 = {
          icon = "󰖟";
          tooltip = "Brave Browser";
          command = "${pkgs.brave}/bin/brave";
        };
        shortcut2.command = "${pkgs.spotify}/bin/spotify";
        shortcut3.command = "${pkgs.vesktop}/bin/vesktop";
        shortcut4.command = "${pkgs.tofi}/bin/tofi-run";
      };

      theme.bar.menus.menu.dashboard.profile.radius = "12px";
    };
  };
}
