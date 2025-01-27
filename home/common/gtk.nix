{ pkgs, ... }:

{
  gtk = {
    enable = true;
    catppuccin.enable = true;
    iconTheme.package = pkgs.catppuccin-papirus-folders;
    iconTheme.name = "Papirus-Dark";
  };
}
