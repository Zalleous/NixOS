{ config, lib, pkgs, user, ... }:
{
  system.activationScripts.installFishConfig = {
    text = ''
      SOURCE="${../app-configs/fish}"
      TARGET="/home/${user}/.config/fish"

      echo -e "\033[93m ### INIT FISH CONFIG FOR ${user} ### \033[0m"
      
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
