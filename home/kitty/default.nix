{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    # theme = "Everforest Dark Hard";  # Everforest Dark Soft - Medium - Hard, Forest Night, Nord, Dracula, One Dark, One Half Dark, 
    theme = "Nord";
    font = {
        # name = "ComicMono";
        name = "JetBrains Mono NL Regular Nerd Font Complete";
        # name = "JetBrains Mono NL Light Nerd Font Complete";
        # name = "JetBrains Mono ExtraLight Nerd Font Complete";
        size = 14;
    };
    extraConfig = ''
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
    '';
    keybindings = {
      "ctrl+shift+h" = "scroll_line_up";
	    "ctrl+shift+l" = "scroll_line_down";
	    "ctrl+shift+k" = "scroll_page_up";
	    "ctrl+shift+j" = "scroll_page_down";
	    "ctrl+enter" = "launch --cwd=current";
    };
  };
}
