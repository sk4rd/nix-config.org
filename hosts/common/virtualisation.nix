# [[file:../../README.org::*Virtualisation][Virtualisation:1]]
{ pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.ovmf = {
        enable = true;
        packages = with pkgs; [ OVMFFull.fd ];
      };
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
    docker.enable = true;
  };
}
# Virtualisation:1 ends here
