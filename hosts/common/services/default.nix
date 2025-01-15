{ pkgs, lib, ... }:

{
  imports = [ ./greetd.nix ];

  services = lib.enableAll {
    gvfs = { };
    udisks2 = { };
    flatpak = { };
    printing.drivers = with pkgs; [ postscript-lexmark ]; # Install lexmark drivers for cups
  };
}
