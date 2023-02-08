{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "lunarvim-${version}";
  version = "git-2018-06-30";

  src = pkgs.fetchFromGitHub {
    owner  = "LunarVim";
    repo   = "LunarVim";
    rev    = "c34f04cda13175d21839fb3946741bacdf1fbb52";
    sha256 = "qKHo0K96jTFlhtxWkhkVQHKAr5xANjGbTgEqhOOoJ/M=";
  };
  
  buildInputs = [ pkgs.nix ];

  buildPhase = ''
    nix-build ${src}/release.nix
  '';
}
