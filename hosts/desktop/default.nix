# [[file:../../README.org::*Desktop][Desktop:1]]
{ ... }:

{
  imports = [
    ../common/generic.nix
    ../common/boot.nix
    ../common/users.nix
    ../common/shell.nix
    ../common/amdgpu.nix
    ../common/networking.nix
    ../common/virtualisation.nix
    ../common/controllers.nix
    ../common/hyprland.nix
    ../common/printing.nix

    ./filesystem.nix
  ];
}
# Desktop:1 ends here
