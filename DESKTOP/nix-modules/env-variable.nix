{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";    
    LIBVA_DRIVER_NAME = "iHD";  
    EDITOR = "nvim";
  };

  environment.etc."sway/config".source = ../app-configs/sway/config;
  environment.etc."xdg/fish/config.fish".source = ../app-configs/fish/config.fish;
  environment.etc."xdg/kitty/kitty.conf".source = ../app-configs/kitty/kitty.conf;
  environment.etc."xdg/waybar/config.jsonc".source = ../app-configs/waybar/config.jsonc;
  environment.etc."xdg/waybar/style.css".source = ../app-configs/waybar/style.css;
}
