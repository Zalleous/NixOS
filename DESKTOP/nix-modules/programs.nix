{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # --- Terimnal ---
    kitty

    # --- Development Tools ---
    gcc       
    git
    gnumake  
    nodejs  
    python3
    curl       
    unzip     
    wl-clipboard 
    php 
    fastfetch  

    # --- LazyVim Requirements ---
    lazygit
    ripgrep 
    trash-cli
    fd     
    fzf   
    tree-sitter 
    lua-language-server 
    nixd 
    sqlite
    imagemagick
    ghostscript
    mermaid-cli
    tectonic

    # --- Graphical Apps ---
    firefox     
    qutebrowser 

    # -- Windows Components --
    swaybg
  ];


  # =================================================================
  # PROGRAMS & COMPATIBILITY
  # =================================================================
  programs.fish.enable = true;
  programs.zoxide.enable = true; 

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true; 
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
  ];

  nixpkgs.config.allowUnfree = true;

}
