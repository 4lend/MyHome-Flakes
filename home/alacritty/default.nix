{ pkgs, config, ... }:

{
  programs.alacritty = 
  {
    enable = true;
    settings = {
      dynamic_padding = true;
      selection.save_to_clipboard = true;
      startup_mode = "Fullscreen";  # Windowed, Maximized, Fullscreen
      window = {
        startup_mode = "Fullscreen";  # Windowed, Maximized, Fullscreen
        opacity = 1.00;
        decorations = "none";
        padding = {
          x = 5;
          y = 5;
        };
      };
      font = {
        size = 15;
        normal = { 
          family = "JetBrains Mono NL Regular Nerd Font"; 
          style = "Regular";
        };
        # bold = { 
        #   family = "ComicMono"; 
        #   style = "Bold";
        # };
        # italic = { 
        #   family = "ComicMono"; 
        #   style = "Italic";
        # normal = { 
        #   family = "JetBrains Mono NL Regular Nerd Font Complete"; 
        #   style = "Regular";
        # };
        # bold = { 
        #   family = "JetBrains Mono NL Regular Nerd Font Complete"; 
        #   style = "Bold";
        # };
        # italic = { 
        #   family = "JetBrains Mono NL Regular Nerd Font Complete"; 
        #   style = "Italic";
        # };
      };
    };
  };
}
