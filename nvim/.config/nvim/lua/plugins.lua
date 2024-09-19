-- automatic setup of lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-----   PLUGINS  -------
-- Plugin setup
require("lazy").setup({

	-- local development folder

--	{dir = "~/Dev/plugins/asciifonts.nvim",
--		config = function()
--		  require("asciifonts")
--		end,
--	},
--	{dir = "~/Dev/plugins/telescope-asciifonts",
--		config = function()
--		  require("-asciifonts")
--		end,
--	},


    {},
    {'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' }},
    {'vimwiki/vimwiki',
		init = function()
			vim.g.vimwiki_list = {{path = '~/Nextcloud/Notes',  diary_rel_path = '', syntax = 'markdown', ext = '.md'}}
			vim.keymap.set("", "<Leader>wd", ":VimwikiDiaryIndex<CR>", { silent = true })
			vim.keymap.set("", "<Leader>wg", ":VimwikiDiaryGenerateLinks<CR>", { silent = true })
			vim.keymap.set("", "<Leader><Cr>", ":VimwikiVSplitLink 1<CR>", { silent = true })
			vim.keymap.set("", "<S-CR>", ":VimwikiVSplitLink<CR>", { silent = true })
			vim.cmd("autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks")
		end
	},
	{
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {},
			dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	},
	-- Color Scheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
		opts = ...
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
		  local configs = require("nvim-treesitter.configs")
		  configs.setup({
			  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },
			  sync_install = false,
			  highlight = { enable = true },
			  indent = { enable = true },
			})
			vim.treesitter.language.register('markdown', 'vimwiki') -- needed for markdown plugin to work with vimwiki
		end
	 },

	-- LSP
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
		{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'L3MON4D3/LuaSnip'},
	{"L3MON4D3/LuaSnip",dependencies = { "rafamadriz/friendly-snippets" },},
	{'https://github.com/phelipetls/vim-hugo.git'},
	{ 'nvim-tree/nvim-tree.lua',
		version = "*",
		lazy = false,
		config = function ()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
			  sort = {
				sorter = "case_sensitive",
			  },
			  view = {
				width = 10,
			  },
			  renderer = {
				group_empty = true,
			  },
			  filters = {
				dotfiles = true,
			  },
			})
		end,
	}

})
