{
  description = "alfurqani nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs:
    let 
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      config = { allowUnfree = true; };
      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        alfurqani = lib.nixosSystem {
          inherit system ;
          modules = [
	          ./system/configuration.nix 
	          ./system/hardware-configuration.nix
            inputs.home-manager.nixosModules.home-manager {
	            home-manager.useGlobalPkgs = true;
	            home-manager.useUserPackages = true;
              # home-manager.users.alfurqani = import ./home/home.nix;
              home-manager.users.alfurqani = { config, pkgs, lib, nixpkgs-unstable, ... }: {
                imports = [ 
                  ./home/home.nix
                ];
              };
	          }
	        ];
        };
      };

      homeConfigurations = {
	      alfurqani = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
	          ./home/home.nix
          ];
        };
	    };
    };
}
