<<<<<<< Updated upstream
# [[file:../../README.org::*Filesystem][Filesystem:1]]
=======
>>>>>>> Stashed changes
{ ... }:

{
  # File system config
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/bc1d0786-cf98-4955-b442-18076c604f58"; # Change this...
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4AB9-DD8D"; # ... and this value according to your disks
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
<<<<<<< Updated upstream
# Filesystem:1 ends here
=======
>>>>>>> Stashed changes
