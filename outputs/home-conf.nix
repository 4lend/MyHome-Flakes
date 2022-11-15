        alfurqani = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ({pkgs, ...}:{
              home.stateVersion = "22.11";
              home.username = "alfurqani";
              home.homeDirectory = "/home/alfurqani";
              home.packages = with pkgs; [
                git  neofetch  vim  neovim  wget  uget  uget-integrator  woeusb  ventoy-bin  bat  duf  exa  adguardhome  
		alacritty
                archiver
                aria
                ascii
                audacious
                bat
                bitwarden
                bitwarden-cli

		librewolf
              ];


