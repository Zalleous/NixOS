{ config, lib, pkgs, ... }:

let
  themePath = ../app-configs/themes/${config.customTheme};
in
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "iHD";
    EDITOR = "nvim";
  };

  # Theme-aware configuration files
  environment.etc."sway/config".source = "${themePath}/sway/config";
  environment.etc."wofi/config".source = "${themePath}/wofi/config";
  environment.etc."xdg/wofi/style.css".source = "${themePath}/wofi/style.css";
  environment.etc."xdg/kitty/kitty.conf".source = "${themePath}/kitty/kitty.conf";
  environment.etc."xdg/waybar/config.jsonc".source = "${themePath}/waybar/config.jsonc";
  environment.etc."xdg/waybar/style.css".source = "${themePath}/waybar/style.css";

  # Non-themed configuration files
  environment.etc."xdg/fish/config.fish".source = ../app-configs/fish/config.fish;
}
