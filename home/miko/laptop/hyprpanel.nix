{ ... }:

{
  programs.hyprpanel.settings = {
    theme = {
      osd.scaling = 60;
      tooltip.scaling = 60;
      notification.scaling = 60;
      bar = {
        scaling = 60;
        menus = {
          popover.scaling = 60;
          menu = {
            battery.scaling = 60;
            bluetooth.scaling = 60;
            clock.scaling = 60;
            dashboard.confirmation_scaling = 60;
            dashboard.scaling = 60;
            media.scaling = 60;
            network.scaling = 60;
            notifications.scaling = 60;
            power.scaling = 60;
            volume.scaling = 60;
          };
        };
      };
    };
  };
}
