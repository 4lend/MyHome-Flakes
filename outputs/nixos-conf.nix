{ config, pkgs, ... }:

let
  # inherit (inputs.nixpkgs.lib) nixosSystem;

  # libx = import ../lib { inherit (inputs.nixpkgs) lib; };

  # lib = inputs.nixpkgs.lib.extend (_: _: {
  #   inherit (libx) secretManager;
  # });

  # sxmOverlay =
  #   if (builtins.hasAttr "sxm-flake" inputs)
  #   then inputs.sxm-flake.overlays.default
  #   else (f: p: { });

  # pkgs = import inputs.nixpkgs {
  #   inherit system;
  #   config = {
  #     allowUnfree = true;
  #     permittedInsecurePackages = [
  #       "xrdp-0.9.9"
  #       "electron-12.2.3"  # etcher
	#   	  "python-2.7.18.6"
  #       "openssl-1.1.1t"
  #       "openssl-1.1.1u"
  #       "openssl-1.1.1v"
  #       "electron-9.4.4"
  #       "electron-21.4.0"
  #       "ruby-2.7.8"  # ruby
  #     ];
  #   };
  #   overlays = [ sxmOverlay ];
  # };

  # NIXPKGS CONFIG
  pkgsConfig = {
    nixpkgs.config = {
      pulseaudio = true;
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-12.2.3"  # etcher
	    	"python-2.7.18.6"
        "openssl-1.1.1t"
        "openssl-1.1.1u"
        "openssl-1.1.1v"
        "electron-9.4.4"
        "electron-21.4.0"
        "ruby-2.7.8"  # ruby
	    ];
    };
  };

  # nixConfig = {
  #   nix = {
  #     settings = {
  #       trusted-users = [ "root" "alfurqani" ];
  #       experimental-features = [ "nix-command" "flakes" ];
  #       auto-optimise-store = true;
  #     };
  #     package = pkgs.nixFlakes;
  #     extraOptions = "experimental-features = nix-command flakes";
  #     sshServe = {
  #       enable = true;
  #       keys = []; 
  #     };
  #   };
  # };

in
{
  nixpkgs.config = {
    inherit pkgsConfig;
  };
  # nix = {
  #   inherit nixConfig;
  # };
  nix = {
    settings = {
      trusted-users = [ "root" "alfurqani" ];
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    sshServe = {
      enable = true;
      keys = []; 
    };
  };
}
