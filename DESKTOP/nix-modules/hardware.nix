{ config, lib, pkgs, ... }:


{
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true; 
    extraPackages = with pkgs; [
      intel-media-driver   
      intel-compute-runtime 
      vpl-gpu-rt           
    ];
  };

  services.power-profiles-daemon.enable = true; 
  services.thermald.enable = true;
  
  services.fstrim.enable = true; 

  zramSwap = {
    enable = true;
    memoryPercent = 50; 
  };
}
