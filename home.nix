{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";

  home.stateVersion = "22.11";

  # imports = 
  # [
  #   ./modules
  # ];

  home.packages = with pkgs;
  [
    cloudflare-warp
  ];

  programs =
  {
    home-manager.enable = true;

    ## ALACRITTY ##
    alacritty = 
    {
    enable = true;
    settings = 
      {
        # opacity = 1.0;
	dynamic_padding = true;
	font =
	{
	  size = 14;
	};
	selection.save_to_clipboard = true; 
	window =
	{
	  opacity = 1.0;
	  decorations = "none";
	  padding = 
	  {
	    x = 5;
	    y = 5;
	  };
          startup_mode = "Fullscreen";
	  schemes =
	  {
	    ### Doom One ###
            DoomOne = 
	    {
              primary =
	      {
                background = "#282c34";
                foreground = "#bbc2cf";
	      };
              cursor =
	      {
                text = "CellBackground";
                cursor = "#528bff";
	      };
              selection =
	      {
                text = "CellForeground";
                background = "#3e4451";
	      };
              normal =
	      {
                black =   "#1c1f24";
                red =     "#ff6c6b";
                green =   "#98be65";
                yellow =  "#da8548";
                blue =    "#51afef";
                magenta = "#c678dd";
                cyan =    "#5699af";
                white =   "#202328";
	      };
              bright =             
	      {
                black =   "#5b6268";
                red =     "#da8548";
                green =   "#4db5bd";
                yellow =  "#ecbe7b";
                blue =    "#3071db";   # This is 2257a0 in Doom Emacs but I lightened it.
                magenta = "#a9a1e1";
                cyan =    "#46d9ff";
                white =   "#dfdfdf";
	      };
	    };
	    colors = "DoomOne";
	  };
	};
      };
    };

    ## MPV ##
    mpv =
    {
      enable = true;
      config = 
      {
        sub-font = "Comic Sans";
        sub-font-size = 35;
        sub-color = "#FFFE25";
        window = "fullscreen";
        speed = 1.15;
        playback = "save-position-on-quit";
	fullscreen = "yes";
	save-position-on-quit = "yes";
      };
    };

    ## KITTY ##
    kitty = 
    {
      enable = true;
      theme = "Nord"; 
      font = 
        {
          name = "ComicMono";
          size = 14;
        };
      extraConfig =
        "
	  cursor_shape block

	  adjust_line_height 0
	  adjust_colomn_width 0

	  remember_window_size yes

	  hide_window_decorations yes

	  confirm_os_window_close 0

	  fish_color_valid_path --none

        ";
      keybindings =
      {
        "ctrl+shift+h" = "scroll_line_up";
	"ctrl+shift+l" = "scroll_line_down";
	"ctrl+shift+k" = "scroll_page_up";
	"ctrl+shift+j" = "scroll_page_down";

	"ctrl+enter" = "launch --cwd=current";
      };
    };

    ## TMUX ##
    tmux = 
    {
      enable = true;
      clock24 = true; 
      keyMode = "vi";
      extraConfig = 
      ''
        set -g default-terminal "xterm-256color"
	
      '';
    };

    # ## FISH ##
    # fish = 
    # {
    #   enable = true;
    #   interactiveShellInit =
    #   "
    #     bind \t accept-autosuggestion
    #   ";
    # };

    ## STARSHIP ##
    starship =
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true; 
      settings = 
      {
        add_newline = true;
	command_timeout = 1000;
        cmd_duration = 
	{
          format = " [$duration]($style) ";
          style = "bold #EC7279";
          show_notifications = true;
        };
        nix_shell = 
	{
          format = " [$symbol$state]($style) ";
        };
        battery = 
	{
          full_symbol = "🔋 ";
          charging_symbol = "⚡️ ";
          discharging_symbol = "💀 ";
        };
        git_branch = 
	{
          format = "[$symbol$branch]($style) ";
        };
        gcloud = 
	{
          format = "[$symbol$active]($style) ";
        };
      };
    };

    ## FZF ##
    fzf = 
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    ## YT-DLP ##
    yt-dlp =
    {
      enable = true;
      settings = 
      {
        sub-langs = "en";
	downloader = "aria2c";
	write-subs = true;
	write-auto-subs = true;
      };
      # extraConfig = 
      # "
      #   --write-subs
      #   --write-auto-subs
      #   --sub-langs en
      #   --downloader aria2c 
      # ";
    };

    ## GIT ##
    git = 
    {
      enable = true;
      userEmail = "syifa.alfurqoni@gmail.com";
      userName = "Alfurqani";
    };

    ## NEOVIM ## 
    neovim =
    {
      enable = true;
      coc.enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = 
      ''
        set number
	set relativenumber
      '';
    };

    qutebrowser =
    {
    enable = true;
    enableDefaultBindings = true;
    };
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
