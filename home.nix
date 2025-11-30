{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    foot
    fuzzel
    waybar
    
    firefox
    qutebrowser
    
    swayfx 
  ];

  programs.fish = {
    enable = true;
    init = ''
      if status is-login
        if test -z "$DISPLAY" -a -z "$WAYLAND_DISPLAY"
          exec swayfx
        end
      end
    '';
  };
  
  programs.neovim.enable = true;

  programs.sway = {
    enable = true;
    config = {
      terminal = "foot";
      keybindings = {
        "Mod4+Return" = "exec foot";
        "Mod4+Shift+c" = "kill";
        "Mod4+d" = "exec fuzzel";
      };
    };
  };
  
  home.stateVersion = "24.05";
}
