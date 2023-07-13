-- local compare = require('cmp.config.compare')
-- local types = require('cmp.types')
-- 
-- local WIDE_HEIGHT = 40
-- 
-- ---@return cmp.ConfigSchema
-- return function()
--   ---@type cmp.ConfigSchema
--   local config = {
--     enabled = function()
--       local disabled = false
--       disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt')
--       disabled = disabled or (vim.fn.reg_recording() ~= '')
--       disabled = disabled or (vim.fn.reg_executing() ~= '')
--       return not disabled
--     end,
-- 
--     performance = {
--       debounce = 60,
--       throttle = 30,
--       fetching_timeout = 500,
--     },
-- 
--     preselect = types.cmp.PreselectMode.Item,
-- 
--     mapping = {},
-- 
--     snippet = {
--       expand = function(_)
--         error('snippet engine is not configured.')
--       end,
--     },
-- 
--     completion = {
--       autocomplete = {
--         types.cmp.TriggerEvent.TextChanged,
--       },
--       completeopt = 'menu,menuone,noselect',
--       keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
--       keyword_length = 1,
--     },
-- 
--     formatting = {
--       expandable_indicator = true,
--       fields = { 'abbr', 'kind', 'menu' },
--       format = function(_, vim_item)
--         return vim_item
--       end,
--     },
-- 
--     matching = {
--       disallow_fuzzy_matching = false,
--       disallow_partial_matching = false,
--       disallow_prefix_unmatching = false,
--     },
-- 
--     sorting = {
--       priority_weight = 2,
--       comparators = {
--         compare.offset,
--         compare.exact,
--         -- compare.scopes,
--         compare.score,
--         compare.recently_used,
--         compare.locality,
--         compare.kind,
--         -- compare.sort_text,
--         compare.length,
--         compare.order,
--       },
--     },
-- 
--     sources = {},
-- 
--     confirmation = {
--       default_behavior = types.cmp.ConfirmBehavior.Insert,
--       get_commit_characters = function(commit_characters)
--         return commit_characters
--       end,
--     },
-- 
--     event = {},
-- 
--     experimental = {
--       ghost_text = false,
--     },
-- 
--     view = {
--       entries = { name = 'custom', selection_order = 'top_down' },
--     },
-- 
--     window = {
--       completion = {
--         border = { '', '', '', '', '', '', '', '' },
--         winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
--         scrolloff = 0,
--         col_offset = 0,
--         side_padding = 1,
--         scrollbar = true,
--       },
--       documentation = {
--         max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
--         max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
--         border = { '', '', '', ' ', '', '', '', ' ' },
--         winhighlight = 'FloatBorder:NormalFloat',
--       },
--     },
--   }
--   return config
-- end



--------- end of the configuration -----------


local cmp = require('cmp')
local kind = require('lspkind')
local devicons = require('nvim-web-devicons')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
               and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                   col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),mode, true)
end

  cmp.register_source('devicons', {
    complete = function(self, params, callback)
      local items = {}
      for _, icon in pairs(devicons.get_icons()) do
        table.insert(items, {
          label = icon.icon .. '  ' .. icon.name,
          insertText = icon.icon,
          filterText = icon.name,
       })
      end
      callback({ items = items })
    end,
  })

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = kind.presets.default[vim_item.kind]
        vim_item.menu = ({
              nvim_lsp = "[LSP]",
              look = "[Dict]",
              buffer = "[Buffer]"
            })[entry.source.name]
      return vim_item
    end
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
              cmp.complete()
          else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
      end, {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
              cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
          end
      end, {"i", "s"})
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, 
    {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, 
    {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['astro'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['emmet_ls'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }



























-- -- nauval neovim configuration : github:nauvalazhar --
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
-- 	return
-- end
-- 
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
-- 	return
-- end
-- 
-- require("luasnip/loaders/from_vscode").lazy_load()
-- 
-- local check_backspace = function()
-- 	local col = vim.fn.col(".") - 1
-- 	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
-- 
-- --   פּ ﯟ   some other good icons
-- local kind_icons = {
-- 	Class = " ",
-- 	Color = " ",
-- 	Constant = "ﲀ ",
-- 	Constructor = " ",
-- 	Enum = "練",
-- 	EnumMember = " ",
-- 	Event = " ",
-- 	Field = " ",
-- 	File = "",
-- 	Folder = " ",
-- 	Function = " ",
-- 	Interface = "ﰮ ",
-- 	Keyword = " ",
-- 	Method = " ",
-- 	Module = " ",
-- 	Operator = "",
-- 	Property = " ",
-- 	Reference = " ",
-- 	Snippet = " ",
-- 	Struct = " ",
-- 	Text = " ",
-- 	TypeParameter = " ",
-- 	Unit = "塞",
-- 	Value = " ",
-- 	Variable = " ",
-- }
-- -- find more here: https://www.nerdfonts.com/cheat-sheet
-- 
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body) -- For `luasnip` users.
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<C-k>"] = cmp.mapping.select_prev_item(),
-- 		["<C-j>"] = cmp.mapping.select_next_item(),
-- 		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
-- 		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
-- 		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
-- 		["<C-e>"] = cmp.mapping({
-- 			i = cmp.mapping.abort(),
-- 			c = cmp.mapping.close(),
-- 		}),
-- 		-- Accept currently selected item. If none selected, `select` first item.
-- 		-- Set `select` to `false` to only confirm explicitly selected items.
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 		["<Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_next_item()
-- 			elseif luasnip.expandable() then
-- 				luasnip.expand()
-- 			elseif luasnip.expand_or_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			elseif check_backspace() then
-- 				fallback()
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 			"i",
-- 			"s",
-- 		}),
-- 		["<S-Tab>"] = cmp.mapping(function(fallback)
-- 			if cmp.visible() then
-- 				cmp.select_prev_item()
-- 			elseif luasnip.jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			else
-- 				fallback()
-- 			end
-- 		end, {
-- 			"i",
-- 			"s",
-- 		}),
-- 	},
-- 	formatting = {
-- 		fields = { "kind", "abbr", "menu" },
-- 		format = function(entry, vim_item)
-- 			-- Kind icons
-- 			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
-- 			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
-- 			vim_item.menu = ({
-- 				nvim_lsp = "[LSP]",
-- 				nvim_lua = "[NVIM_LUA]",
-- 				luasnip = "[Snippet]",
-- 				buffer = "[Buffer]",
-- 				path = "[Path]",
-- 			})[entry.source.name]
-- 			return vim_item
-- 		end,
-- 	},
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "nvim_lua" },
-- 		{ name = "luasnip" },
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 	},
-- 	confirm_opts = {
-- 		behavior = cmp.ConfirmBehavior.Replace,
-- 		select = false,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	experimental = {
-- 		ghost_text = false,
-- 		native_menu = false,
-- 	},
-- })
