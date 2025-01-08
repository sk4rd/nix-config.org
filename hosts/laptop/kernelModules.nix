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
