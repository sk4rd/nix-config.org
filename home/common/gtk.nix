{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.package = pkgs.magnetic-catppuccin-gtk;
    theme.name = "Catppuccin-GTK-Dark";
    iconTheme.package = pkgs.catppuccin-papirus-folders;
    iconTheme.name = "Papirus-Dark";
  };
}
