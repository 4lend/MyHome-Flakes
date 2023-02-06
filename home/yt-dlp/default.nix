{ pkgs, config, ... }:

{
  programs.yt-dlp = {
    enable = true;
    settings = {
      sub-langs = "en,id";
	    downloader = "aria2c";  # native, aria2c, axel, curl, wget, ffmpeg, httpie, avconf
	    write-subs = true;
	    write-auto-subs = true;
      proxy = "http://192.168.49.1:8000";
      # video-multistream = true;
	    # list-formats = true;
	    # progress = true;
    };
    # extraConfig = "
    #   --write-subs
    #   --write-auto-subs
    #   --sub-langs en
    #   --downloader aria2c 
    # ";
  };
}
