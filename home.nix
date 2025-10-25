{ config, pkgs, ... }:

{
  home.username = "agaj";
  home.homeDirectory = "/home/agaj";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    python314
    qgis
    R
    rstudio
    quarto
    google-chrome
    vscode
    localsend
    grass
    obs-studio
    vlc
    jdk
    libreoffice
    zotero
    inkscape
    gimp
    pandoc
    alacritty
    zsh
    tree-sitter
    lazygit
    ffmpeg-full
];
}
