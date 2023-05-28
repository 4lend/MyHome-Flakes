{ config, pkgs, ... }:

let
  username = "alfurqani";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

in
{
  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";
  home.stateVersion = "23.05";

  imports = [
    ./alacritty
    ./aria2
    ./fzf
    ./git
    ./helix
    ./kitty
    ./mpv
    ./neovim
    ./packages
    ./rtorrent
    ./services
    ./shell
    ./starship
    ./tmux
    ./yt-dlp
  ];

  xdg = {
    inherit configHome;
    enable = true;
  };

  programs = {
    home-manager.enable = true;
  };
  programs.fish.enable = true;
}
