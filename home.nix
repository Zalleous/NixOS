{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    foot
    fuzzel
    waybar
    
    firefox
    qutebrowser
  ];

  programs.fish.enable = true;
  programs.neovim.enable = true;

  programs.swayfx = {
    services.run.sway.enable = true;
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
