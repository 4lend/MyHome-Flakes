# { lib, stdenv, fetchFromGitHub, ...}:
# 
# stdenv.mkDerivation {
#   name = "NvChad";
#   src = fetchFromGitHub {
#     owner = "NvChad";
#     repo = "NvChad";
#     # rev = "revision";  # Replace with the desired commit, branch, or tag
#     rev = "0e27cb4b44fbba69f8646d1f88555737d2b6aedf";  # Replace with the desired commit, branch, or tag
#     # sha256 = "hash";   # Replace with the correct SHA256 hash of the source archive
#     sha256 = "sha256-nEQ36jj5hHIpg+NYWeAEroHMI6mRdKCaWDbXXr/iRAE=";
#   };
#   # Add any build or installation instructions here
# }


{ config, pkgs, ... }:

let 
  nvchad = import 
    ( pkgs.fetchFromGitHub 
      { 
        owner = "NvChad";
        repo = "NvChad";
        rev = "0e27cb4b44fbba69f8646d1f88555737d2b6aedf";
        sha256 = "00a4wazmxmrnb2da0x4im4iwr0df0kh5jn73hclp517r73m3fi4w";
      }
    );
in 
  {
    environment = 
    {
      systemPackages =
        [
          nvchad
        ];
    };
  }
