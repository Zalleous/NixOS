{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    docker-compose
    git
    php
  ];

  shellHook = ''
    clear
    echo -e "\033[91m ENV BACKEND ACTIVATE !! \033[0m"
  '';
}
