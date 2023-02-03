{ pkgs, config, ... }:

{
  programs.alacritty = 
  {
    enable = true;
    settings = {
      dynamic_padding = true;
      selection.save_to_clipboard = true;
      startup_mode = "Fullscreen";
      window = {
        opacity = 1.00;
        decorations = "none";
        padding = {
          x = 5;
          y = 5;
        };
        font = {
          size = 14;
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

          # normal = { 
          #   family = "Victor Mono Regular Nerd Font Complete Mono"; 
          #   style = "Regular";
          # };
          # bold = { 
          #   family = "Victor Mono Regular Nerd Font Complete Mono"; 
          #   style = "Bold";
          # };
          # italic = { 
          #   family = "Victor Mono Regular Nerd Font Complete Mono"; 
          #   style = "Italic";
          # };

          # # not working
          # normal = { 
          #   family = "ComicMono"; 
          #   style = "Regular";
          # };
          # bold = { 
          #   family = "ComicMono"; 
          #   style = "Bold";
          # };
          # italic = { 
          #   family = "ComicMono"; 
          #   style = "Italic";
          # };
        };
      };
    };
  };
}
