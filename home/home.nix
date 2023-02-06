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
    ./git
    ./kitty
    ./mpv
    ./neovim
    ./shell
    ./tmux
    ./yt-dlp
  ];

  home = 
  {
    ## packages ##
    packages = with pkgs; [
      cloudflare-warp
    ];

    ## keyboard ##
    keyboard = 
    {
      layout = "us";
      variant = "qwerty";
      options = 
      [
        "grp:win_space_toggle"
        "grp:caps_toggle,grp_led:scroll"
      ];
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
