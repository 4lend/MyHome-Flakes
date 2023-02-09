{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    audacious
  ]; 
}
