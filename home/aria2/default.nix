{ pkgs, config, ... }:

{
  programs.aria2 = {
    enable = true;
    settings = {
    };
    extraConfig = ''
    '';
  };
}
