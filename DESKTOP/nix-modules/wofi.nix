{ config, lib, pkgs, user, ... }:
{
  system.activationScripts.installWofiConfig = {
    text = ''
      SOURCE="${../app-configs/wofi}"
      TARGET="/home/${user}/.config/wofi"

      echo -e "\033[93m ### INIT WOFI CONFIG FOR ${user} ### \033[0m"
      
      mkdir -p /home/${user}/.config

      if [ -d "$TARGET" ]; then
        BACKUP="$TARGET.backup.$(date +%s)"
        mv "$TARGET" "$BACKUP"
        echo -e "\033[90mBacked up existing config to $BACKUP\033[0m"
      fi

      cp -rL "$SOURCE" "$TARGET"
      chown -R ${user}:users "$TARGET"
      chmod -R u+w "$TARGET"
    '';
  };
}
