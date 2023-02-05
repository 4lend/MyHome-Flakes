{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";
  home.stateVersion = "23.05";

  imports = [
    ./alacritty
    ./kitty
    ./mpv
    ./neovim
    ./tmux
    ./git
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

  # Let Home Manager install and manage itself.

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
}
