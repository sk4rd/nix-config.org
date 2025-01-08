{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -tr --cmd '${pkgs.hyprland}/bin/Hyprland'";
        user = "greeter";
      };
    };
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    extraConfig.pipewire."10-clock-rate" = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.clock.allowed.rates" = [
          192000
          96000
          48000
          44100
        ];
      };
    };
  };
}
