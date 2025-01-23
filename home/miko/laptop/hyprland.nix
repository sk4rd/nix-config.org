{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [ "eDP-1, 2880x1800@60, 0x0, 2" ];
    binde = [
      ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl s +5%"
      ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 5%-"
    ];
  };
}
