{ pkgs, config, ... }:

{
  programs.rtorrent = {
    enable = true;
    extraConfig = ''

    '';
  };
}
