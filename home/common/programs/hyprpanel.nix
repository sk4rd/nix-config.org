{ ... }:

{
  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
  };
}
