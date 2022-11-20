{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {self, home-manager, ...}@inputs:
    let system = "x86_64-linux"; in
      # pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        import ./outputs/home-conf.nix {
	    inherit inputs system;
	  }

        # alfurqani = home-manager.lib.homeManagerConfiguration {
        #   inherit pkgs;

        #   modules = [
        #     ({pkgs, ...}:{
        #       home.stateVersion = "22.11";
        #       home.username = "alfurqani";
        #       home.homeDirectory = "/home/alfurqani";
        #       home.packages = with pkgs; [
        #         git  neofetch  vim  neovim  wget  uget  uget-integrator  woeusb  ventoy-bin  bat  duf  exa  adguardhome  
	# 	alacritty
        #         archiver
        #         aria
        #         ascii
        #         audacious
        #         bat
        #         bitwarden
        #         bitwarden-cli

	# 	librewolf
        #       ];
	      
      # nixosConfigurations = {
      #   import ./outputs/nixos-conf.nix {
      #     inherit inputs system;
      #   };
      # };
            })
          ];
        };
      };
    };
  
}
