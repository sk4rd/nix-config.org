{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Environment variables
      env = [
        "HYPRCURSOR_THEME,Catppuccin Mocha Dark"
        "HYPRCURSOR_SIZE,24"
      ];

      # Autostarted programs
      exec-once = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ];

      # Modifier key set to SUPER
      "$mod" = "SUPER";

      # Keybindings
      bind = [
        # Programs
        "$mod, Q, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, R, exec, ${pkgs.tofi}/bin/tofi-run | bash"
        "$mod, W, exec, ${pkgs.brave}/bin/brave"
        "$mod, F, exec, ${pkgs.nautilus}/bin/nautilus"

        # Screenshot
        "$mod SHIFT, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp -d)\" - | ${pkgs.wl-clipboard}/bin/wl-copy"

        # Lock screen
        "$mod ALT, L, exec, loginctl lock-session"

        # Workspace navigation/window movement
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, grave, togglespecialworkspace, magic"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod SHIFT, grave, movetoworkspace, special:magic"

        # Window navigation/movement

        # VIM binds
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"

        # Arrow binds
        "$mod, Left, movefocus, l"
        "$mod, Right, movefocus, r"
        "$mod, Up, movefocus, u"
        "$mod, Down, movefocus, d"

        "$mod SHIFT, Left, movewindow, l"
        "$mod SHIFT, Right, movewindow, r"
        "$mod SHIFT, Up, movewindow, u"
        "$mod SHIFT, Down, movewindow, d"

        # Window management
        "$mod SHIFT, C, killactive"
        "$mod SHIFT, F, fullscreen"
        "$mod, V, togglefloating,"
        "$mod, RETURN, layoutmsg, swapwithmaster"
      ];

      # Repeatable bindings
      binde = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
      ];

      # Mouse bindings
      bindm = [
        # Window resizing
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Input device configuration
      input = {
        kb_layout = "us,de";
        kb_options = "grp:win_space_toggle"; # Toggle layout with SUPER + Space
        follow_mouse = 1;
        accel_profile = "flat"; # Disable pointer acceleration
      };

      cursor = {
        no_hardware_cursors = true;
      };

      # Settings regarding looks
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 3;
        layout = "master";
        allow_tearing = false;

        "col.inactive_border" = "$base";
        "col.active_border" = "$accent";
      };

      # Settings regarding decoration
      decoration = {
        rounding = 10;

        # Enable blurring of transparent elements
        blur = {
          enabled = true;
          size = 4;
          passes = 1;
          vibrancy = "0.17";
        };
      };

      # Settings regarding animation
      animations = {
        enabled = true;
        # Bezier curve definition
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        # Animation defintions
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Window rules
      windowrule = [
        "float,^(steam)$"
        "float,^(org.kde.polkit-kde-authentication-agent-1)$"
      ];
    };
    extraConfig = ''
      # Submap for window resizing
      bind=ALT, R, submap, resize

      submap=resize

      # Sets repeatable binds for resizing active window
      binde=, h, resizeactive, -20 0
      binde=, l, resizeactive, 20 0
      binde=, k, resizeactive, 0 -20
      binde=, j, resizeactive, 0 20
      bind=, escape, submap, reset

      submap=reset
    '';
  };
}
