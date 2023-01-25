{
  description = "alfurqani nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    home-manager = 
    {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.utils.follows = "flake-utils";
    };
    neovim-flake = 
    {
      url = github:jordanisaacs/neovim-flake;
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }@inputs:
    let 
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      config = { allowUnfree = true; };
      lib = nixpkgs.lib;

      primaryUserInfo = 
      {
        username = "alfurqani";
        fullName = "Alfurqani";
        email = "syifa.alfurqoni@gmail.com";
        nixConfigDirectory = ":home/alfurqani/.config/nixpkgs";
      };


    in {
      nixosConfigurations = 
      {
        # import = ./outputs/nixos-conf.nix
	# { 
	#   inherit inputs system; 
	# }

        alfurqani = lib.nixosSystem
        {
          inherit system ;
           modules = 
	   [ 
	     ./configuration.nix 
	     ./hardware-configuration.nix
	     home-manager.nixosModules.home-manager 
	     {
	       home-manager.useGlobalPkgs = true;
	       home-manager.useUserPackages = true;
	       home-manager.users.alfurqani = import ./home.nix;

	       ## hashtag means it has been implemented in home.nix
	       # home-manager.users.alfurqani.home.homeDirectory = "/home/alfurqani";
	       # home-manager.users.alfurqani.home.stateVersion = "23.05";
	     }
	   ];
        };
      };

        homeConfigurations = 
	{
	  alfurqani = home-manager.lib.homeManagerConfiguration
          {
            inherit pkgs;
            modules = 
            [
	      ./home.nix
              ({pkgs, ...}:
              {
	        home = 
	        {
                  # packages = with pkgs;
                  # [
                  # ];
	        }; 
              })
            ];
          };
	};
	# homeManagerModules = 
	# {
	#   alfurqani-neovim = import ./home/neovim.nix;
	# };
    };
  
}
