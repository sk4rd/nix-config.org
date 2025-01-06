# [[file:../../README.org::*Bluetooth][Bluetooth:1]]
{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      ControllerMode = "dual";
      FastConnectable = true;
      Experimental = true;
    };
  };
}
# Bluetooth:1 ends here
