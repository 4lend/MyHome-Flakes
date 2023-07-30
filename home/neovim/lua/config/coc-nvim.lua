vim.cmd('let g:coc_global_extensions = [ "coc-tsserver", "coc-vimtex", "coc-git", "coc-css", "coc-yank", "coc-tabnine", "coc-emmet", "coc-eslint", "coc-sumneko-lua", "coc-html", "coc-snippets", "coc-ltex", "coc-lists", "coc-highlight", "coc-prettier", "coc-pairs", "coc-spell-checker", "coc-lua", "coc-pyright", "coc-phpls", "coc-php-cs-fixer", "coc-tighten-lint", "coc-sh", "coc-json", "coc-texlab", "coc-smartf", "coc-python", ]')

-- vim.cmd('let g:coc_global_extensions = [ "coc-tsserver", "coc-vimtex", "coc-git", "coc-css", "coc-yank", "coc-tabnine", "coc-emmet", "coc-eslint", "coc-sumneko-lua", "coc-html", "coc-snippets", "coc-ltex", "coc-lists", "coc-highlight", "coc-prettier", "coc-pairs", "coc-spell-checker", "coc-lua", "coc-pyright", "coc-nix", "coc-phpls", "coc-intelephense", "coc-php-cs-fixer", "coc-tighten-lint", "coc-phpstan", "coc-laravel", ]')

vim.cmd('autocmd FileType php call coc#activate()')

vim.cmd('autocmd FileType javascript,javascriptreact,typescript,typescriptreact CocStart')

vim.cmd('autocmd BufEnter * if &filetype == "typescript" | CocCommand("tsserver.fixAll") | endif')
