{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Dar_es_Salaam";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sw_TZ";
    LC_IDENTIFICATION = "sw_TZ";
    LC_MEASUREMENT = "sw_TZ";
    LC_MONETARY = "sw_TZ";
    LC_NAME = "sw_TZ";
    LC_NUMERIC = "sw_TZ";
    LC_PAPER = "sw_TZ";
    LC_TELEPHONE = "sw_TZ";
    LC_TIME = "sw_TZ";
  };

  # services.xserver.enable = true;
  services.xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  # # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.agaj = {
    isNormalUser = true;
    description = "Agaj NixOS";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    	tree
    ];
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  users.users.agaj.shell = pkgs.zsh;

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    neovim
    freetype
    fontconfig
    noto-fonts
    gcc
    git
    nodejs
    gnumake
    gnugrep
    cmake
    gnome-tweaks
    neofetch
    bat
    gh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.ubuntu-sans
    nerd-fonts.iosevka
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05"; 
}
