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

  # Ly Display Manager with Tokyo Night theme
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      clock = "%c";
      hide_borders = false;
      vi_mode = false;
    };
  };

  # Tokyo Night color configuration for Ly
  # Sets TTY colors before Ly starts
  systemd.services.display-manager.serviceConfig.ExecStartPre = [
    "${pkgs.coreutils}/bin/printf '%%b' '\\e]P01a1b26\\e]P7c0caf5\\e]P1f7768e\\e]P29ece6a\\e]P3e0af68\\e]P47aa2f7\\e]P5bb9af7\\e]P67dcfff\\e]P8414868\\ec'"
  ];

  # Ly config file with Tokyo Night theme
  environment.etc."ly/config.ini".text = ''
    animation = matrix
    clock = %c
    hide_borders = false
    vi_mode = false

    # Tokyo Night colors (set via TTY escape codes)
    # Background: #1a1b26, Foreground: #c0caf5
    fg = 7
    bg = 0

    # Reset command to maintain colors
    term_reset_cmd = ${pkgs.ncurses}/bin/tput reset; ${pkgs.coreutils}/bin/printf '%%b' '\\e]P01a1b26\\e]P7c0caf5\\e]P1f7768e\\e]P29ece6a\\e]P3e0af68\\e]P47aa2f7\\e]P5bb9af7\\e]P67dcfff\\e]P8414868\\ec'
  '';
}
