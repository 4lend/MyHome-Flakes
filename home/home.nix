{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";
  home.stateVersion = "23.05";

  # imports = # builtins.concatMap import
  imports = 
  [
    ./alacritty
    ./neovim
    ./tmux
  ];

  home = 
  {
    ## packages ##
    packages = with pkgs;
    [
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

  programs =
  {
    home-manager.enable = true;

    ## MPV ##
    mpv =
    {
      enable = true;
      config = 
      {
        sub-font = "JetBrains Mono NL ExtraBold Nerd Font Complete";  # ComicMono, ComicMono-Bold, SourceCodePro-Bold, ComicCodeDemo-Regular, JetBrains Mono NL Regular Nerd Font Complete, JetBrains Mono NL ExtraBold Nerd Font Complete
        sub-font-size = 38;
        sub-color = "#FFFE25";  # yellow  # #FFFFFF - white
	sub-border-color = "#000000";  # black  # #202020
	sub-border-size = "3";  # default
	sub-bold = "no";
	sub-pos = 100;
        window = "fullscreen";
        speed = 1.15;
        playback = "save-position-on-quit";
	fullscreen = "yes";
	save-position-on-quit = "yes";
	sub-ass-override = "force";
      };
    };

    ## KITTY ##
    kitty = 
    {
      enable = true;
      theme = "Nord"; 
      font = 
        {
          # name = "ComicMono";
          name = "JetBrains Mono NL Regular Nerd Font Complete";
          # name = "JetBrains Mono NL Light Nerd Font Complete";
          # name = "JetBrains Mono ExtraLight Nerd Font Complete";
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

	  toggle_fullscreen yes
	  macos_traditional_fullscreen yes
	  --start-as
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

    # ## TMUX ##
    # tmux = 
    # {
    #   enable = true;
    #   shortcut = "a";
    #   terminal = "screen-256color";
    #   clock24 = true; 
    #   keyMode = "vi";
    #   customPaneNavigationAndResize = true;
    #   historyLimit = 10000;
    #   newSession = true;
    #   plugins = with pkgs.tmuxPlugins;
    #   [
    #     jump
    #     battery
    #     copycat
    #     vim-tmux-navigator
    #     vim-tmux-focus-events
    #     tmux-fzf
    #     tmux-thumbs
    #     yank
    #     cpu
    #     net-speed
    #     nord

    #     fpp
    #     cpu
    #     open
    #     tilish
    #     urlview
    #     sysstat
    #     sidebar
    #     # fuzzback
    #     copy-toolkit
    #     online-status
    #     prefix-highlight
    #   ];
    #   extraConfig = 
    #   ''
    #     set -g default-terminal "xterm-256color"
    #     set -g default-command  /run/current-system/sw/bin/fish
    #     set -g default-shell /run/current-system/sw/bin/fish

    #     bind r source-file $HOME/.config/tmux/tmux.conf \; display "Reloaded!"

    #     unbind % 
    #     unbind '"' 

    #     bind-key Space new-window
    #     bind-key b new-window 
    #     bind-key i split-window -h
    #     bind-key h split-window -v

    #     # Resizing pane
    #     bind -r C-k resize-pane -U 5
    #     bind -r C-j resize-pane -D 5
    #     bind -r C-h resize-pane -L 5
    #     bind -r C-l resize-pane -R 5

    #     # switch panes using Alt-arrow without prefix
    #     bind -n M-Left select-pane -L
    #     bind -n M-Right select-pane -R
    #     bind -n M-Up select-pane -U
    #     bind -n M-Down select-pane -D
    #   '';
    # };

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
        sub-langs = "en,id";
	      downloader = "aria2c";  # native, aria2c, axel, curl, wget, ffmpeg, httpie, avconf
	      write-subs = true;
	      write-auto-subs = true;
        # proxy = "http://192.168.49.1:8000";
        # video-multistream = true;
	      # list-formats = true;
	      # progress = true;
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
      # ignores = "result";
      # signing = 
      # signing.gpgPath = "";
      # signing.key = "";
      # signing.signByDefault = true;
    };

    # ## NEOVIM ## 
    # neovim =
    # {
    #   enable = true;
    #   viAlias = false;
    #   vimAlias = false; 
    #   coc.enable = true;
    #   plugins = with pkgs.vimPlugins;
    #   [
    #     # plugins
    #     telescope-nvim
    #     telescope-project-nvim
    #     telescope-github-nvim
    #     telescope-frecency-nvim
    #     vim-lightline-coc
    #     nvim-lightline-lsp
    #     lightline-vim
    #     lightline-lsp
    #     nvim-treesitter

    #     # colorschemes
    #     onenord-nvim
    #     nordic-nvim
    #     nord-nvim
    #     dracula-vim
    #     dracula-nvim
    #     kanagawa-nvim
    #   ];

    #   extraConfig = 
    #   ''
    #     set number
    #     set relativenumber
    #     set nobackup
    #     imap jj <Esc>
    #     inoremap jj <Esc>
    #     syntax on
    #   '';

    #   # settings = 
    #   # {
    #   #   # vim = 
    #   #   # {
    #   #   #   
    #   #   # };
    #   # };

    #   # generatedConfigs = 
    #   # {
    #   #   viml = 
    #   #   ''
    #   #     imap jj <Esc>
    #   #   '';
    #   # };
    # };

    ## qutebrowser ##
    qutebrowser =
    {
    enable = true;
    enableDefaultBindings = true;
    };

    ## Z-LUA ##
    z-lua = 
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
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
