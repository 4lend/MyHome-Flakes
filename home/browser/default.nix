{ pkgs, config, lib, options, ... }:

{
  imports = [
    ./firefox.nix
    ./librewolf.nix
  ];
}
