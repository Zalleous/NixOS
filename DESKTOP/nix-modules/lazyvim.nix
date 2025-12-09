{ config, lib, pkgs, user, ... }:

{
  system.activationScripts.installLazyVim = {
    text = ''
      SOURCE="${../app-configs/nvim}"
      TARGET="/home/${user}/.config/nvim"

      echo -e "\033[93m ### INIT LAZY VIM FOR ${user}  ### \033[0m"
      mkdir -p /home/${user}/.config
      rm -R /home/${user}/.config/nvim
      cp -rL "$SOURCE" "$TARGET"
      chown -R ${user}:users "$TARGET"
      chmod -R u+w "$TARGET"
    '';
  };
}
