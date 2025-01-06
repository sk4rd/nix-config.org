# [[file:../../README.org::*Generic][Generic:1]]
{ pkgs, ... }:

{
  # Set the time zone
  time.timeZone = "Europe/Berlin";

  # Enable experimental nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Change font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
    };
    fontDir.enable = true;
  };

  # Do not change this after building your system
  system.stateVersion = "24.11";
}
# Generic:1 ends here
