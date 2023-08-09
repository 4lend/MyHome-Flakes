{ pkgs, config, ... }:
let
  username = "alfurqani";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
  nixConfigDirectory = "${configHome}/nixpkgs";
  node = with pkgs.nodePackages; [
    typescript-language-server
    pyright
  ];
  php = with pkgs.phpPackages; [
    psalm
    phpstan
  ];
  php82 = with pkgs.php82Packages; [
    composer
    # psysh
    # psalm
    # phpmd
    # phpstan
    # phan
    # phpcs
    # phpcbf
    # grumphp
    # deployer
    # php-cs-fixer
    # php-parallel-lint
  ];
  php81 = with pkgs.php81Packages; [
  ];
  mix = with pkgs; [
    rnix-lsp nixfmt 
    sumneko-lua-language-server
    lua51Packages.lua-lsp
    sumneko-lua-language-server stylua
    adoptopenjdk-bin
    lua-language-server
    python311Packages.pynvim
    python310Packages.pynvim
    ueberzug
    # ueberzugpp
    ripgrep  # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    ripgrep-all  # Ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
    vgrep  # User-friendly pager for grep/git-grep/ripgrep
    gcc
    # gcc13
  ];
in
{
  config = {
    home.packages = node ++ php ++ php82 ++ mix;
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = false;
      extraLuaConfig = ''
        guifontset = "JetBrainsMono NFM";
      '';
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
        vimtex
        vim-surround
        nvim-surround
        # vim-html-template-literals
        vim-snippets
        snippets-nvim
        vim-lsp-snippets
        friendly-snippets
        goyo-vim
        vim-markdown
        # packer-nvim
        nvim-lastplace
        delimitMate
        nvim-web-devicons
        vim-fugitive
        fugitive-gitlab-vim
        ### theme
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
        # awesome-vim-colorschemes
        # papercolor-theme
        aurora
        vim-easy-align
        # vim-easytags  # problem
        vim-easymotion
        vim-easygit
        nvim-comment
        comment-nvim
        plenary-nvim
        octo-nvim
        # nvim-ts-autotag
        cmp-nvim-tags
        vim-tmux-navigator
        tmux-nvim
        telescope-vim-bookmarks-nvim
        vim-wordmotion
        ChatGPT-nvim
        # nvim-treesitter-parsers.latex
        cmp-latex-symbols 
        latex-box
        compe-latex-symbols
        # codeium-vim
        vim-numbertoggle
        vim-togglelist
        nvim-autopairs
        nvim-ale-diagnostic
        pears-nvim

        phpactor
        YouCompleteMe
        vim-addon-php-manual
        nvchad
        nvchad-ui
        nvchad-extensions
        vifm-vim
        vim-floaterm
        nvim-treesitter-parsers.yaml
        telescope-live-grep-args-nvim
        ### vimfile ###
        # { plugin = Vundle-vim;
        # config = '' 
        #   call vundle#begin()
        #     Plugin 'nikvdp/neomux'
        #     Plugin 'dbeniamine/cheat.sh-vim'
        #     Plugin 'cometsong/CommentFrame.vim'
        #   call vundle#end()
        #   filetype plugin indent on
        # ''; }

        # { plugin = lazy-nvim;
        # config = ''
        #   require("lazy").setup({
        #     "folke/which-key.nvim",
        #     { "folke/neoconf.nvim", cmd = "Neoconf" },
        #     "folke/neodev.nvim",
        #   })
        # ''; }

        ### neovim luafile ### 
        { plugin = nvchad;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/nvchad.lua
        ''; }
        
        # { plugin = phpactor;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/phpactor.lua
        # ''; }
        
        { plugin = lualine-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/lualine.lua
        ''; }
        
        
        { plugin = nvim-tree-lua;
        config = '' 
          luafile ~/.config/nixpkgs/home/neovim/lua/config/tree.lua
        ''; }
        
        
        { plugin = lspkind-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/lspkind.lua
        ''; }
        
        
        { plugin = telescope-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/telescope.lua
        ''; }
        
        
        { plugin = indent-blankline-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/indent.lua
        ''; }
        
        
        { plugin = nvim-lspconfig;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/lsp.lua
        ''; }
        
        
        { plugin = bufferline-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/bufferline.lua
        ''; }
        
        
        { plugin = nvim-treesitter;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/treesitter.lua
        ''; }
        
        
        { plugin = nord-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/nord.lua
        ''; }
        
        
        { plugin = popup-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/popup-nvim.lua
        ''; }
        
        
        { plugin = everforest;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/everforest.lua
        ''; }
        
        
        { plugin = diffview-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/diffview-nvim.lua
        ''; }
        
        
        { plugin = barbar-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/barbar-nvim.lua
        ''; }
        
        
        { plugin = nightfox-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/nightfox-nvim.lua
        ''; }
        

        # { plugin = lazy-nvim;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/lazy-nvim.lua
        # ''; }
        
        
        { plugin = formatter-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/formatter-nvim.lua
        ''; }
        
        
        { plugin = catppuccin-nvim;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/catppuccin-nvim.lua
        ''; }
        
        
        { plugin = nvim-autopairs;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/autopairs.lua
        ''; }
        
        
        # { plugin = coc-nvim;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/coc-nvim.lua
        # ''; }

        # { plugin = lazygit-nvim;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/lazygit-nvim.lua
        # ''; }

        # { plugin = cmp-npm;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/cmp-npm.lua
        # ''; }

        # { plugin = cmp-tabnine;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/cmp-tabnine.lua
        # ''; }

        { plugin = cmp-treesitter;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/cmp-treesitter.lua
        ''; }

        # { plugin = mason-nvim;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/mason.lua
        # ''; }

        # { plugin = mason-lspconfig-nvim;
        # config = ''
        #   luafile ~/.config/nixpkgs/home/neovim/lua/config/mason-lspconfig.lua
        # ''; }

        # { plugin = rnvimr;
        # config = ''
        #   vimfile ~/.config/nixpkgs/home/neovim/lua/config/rnvimr.vim
        # ''; }

        { plugin = harpoon;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/harpoon.lua
        ''; }

        { plugin = nvim-dap;
        config = ''
          luafile ~/.config/nixpkgs/home/neovim/lua/config/dap.lua
        ''; }
        nvim-dap
        nvim-dap-ui
        null-ls-nvim
      ];
      # coc = {
      #   package = with pkgs.vimPlugins; [
      #     coc-nvim
      #     coc-vimtex  
      #     coc-git  
      #     coc-css  
      #     coc-yank  
      #     coc-tabnine  
      #     coc-emmet  
      #     coc-eslint

      #     coc-tsserver   coc-vimtex    coc-git    coc-css    coc-yank    coc-tabnine    coc-emmet    coc-eslint    coc-sumneko-lua    coc-html    coc-snippets    coc-ltex    coc-lists    coc-highlight    coc-prettier    coc-pairs    coc-lua    coc-pyright    coc-phpls    coc-php-cs-fixer    coc-sh    coc-json    coc-texlab    coc-smartf    coc-python
      #     coc-markdownlint
      #   ];
      #   pluginConfig = "";
      # };
      extraConfig = ''
        luafile ~/.config/nixpkgs/home/neovim/lua/settings.lua
        luafile ~/.config/nixpkgs/home/neovim/lua/maps.lua
      '';
    };
  };
}
