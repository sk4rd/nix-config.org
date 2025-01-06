# [[file:../../README.org::*Bootloader][Bootloader:1]]
{ ... }:

{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 30;
    };
  };
}
# Bootloader:1 ends here
