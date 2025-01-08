{ ... }:

{
  hardware.amdgpu = {
    opencl.enable = true;
    amdvlk.enable = true;
    amdvlk.support32Bit.enable = true;
  };
}
