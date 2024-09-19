
local builtin = require('telescope.builtin')

-- KEYMAPS
vim.keymap.set('n', '<Leader>fn', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>wf', function() require("telescope.builtin").live_grep({ prompt_title = "Nextcloud/Notes", path_display = { "smart" }, search_dirs = { "$HOME/Nextcloud/Notes" }, }) end, { desc = "Find in Notes" })
vim.keymap.set('n', '<Leader>vf', function() require("telescope.builtin").live_grep({ prompt_title = ".config/nvim", path_display = { "smart" }, search_dirs = { "$HOME/.config/nvim", "$HOME/.local/share/nvim/lazy" }, }) end, { desc = "Find Neovim Files" })
vim.keymap.set('n', '<Lader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader><Tab>', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fr', builtin.registers, {})
