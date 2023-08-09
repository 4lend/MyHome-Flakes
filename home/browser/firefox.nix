{ pkgs, config, ... }:

let
  username = "alfurqani";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
  nixConfigDirectory = "${configHome}/nixpkgs";
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-unwrapped;
    profiles = {
      alfurqani = {
        extraConfig = ''
        '';
        default = "Google";
        search = {
          engines = {};
        };
      };
    };
  };
}
