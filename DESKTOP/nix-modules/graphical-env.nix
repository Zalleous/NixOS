{ config, lib, pkgs, ... }:

{
  programs.sway.enable = true;
  programs.waybar.enable = true;
  
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-wlr 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };

  # Ly Display Manager
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      clock = "%c";
      hide_borders = false;
      vi_mode = false;
    };
  };
}
