{ pkgs, lib, ... }:

{
  imports = [
    ./plasma.nix
  ];

  services = lib.enableAll {
    gvfs = { };
    udisks2 = { };
    flatpak = { };
    upower = { };
    tumbler = { };
    printing.drivers = with pkgs; [ postscript-lexmark ]; # Install lexmark drivers for cups
  };
}
