{ pkgs, config, ... }:

let
  fishConfig = ''
    bind \t accept-autosuggestion
    bind X forward-word
    set -U fish_greeting
  '';
in
{
  programs.fish = {
    enable = true;
    shellInit = fishConfig;
  };
}
