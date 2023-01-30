{ config, pkgs, ... }:
{
  config = {

    home.packages = with pkgs; [
        rnix-lsp nixfmt 
        sumneko-lua-language-server stylua
        nodePackages.typescript-language-server
        nodePackages.pyright
    ];

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        vim-nix
        plenary-nvim
        cmp-nvim-lsp
        cmp-path
        cmp-git
        cmp-vsnip
        auto-pairs
        vim-vsnip
        kanagawa-nvim

        {
          plugin = lualine-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/lualine.lua
          '';
        }

        {
          plugin = nvim-tree-lua;
          config = '' 
            luafile ~/MyHome-Flakes/neovim/lua/config/tree.lua
          '';
        }

        {
          plugin = nvim-cmp;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/cmp.lua
          '';
        }

        {
          plugin = lspkind-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/lspkind.lua
          '';
        }

        {
          plugin = telescope-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/telescope.lua
          '';
        }

        {
          plugin = indent-blankline-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/indent.lua
          '';
        }

        {
          plugin = nvim-lspconfig;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/lsp.lua
          '';
        }

        {
          plugin = bufferline-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/bufferline.lua
          '';
        }

        {
          plugin = nvim-treesitter;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/treesitter.lua
          '';
        }

        {
          plugin = nord-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/nord.lua
          '';
        }

        {
          plugin = nordic-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/nordic.lua
          '';
        }
        
        {
          plugin = popup-nvim;
          config = ''
            luafile ~/MyHome-Flakes/neovim/lua/config/popup-nvim.lua
          '';
        }
      ];

      extraConfig = ''
        luafile ~/MyHome-Flakes/neovim/lua/settings.lua
        luafile ~/MyHome-Flakes/neovim/lua/maps.lua
      '';
    };
  };
}
