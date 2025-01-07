# [[file:../../README.org::*Kitty][Kitty:1]]
{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "IBMPlexMono" ]; });
      name = "BlexMono Nerd Font";
      size = 10;
    };

    settings = {
      enable_audio_bell = false;
      window_margin_width = 8;
    };

    extraConfig = ''
      background_opacity 0.85
    '';
  };
}
# kitty:1 ends here
