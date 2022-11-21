{ config, lib, pkgs, stdenv, ... }:

let
  username = "alfurqani";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

  defaultPkgs = with pkgs; [
  git  neofetch  vim  neovim  wget  uget  uget-integrator  woeusb  ventoy-bin  bat  duf  exa  adguardhome
  alacritty
  archiver
  aria
  ascii
  audacious
  bat
  bitwarden
  bitwarden-cli
  
  librewolf
  ];

in
{
  programs.home-manager.enable = true;

  imports = builtins.concatMap import [
    # ./modules
    # ./age
    ./programs
    # ./scripts
    # ./services
    # ./themes
  ];

  xdg = {
    inherit configHome;
    enable = true;
  };

  home = {
    inherit username homeDirectory;
    stateVersion = "21.11";

    packages = defaultPkgs;

  };
}
