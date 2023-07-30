{ pkgs, config, ... }:

{
  programs.aria2 = {
    enable = true;
    settings = {
      seed-ratio = 0;
      seed-time = 0;
    };
    extraConfig = ''
    '';
  };
}
