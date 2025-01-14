{ lib, ... }:

{
  services = lib.enableAll {
    power-profiles-daemon = { };
  };
}
