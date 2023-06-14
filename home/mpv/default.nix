{ pkgs, config, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      # sub-font = "JetBrains Mono Nerd Font";  # ComicMono, ComicMono-Bold, SourceCodePro-Bold, ComicCodeDemo-Regular, JetBrains Mono NL Regular Nerd Font Complete, JetBrains Mono NL ExtraBold Nerd Font Complete
      # sub-font = "JetBrains Mono Nerd Font";
      sub-font = "JetBrainsMonoNerdFontMono-Regular";
      sub-font-size = 38;
      sub-color = "#FFFE25";  # yellow  # #FFFFFF - white
	    sub-border-color = "#000000";  # black  # #202020
	    sub-border-size = "3";  # default
	    sub-bold = "no";
	    sub-pos = 98;
      window = "fullscreen";
      speed = 1.15;
      playback = "save-position-on-quit";
	    fullscreen = "yes";
	    save-position-on-quit = "yes";
	    sub-ass-override = "force";
    };
  };
}
