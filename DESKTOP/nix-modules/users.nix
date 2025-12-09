{ config, lib, pkgs, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ 
      "wheel"   
      "video"  
      "render" 
      "docker"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };
}
