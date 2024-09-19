-- ▌              
-- ▙▘█▌▌▌▛▛▌▀▌▛▌▛▘
-- ▛▖▙▖▙▌▌▌▌█▌▙▌▄▌
--     ▄▌     ▌   

----------- LEADER KEY NAME SPACES -------------
-- Leader-A: ASCII FONTS 
-- Leader-B:
-- Leader-C:
-- Leader-D: DELETE WITHOUT COPY 
-- Leader-E:
-- Leader-F: FIND     (Mostly Telescope -> ../after/plugins/telescope.lua) 
-- Leader-G:
-- Leader-H: PREV BUFFER 
-- Leader-I:
-- Leader-J:
-- Leader-K:
-- Leader-L: NEXT BUFFER 
-- Leader-M:
-- Leader-N: NOTES     (mostly VimWiki) 
-- Leader-O: OPEN LINES (without insert)
-- Leader-P: PASTE (+) (paste from clipboard) 
-- Leader-Q: QUIT 
-- Leader-R: RELOAD 
-- Leader-S: SHOW      (toggle interface options) 
-- Leader-T: TERMINAL 
-- Leader-U:
-- Leader-V:
-- Leader-W: WIMWIKI 
-- Leader-X:
-- Leader-Y: YANK TO + (copy to system clipboard)) 
-- Leader-Z:
-- Leader-/: FIND AND REPLACE
------------------------------------------------------

-- Remap space as leader key
vim.keymap.set("n", "<Space>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open File Tree
vim.keymap.set("n", "<Leader><Leader>", ":NvimTreeToggle<CR>")

-- open Netrw Filetree
vim.keymap.set("n", "<leader>tt", ":Ex<CR>")

-- unset the 'last search pattern' register on return
vim.keymap.set("n", "<CR>", ":nohlsearch<CR><CR>")

-- don't replace clipboard when pasting over selection
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
-- access system clipboard
vim.keymap.set("n", "<Leader>p", "\"+p")
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")
vim.keymap.set("i", "<C-v>", "\"+p")
vim.keymap.set("i", "<C-c>", "\"+y")

-- delete without copy
vim.keymap.set("n", "<Leader>d", "\"_d")
vim.keymap.set("v", "<Leader>d", "\"_d")

-- better j and k movement in documents with linebreak
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<down>", "gj")
vim.keymap.set("n", "<up>", "gk")
vim.keymap.set("i", "<down>", "<Esc>gji")
vim.keymap.set("i", "<up>", "<Esc>gki")

-- center line on screen after jumping up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- alternative redo command
vim.keymap.set("n", "<S-U>", "<C-r>")

-- Tabsstops --
vim.keymap.set("n", "<Tab>", ">>_")
vim.keymap.set("n", "<S-Tab>", "<<_")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Move current line up and down  
vim.keymap.set("n", "<S-C-down>", ":move +1<CR>")
vim.keymap.set("n", "<S-C-up>", ":move -2<CR>")
vim.keymap.set("v", "<S-C-down>", ":move '>+1<CR>gv=gv' ")
vim.keymap.set("v", "<S-C-up>", ":move '<-2<CR>gv=gv' ")

-- Entering blank lines without going into insert
vim.keymap.set("n", "<Leader>o", "o<Esc>k")
vim.keymap.set("n", "<Leader>O", "O<Esc>j")

-- Alternative for juimping to begin/end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "L", "$")
vim.keymap.set("x", "H", "^")
vim.keymap.set("x", "L", "$")
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "$")
vim.keymap.set("v", "H", "^")

-- alternative save command
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- select all 
vim.keymap.set("n", "<C-a>", "ggVG")

-- BUFFER AND SPLIT NAVIGATION

-- Move to previous/next buffer
vim.keymap.set('n', '<C-h>', ':bp<cr>', { silent = true })
vim.keymap.set('n', '<C>', ':bn<CR>', { silent = true })

-- Better navigation through splits
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")

-- Split control
vim.keymap.set("n", "<Leader>+", "<C-w>v")
vim.keymap.set("n", "<Leader>-", "<C-w>s")
vim.keymap.set("n", "<Leader>x", "<C-w>q")

