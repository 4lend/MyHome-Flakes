{ config, pkgs, lib, options, ... }:

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
    # ./browser
    ./desktop
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
    ./xdg
    ./yt-dlp
  ];

  programs = {
    home-manager.enable = true;
  };
  programs.fish.enable = true;
}
