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
    ./kitty
    ./mpv
    ./neovim
    ./packages
    ./shell
    ./starship
    ./tmux
    ./yt-dlp
  ];

  xdg = {
    inherit configHome;
    enable = true;
  };

  # ## keyboard ##
  # keyboard = 
  # {
  #   layout = "us";
  #   variant = "qwerty";
  #   options = 
  #   [
  #     "grp:win_space_toggle"
  #     "grp:caps_toggle,grp_led:scroll"
  #   ];
  # };

  programs = {
    home-manager.enable = true;
  };
}
