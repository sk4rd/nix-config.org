# [[file:../../README.org::*Test VM][Test VM:1]]
{ ... }:

{
  imports = [
    ../common/generic.nix
    ../common/boot.nix
    ../common/users.nix
    ../common/shell.nix
    ../common/networking.nix
    ../common/hyprland.nix
    ../common/printing.nix
  ];
  
  virtualisation.vmVariant = {
    virtualisation = {
      cores = 4;
      memorySize = 8192;
      qemu.options = [ "-vga qxl" ];
    };

    users.users."miko".initialPassword = "test";
  };
}
# Test VM:1 ends here
