{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/776417cb-937b-45bc-b6e0-026615e9da40";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C4FA-A3EF";
    fsType = "vfat";
  };

  swapDevices = [
    {
      device = "/.swapfile";
      size = 32 * 1024;
    }
  ];
}
