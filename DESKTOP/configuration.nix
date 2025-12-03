{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [
    "i915.enable_guc=3"
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "dev.i915.perf_stream_paranoid" = 0;
  };
  
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  services.fstrim.enable = true;
  services.power-profiles-daemon.enable = true;

  networking.networkmanager.enable = true;

  ### SOUND ###
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true; 
    extraPackages = with pkgs; [
      intel-media-driver 
      intel-compute-runtime 
      vpl-gpu-rt
    ];
  };

  services.thermald.enable = true;

  ### ZRAM ###
  zramSwap.enable = true;
  zramSwap.memoryPercent = 50; 

  ### WAYLAND PORTAL ###
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
  };

  ### FONT ###
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  ### LOGIN MANAGER ###
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "voktex" ];
  virtualisation.docker.enableOnBoot = true;

  programs.fish.enable = true;
  programs.neovim.enable = true;
  programs.sway.enable = true;
  programs.waybar.enable = true;
  programs.ssh.startAgent = true;

  services.ollama.enable = true;
  services.openssh.enable = true;

  ### USER ###
  users.users.voktex = {
    # Type d'utilisateur
    isNormalUser = true;

    # Le groupe de cet utilisateur
    extraGroups = [ "wheel" "video" "render" "voktex" ]; 
    packages = with pkgs; [
    ];

    # Le shell utilise
    shell = pkgs.fish;
  };

  ### VSCODE ###
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];

  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    neovim
    git
    fastfetch
    firefox
    foot
    wl-clipboard
    tiled
    fish
    unzip
    sway
    swaybg
    vscode
    qutebrowser
    gcc
    gnumake
    docker
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; 
    LIBVA_DRIVER_NAME = "iHD";
  };

  ### ENVIRONEMENT ###
  environment.etc."sway/config".source = ./sway/config;
  environment.etc."xdg/foot/foot.ini".source = ./foot/foot.ini;
  environment.etc."xdg/waybar/config.jsonc".source = ./waybar/config.jsonc;
  environment.etc."xdg/waybar/style.css".source = ./waybar/style.css;

  system.stateVersion = "25.11"; 

}

