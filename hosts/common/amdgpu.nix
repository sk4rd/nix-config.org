# [[file:../../README.org::*AMDGPU][AMDGPU:1]]
{ ... }:

{
  hardware.amdgpu = {
    opencl.enable = true;
    amdvlk.enable = true;
    amdvlk.support32Bit.enable = true;
  };
}
# AMDGPU:1 ends here
