{
  description = "alfurqani nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    devenv.url = "github:cachix/devenv/latest";
    astronvim = { url = "github:AstroNvim/AstroNvim"; flake = false; };
    nvchad = { url = "github:NvChad/NvChad"; flake = false; };
    doom-nvim = { url = "github:doom-neovim/doom-nvim"; flake = false; };
    brew = { url = "github:Homebrew/brew"; flake = false; };
    ytermusic = { url = "github:ccgauche/ytermusic"; flake = false; };
    sn-cli = { url = "github:jonhadfield/sn-cli"; flake = false; };
    phps = { url = "github:loophp/nix-shell"; flake = false; };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, nur, devenv, astronvim, nvchad, doom-nvim, brew, ... }@inputs:
    let 
      username = "alfurqani";
      homeDirectory = "/home/${username}";
      configHome = "${homeDirectory}/.config";

      system = "x86_64-linux";
      darwin = "x86_64-darwin";
      # packages.${system}.astronvim = stdenv.mkDerivation {
      #   src = astronvim;
      # };
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      config = { allowUnfree = true; };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        alfurqani = lib.nixosSystem {
          inherit system ;
          modules = 
          let
            nur-modules = import nur {
            nurpkgs = inputs.nixpkgs.legacyPackages.${system};
            pkgs = inputs.nixpkgs.legacyPackages.${system};
            };
          in [
            # { imports = [ nur-modules.repos.congee.sncli ]; }
	          ./system/configuration.nix 
	          ./system/hardware-configuration.nix
            # packages.x86_64-linux.ytermusic = [ devenv.packages.x86_64-linux.devenv ];
            inputs.home-manager.nixosModules.home-manager {
	            home-manager.useGlobalPkgs = true;
	            home-manager.useUserPackages = true;
              # home-manager.users.alfurqani = import ./home/home.nix;
              home-manager.users.alfurqani = { config, pkgs, lib, nixpkgs-unstable, ... }: {
                imports = [ 
                  ./home/home.nix
                  # ./overlays.nix
                  # ./package.nix
                ];
              };
	          }
            nur.nixosModules.nur
            ({ config, ... }: {
              environment.systemPackages = with config.nur.repos; [ 
                ruixi-rebirth.chatgpt-cli
                meain.chatgpt-cli
                linyinfeng.matrix-chatgpt-bot
                congee.sncli
                m15a.vimExtraPlugins.obsidian-nvim
              ];
            })
	        ];
        };
      };

      # homeConfigurations = {
	    #   alfurqani = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     modules = [
	    #       ./home/home.nix
      #     ];
      #   };
	    # };
    };
}
