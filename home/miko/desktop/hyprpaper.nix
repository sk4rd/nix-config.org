{ wallpapers, ... }:

let
  wp1 = "${wallpapers}/pixel-art/dark-wizard.png";
  wp2 = "${wallpapers}/pixel-art/dark-wizard-library.png";
in
{
  services.hyprpaper.settings = {
    preload = [
      wp1
      wp2
    ];
    wallpaper = [
      "DP-1,${wp1}"
      "HDMI-A-1,${wp2}"
    ];
  };
}
