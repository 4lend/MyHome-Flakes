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
  mix = with pkgs; [
    rnix-lsp nixfmt 
    sumneko-lua-language-server
    lua51Packages.lua-lsp
    sumneko-lua-language-server stylua
    adoptopenjdk-bin
    lua-language-server
  ];
in
{
  config = {
    home.packages = node ++ php ++ mix;
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = false;
      coc.pluginConfig = "coc-vimtex  coc-git  coc-css  coc-yank  coc-tabnine  coc-emmet";
      extraLuaConfig = ''
        guifontset = "JetBrainsMono NFM";
      '';
      # # coc.pluginConfig = {
      # "languageserver": {
      #   "go": {
      #     "command": "gopls",
      #     "rootPatterns": ["go.mod"],
      #     "trace.server": "verbose",
      #     "filetypes": ["go"]
      #   };
      # };
      plugins = with pkgs.vimPlugins; [ 
        # coc-sumneko-lua
        vim-nix
        plenary-nvim
        cmp-nvim-lsp
        cmp-path
        cmp-git
        cmp-vsnip
        auto-pairs
        vim-vsnip
        vim-css-color  # A very fast, multi-syntax context-sensitive color name highlighter
        # vimwiki
        vimtex
        # coc-vimtex
        # language
        html5-vim
        # emmet-vim
        # coc-emmet
        vim-surround
        nvim-surround
        # coc-html
        # vim-lightline
        vim-html-template-literals
        # coc-snippets
        vim-snippets
        snippets-nvim
        vim-lsp-snippets
        friendly-snippets
        goyo-vim
        vim-markdown
        # # coc-markdownlint
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
        awesome-vim-colorschemes
        papercolor-theme
        aurora
        vim-easy-align
        # vim-easytags  # problem
        vim-easymotion
        vim-easygit
        nvim-comment
        comment-nvim
        plenary-nvim
        octo-nvim
        nvim-ts-autotag
        cmp-nvim-tags
        vim-tmux-navigator
        tmux-nvim
        telescope-vim-bookmarks-nvim
        vim-wordmotion
        # coc-nvim
        ChatGPT-nvim
        nvim-treesitter-parsers.latex
        cmp-latex-symbols 
        # # coc-ltex  # problem
        latex-box
        compe-latex-symbols
        # codeium-vim
        vim-numbertoggle
        vim-togglelist
        nvim-autopairs
        ### vimfile ###
        { 
          plugin = Vundle-vim;
          config = '' 
            call vundle#begin()
              Plugin 'nikvdp/neomux'
              Plugin 'dbeniamine/cheat.sh-vim'
              Plugin 'cometsong/CommentFrame.vim'
            call vundle#end()
            filetype plugin indent on
          '';
        }
        ### neovim luafile ### 
        
          { plugin = lualine-nvim;
          config = ''
            luafile ~/.config/nixpkgs/home/neovim/lua/config/lualine.lua
          ''; }
        
        
          { plugin = nvim-tree-lua;
          config = '' 
            luafile ~/.config/nixpkgs/home/neovim/lua/config/tree.lua
          ''; }
        
        
          { plugin = nvim-cmp;
          config = ''
            luafile ~/.config/nixpkgs/home/neovim/lua/config/cmp.lua
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
        
        
          { plugin = nordic-nvim;
          config = ''
            luafile ~/.config/nixpkgs/home/neovim/lua/config/nordic.lua
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
        
        # 
        #   { plugin = themer-nvim;
        #   config = ''
        #     luafile ~/.config/nixpkgs/home/neovim/lua/config/themer.lua
        #   ''; }
        # 
        
          { plugin = lazy-nvim;
          config = ''
            luafile ~/.config/nixpkgs/home/neovim/lua/config/lazy-nvim.lua
          ''; }
        
        
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
        
        
          { plugin = coc-nvim;
          config = ''
            luafile ~/.config/nixpkgs/home/neovim/lua/config/coc-nvim.lua
          ''; }

      ];
      extraConfig = ''
        luafile ~/.config/nixpkgs/home/neovim/lua/settings.lua
        luafile ~/.config/nixpkgs/home/neovim/lua/maps.lua
      '';
    };
  };
}
