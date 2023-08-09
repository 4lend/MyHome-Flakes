-- r17x
local present, cmp = pcall(require, "cmp")

if not present then
	return
end

local presentCodeium, codeium = pcall(require, "codeium")

if not presentCodeium then
	return
end

codeium.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			local icons = {
				Class = " ",
				Color = " ",
				Constant = " ",
				Constructor = " ",
				Codeium = "",
				Enum = "了 ",
				EnumMember = " ",
				Field = "ï",
				File = " ",
				Folder = " ",
				Function = " ",
				Interface = "ﰮ ",
				Keyword = " ",
				Method = "ƒ ",
				Module = " ",
				Property = " ",
				Snippet = "﬌ ",
				Struct = " ",
				Text = " ",
				Unit = " ",
				Value = " ",
				Variable = " ",
			}

			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				nvim_lsp = require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype, { default = true })
					or "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[BUF]",
				codeium = "[AI]",
			})[entry.source.name]

			return vim_item
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1)
			else
				fallback()
			end
		end,
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "codeium" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})






















-- personal
-- local nvim_lsp = require('lspconfig')
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
-- nvim_lsp.tsserver.setup {
--   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
-- }
-- 
-- nvim_lsp.pyright.setup {
--   filetypes = { "python" }
-- }
-- 
-- nvim_lsp.html.setup {
--   capabilities = capabilities,
--   filetypes = { "html" }
-- }
-- 
-- nvim_lsp.astro.setup {
--   capabilities = capabilities,
--   filetypes = { "astro" }
-- }
-- 
-- nvim_lsp.phpactor.setup {
--   capabilities = capabilities,
--   filetypes = { "php" }
-- }
-- 
-- nvim_lsp.emmet_ls.setup{
--   -- filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" }
--   filetypes = { "html", "css" }
-- }
-- 
-- -- nvim_lsp.tailwindcss.setup{
-- --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
-- -- }
-- -- 
-- -- nvim_lsp.eslint.setup{
-- --   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
-- -- }
-- 
-- nvim_lsp.rnix.setup{}
-- 
-- nvim_lsp.lua_ls.setup{}
-- 
-- 
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
-- 
-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = '',
--   }
-- })
