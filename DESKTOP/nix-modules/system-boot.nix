{ config, lib, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  boot.kernelParams = [
    "i915.enable_guc=3" 
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 10; 
    "dev.i915.perf_stream_paranoid" = 0;
  };
}
