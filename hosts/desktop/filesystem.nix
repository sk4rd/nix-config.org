{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9b6dbfed-23fb-4c32-a1e8-228a6aa469d9";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/FDBB-D189";
    fsType = "vfat";
  };

  swapDevices = [
    {
      device = "/.swapfile";
      size = 32 * 1024;
    }
  ];
}
