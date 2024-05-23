-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
  return
end

-- required to make 'friendly snippets' work with luasnip snippet engine
require("luasnip.loaders.from_vscode").lazy_load()

-- used for smoother 'Super-Tab' functionality


local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
	snippet = {
	  expand = function(args)
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  end,
	},
	window = {
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-o>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

		---------- 'Super Tab' Setup ------------
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
		  "i",
		  "s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
		  "i",
		  "s",
		}),
		------- End of 'Super Tab' Setup ---------
	}),
	sources = cmp.config.sources({
	{ name = "nvim_lsp" }, -- LSP
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within the current buffer
    { name = "path" }, -- file system paths
    { name = "cmdline" }, -- file system paths
	}),

-- disable completion popup for text files
vim.api.nvim_create_autocmd('FileType', {
  desc = "Modifies cmp for text-focused filetypes",
  callback = function(ev)
    if not vim.tbl_contains({'markdown'}, ev.match) then return end
		require("cmp").setup.buffer({ completion = {autocomplete = false}})
    vim.keymap.set('i', '<C-x><C-o>', cmp.complete, {buffer = ev.buf})
  end
})

})


