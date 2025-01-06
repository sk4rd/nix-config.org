# [[file:../../README.org::*Laptop][Laptop:1]]
{ ... }:

{
  imports = [
    ../common/generic.nix
    ../common/boot.nix
    ../common/users.nix
    ../common/shell.nix
    ../common/amdgpu.nix
    ../common/networking.nix
    ../common/bluetooth.nix
    ../common/virtualisation.nix
    ../common/controllers.nix
    ../common/hyprland.nix
    ../common/printing.nix

    ./kernelModules.nix
    ./filesystem.nix
  ];
}
# Laptop:1 ends here
