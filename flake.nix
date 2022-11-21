{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {self, home-manager, ...}@inputs:
    let system = "x86_64-linux"; in
      # pkgs = inputs.nixpkgs.legacyPackages.${system};
    {
      homeConfigurations = {
        import ./outputs/home-conf.nix {
          inherit inputs system;
	}
      };
      
      # nixosConfigurations = {
      #   import ./outputs/nixos-conf.nix {
      #     inherit inputs system;
      #   };
      # };

    };
  
}
