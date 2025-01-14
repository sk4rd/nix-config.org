{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      # Define monitor settings and layout
      monitor = [
        "DP-1, 2560x1440@165, 1920x0, 1"
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
      ];

      # Bind workspaces to specific monitors
      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
      ];

      # Drawing tablet monitor binding
      input = {
        tablet.output = "DP-1";
      };
    };
  };
}
