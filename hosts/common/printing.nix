# [[file:../../README.org::*Printing][Printing:1]]
{ pkgs, ... }:

{
  # Cupsd configuration for printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ postscript-lexmark ];
  };
}
# Printing:1 ends here
