{
  description = "home-manager with flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = 
    {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let 
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      # pkgs = import nixpkgs
      # {
      #   inherit system;
      #   config.allowUnfree = true;
      # };
      # lib = nixpkgs.lib;

    in {
      # nixosConfigurations = 
      # {
      #   alfurqani = lib.nixosSystem
      #   {
      #     inherit system ;
      #     modules = [ ./configuration.nix ];
      #   };
      # };

      homeConfigurations = 
      {
        alfurqani = home-manager.lib.homeManagerConfiguration
	{
	  inherit pkgs;

	  modules = 
	  [
	    ({pkgs, ...}:
	    {
	      home.stateVersion = "22.11";
	      home.username = "alfurqani";
	      home.homeDirectory = "/home/alfurqani";
	    })
	  ];
	};
      };
    };
  
}
