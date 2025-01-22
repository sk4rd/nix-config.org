{ wallpapers, ... }:

let
  wp1 = "${wallpapers}/pixel-art/dark-wizard.png";
in
{
  services.hyprpaper.settings = {
    preload = [
      wp1
    ];
    wallpaper = [
      "eDP-1,${wp1}"
    ];
  };
}
