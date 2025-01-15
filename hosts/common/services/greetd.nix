{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -tr --cmd '${pkgs.hyprland}/bin/Hyprland'";
        user = "greeter";
      };
    };
  };
}
