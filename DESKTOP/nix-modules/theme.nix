{ config, lib, pkgs, ... }:

{
  options = {
    customTheme = lib.mkOption {
      type = lib.types.enum [ "tokyo-night" "gruvbox" ];
      default = "tokyo-night";
      description = "Color theme for the desktop environment";
    };
  };

  config = {
    # Theme is now configurable and can be changed in configuration.nix
    # by setting: customTheme = "gruvbox"; or customTheme = "tokyo-night";
  };
}
