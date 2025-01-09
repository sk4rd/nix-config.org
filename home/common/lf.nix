{ config, pkgs, ... }:

let
   userDirs = config.xdg.userDirs;
in
{
  # LF terminal file manager configuration
  programs.lf = {
    enable = true;
    keybindings = {
      "." = "set hidden!";
      gr = "cd /";
      gh = "cd ${cfg.home.homeDirectory}";
      gdl = "cd ${userDirs.download}";
      gdo = "cd ${userDirs.documents}";
      gp = "cd ${userDirs.pictures}";
      gv = "cd ${userDirs.videos}";
      gm = "cd /run/media/${config.home.username}";
    };
    settings = {
      drawbox = true;
      icons = true;
    };
    extraConfig = ''
      set previewer ${pkgs.ctpv}/bin/ctpv
      set cleaner ${pkgs.ctpv}/bin/ctpvclear
      &${pkgs.ctpv}/bin/ctpv -s $id
      &${pkgs.ctpv}/bin/ctpvquit $id
    '';
  };
