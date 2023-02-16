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
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [ 
        vim-nix
        plenary-nvim
        cmp-nvim-lsp
        cmp-path
        cmp-git
        cmp-vsnip
        auto-pairs
        vim-vsnip
        vim-css-color  # A very fast, multi-syntax context-sensitive color name highlighter
        # goyo-vim
        # vimwiki
        # vim-markdown
        # coc-markdownlint
        # packer-nvim
        nvim-lastplace
        delimitMate
        nvim-web-devicons
        vim-fugitive
        fugitive-gitlab-vim
        # theme
        kanagawa-nvim
        tokyonight-nvim
        palenight-vim
        everforest
        edge
        gruvbox
        onenord-nvim
        sonokai
        oceanic-next
        oceanic-material
        dracula-nvim
        material-nvim
        awesome-vim-colorschemes
        papercolor-theme
        aurora

        ### vimfile ###
        { 
          plugin = Vundle-vim;
          config = '' 
            call vundle#begin()

              Plugin 'nikvdp/neomux'

            call vundle#end()

            filetype plugin indent on
          '';
        }

        ### neovim luafile ### 
        {
          plugin = lualine-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/lualine.lua
          '';
        }

        {
          plugin = nvim-tree-lua;
          config = '' 
            luafile ~/MyHome-Flakes/home/neovim/lua/config/tree.lua
          '';
        }

        {
          plugin = nvim-cmp;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/cmp.lua
          '';
        }

        {
          plugin = lspkind-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/lspkind.lua
          '';
        }

        {
          plugin = telescope-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/telescope.lua
          '';
        }

        {
          plugin = indent-blankline-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/indent.lua
          '';
        }

        {
          plugin = nvim-lspconfig;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/lsp.lua
          '';
        }

        {
          plugin = bufferline-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/bufferline.lua
          '';
        }

        {
          plugin = nvim-treesitter;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/treesitter.lua
          '';
        }

        {
          plugin = nord-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/nord.lua
          '';
        }

        {
          plugin = nordic-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/nordic.lua
          '';
        }
        
        {
          plugin = popup-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/popup-nvim.lua
          '';
        }

        {
          plugin = everforest;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/everforest.lua
          '';
        }

        {
          plugin = diffview-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/barbar-nvim.lua
          '';
        }

        {
          plugin = barbar-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/diffview-nvim.lua
          '';
        }

        {
          plugin = nightfox-nvim;
          config = ''
            luafile ~/MyHome-Flakes/home/neovim/lua/config/nightfox-nvim.lua
          '';
        }

        # {
        #   plugin = themer-nvim;
        #   config = ''
        #     luafile ~/MyHome-Flakes/home/neovim/lua/config/themer.lua
        #   '';
        # }

        # {
        #   plugin = Vundle-vim;
        #   config = ''
        #     vimfile ~/MyHome-Flakes/home/neovim/lua/config/everforest.lua
        #   '';
        # }
      ];

      extraConfig = ''
        luafile ~/MyHome-Flakes/home/neovim/lua/settings.lua
        luafile ~/MyHome-Flakes/home/neovim/lua/maps.lua
      '';
    };
  };
}
