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
    neovim-flake = {
      url = github:jordanisaacs/neovim-flake;
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs:
    let 
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      config = { allowUnfree = true; };
      lib = nixpkgs.lib;

      primaryUserInfo = {
        username = "alfurqani";
        fullName = "Alfurqani";
        email = "syifa.alfurqoni@gmail.com";
        nixConfigDirectory = "/home/alfurqani/.config/nixpkgs";
      };


    in {
      nixosConfigurations = {
        alfurqani = lib.nixosSystem {
          inherit system ;
          modules = [
	          home-manager.nixosModules.home-manager {
	            home-manager.users.alfurqani = import ./home/home.nix;
	            home-manager.useGlobalPkgs = true;
	            home-manager.useUserPackages = true;
	          }
	          ./system/configuration.nix 
	          ./system/hardware-configuration.nix
	        ];
        };
      };

      # homeConfigurations = {
	    #   alfurqani = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     modules = [
	    #       ./home/home.nix
      #       ({pkgs, ...}:
      #       {
	    #       home = {
      #         packages = with pkgs; [  ];
	    #       }; 
      #       })
      #     ];
      #   };
	    # };
    };
}