vim.keymap.set("n", "<Leader><left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<Leader><up>", ":resize +5<CR>")
vim.keymap.set("n", "<Leader><right>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<Leader><down>", ":resize -5<CR>")

-- close all buffers and exit vim 
vim.keymap.set("n", "<Leader>qq", ":qa!<CR>")

-- close buffer and switch to the next (if more than one exists) 
vim.keymap.set("n", "<Leader>q", ":let bnum=len(getbufinfo({'buflisted':1}))|if bnum>1|bp|bw#|else|bw|endif<CR><CR>", { silent = true })

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>")

-- Press jj fast to escape to normal mode
vim.keymap.set("i", "jj", "<ESC>")

-- Replace all instances highlighted section(v) or word under cursor(n)  
vim.keymap.set("v", "<leader>/", "\"zy:%s/<C-r>z//g<left><left>")
vim.keymap.set("n", "<leader>/", "\"zyiw:%s/<C-r>z//g<left><left>")

-- Automatically close brackets, parethesis, and quotes
-- vim.keymap.set("i", "'", "''<left>")
-- vim.keymap.set("i", "\"", "\"\"<left>")
-- vim.keymap.set("i", "(", "()<left>")
-- vim.keymap.set("i", "[", "[]<left>")
-- vim.keymap.set("i", "{", "{}<left>")
-- vim.keymap.set("i", "{;", "{};<left><left>")
-- vim.keymap.set("i", "/*", "/**/<left><left>")

-- <LEADER>S -> SHOW / HIDE Mappings
vim.keymap.set("", "<Leader>ss", ":set spell!<CR>") -- (show spell) toggle spellchecking
vim.keymap.set("", "<Leader>st", ":set list!<CR>")  -- (show tab) toggle Tab/Whitespace Symbols
vim.keymap.set("", "<Leader>sn", ":exec &nu==&rnu? 'se nu!' : 'se rnu!'<CR>") -- (show numbers) Toggle Line Number Settings

-- Terminal mode
vim.keymap.set("n", "<Leader>t", ":split term://zsh<CR>i")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]) -- use Esc to enter Normal mode inside Terminal
vim.keymap.set("t", "<Leader>q", [[<C-\><C-n>:bd!<CR>]], { silent = true }) -- "close terminal" (delete buffer)

-- disable jump commands that I often hit accidentally
--vim.keymap.set("i", "^", "<ESC>")
vim.keymap.set("", "<PageUp>", "")
vim.keymap.set("", "<PageDown>", "")
vim.keymap.set("", "<S-up>", "")
vim.keymap.set("", "<S-down>", "")

-- Ascii Font Shortcuts
vim.keymap.set("n", "<Leader>am", ":.!figlet -f miniwi<CR>")
vim.keymap.set("n", "<Leader>ac", ":.!figlet -f Cybermedium<CR>")
vim.keymap.set("n", "<Leader>ad", ":.!figlet -f Doom<CR>")



-- VimWiki Notes 
vim.keymap.set("n", "<Leader>ni", ":VimwikiDiaryIndex<CR>", { silent = true })
vim.keymap.set("n", "<Leader>nn", ":VimwikiMakeDiaryNote<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ng", ":VimwikiDiaryGenerateLinks<CR>", { silent = true })
vim.keymap.set("", "<Leader>nt", "@<Plug>VimwikiDiaryNextDay", { silent = true })
vim.keymap.set("", "<Leader>np", "@<Plug>VimwikiDiaryPrevDay", { silent = true })
vim.keymap.set("", "<Leader>nx", ":VimwikiDeleteFile<CR>", {})
vim.keymap.set("", "<Leader>nr", ":VimwikiRenameFile<CR>", {})
vim.keymap.set("", "<Leader><CR>", ":VimwikiVSplitLink reuse <bar> :vertical resize +30<CR>", {})
vim.keymap.set("n", "<Leader>td", ":e ~/Nextcloud/Notes/todo.txt<CR>", { silent = true })
