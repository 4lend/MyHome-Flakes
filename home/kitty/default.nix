{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Nightfox";  # Everforest Dark Soft - Medium - Hard, Forest Night, Nord, Dracula, One Dark, One Half Dark, 
    font = {
        name = "JetBrainsMonoNL NF Light";  # JetBrainsMono NFM";  # "JetBrainsMonoNL Nerd Font";
        # name = "JetBrainsMonoNL NF Thin";  # JetBrainsMono NFM";  # "JetBrainsMonoNL Nerd Font";
        # Thin, Light, Medium, Bold
        size = 12.0;
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

      background_opacity 1
      background_blur 0
      # background_image ./Nord-Wallpapers/nord_triangles.png
      background_image_layout tiled
      background_image_linear no
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
