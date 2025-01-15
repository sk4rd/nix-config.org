{ ... }:

{
  imports = [
    ../common/generic.nix
    ../common/boot.nix
    ../common/users.nix
    ../common/amdgpu.nix
    ../common/networking.nix
    ../common/virtualisation.nix
    ../common/controllers.nix
    ../common/programs
    ../common/services

    ./filesystem.nix
  ];
}
