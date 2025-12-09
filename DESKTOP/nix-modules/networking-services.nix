{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; 
  };

  services.openssh.enable = true;
  programs.ssh.startAgent = true;
}
