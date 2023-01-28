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
      # enable = true;
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
            luafile ./lua/config/lualine.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/lualine.lua
          '';
        }

        {
          plugin = nvim-tree-lua;
          config = '' 
            luafile ./lua/config/tree.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/tree.lua
          '';
        }

        {
          plugin = nvim-cmp;
          config = ''
            luafile ./lua/config/cmp.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/cmp.lua
          '';
        }

        {
          plugin = lspkind-nvim;
          config = ''
            luafile ./lua/config/lspkind.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/lspkind.lua
          '';
        }

        {
          plugin = telescope-nvim;
          config = ''
            luafile ./lua/config/telescope.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/telescope.lua
          '';
        }

        {
          plugin = indent-blankline-nvim;
          config = ''
            luafile ./lua/config/indent.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/indent.lua
          '';

        }

        {
          plugin = nvim-lspconfig;
          config = ''
            luafile ./lua/config/lsp.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/lsp.lua
          '';
        }

        {
          plugin = bufferline-nvim;
          config = ''
            luafile ./lua/config/bufferline.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/bufferline.lua
          '';
        }

        {
          plugin = nvim-treesitter;
          config = ''
            luafile ./lua/config/treesitter.lua
            # luafile ~/.config/dotfiles/modules/users/nvim/lua/config/treesitter.lua
          '';
        }
      ];

      extraConfig = ''
        # luafile ./lua/settings.lua
        luafile ~/MyHome-Flakes/neovim/lua/maps.lua
        # luafile ~/.config/dotfiles/modules/users/nvim/lua/maps.lua
      '';
    };
  };
}
