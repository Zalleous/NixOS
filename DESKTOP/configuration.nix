{ config, lib, pkgs, ... }:

{
  ########## GLOBAL VARIABLE ############
  _module.args.user = "voktex";
  #######################################

  imports = [
    ./hardware-configuration.nix
    ./nix-modules/programs.nix
    ./nix-modules/graphical-env.nix
    ./nix-modules/hardware.nix
    ./nix-modules/networking-services.nix
    ./nix-modules/system-boot.nix
    ./nix-modules/users.nix
    ./nix-modules/virtualization.nix
    ./nix-modules/fonts.nix
    ./nix-modules/env-variable.nix
    ./nix-modules/lazyvim.nix
    ./nix-modules/time.nix
  ];

  ########## NIXOS VERSION ##########
  system.stateVersion = "25.11"; 
  ###################################
}
