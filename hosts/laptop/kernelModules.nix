# [[file:../../README.org::*Kernel Modules][Kernel Modules:1]]
{ ... }:

{
  boot.kernelModules = [ "kvm-amd" ];
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usb_storage"
    "sd_mod"
  ];
}
# Kernel Modules:1 ends here
