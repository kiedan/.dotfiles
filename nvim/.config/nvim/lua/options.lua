local options = {
	clipboard = "",                          -- not "unnamedplus" -> handle system clipboard with Leader+y/p 
	fileencoding = "utf-8",                  -- the encoding written to a file
	ignorecase = true,                       -- ignore case in search patterns
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	undofile = true,                         -- enable persistent undo
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                        -- convert tabs to spaces
	shiftwidth = 2,                          -- the number of spaces inserted for each indentation
	tabstop = 2,                             -- number of spaces inserted for a tab
	relativenumber = true,                   -- set relative numbered lines
	number=true,                             -- show actual linenumber on current line 
	spelllang="en_us,de_de",                 -- configure Languages for Spellchecking
	spell = true,                            -- activate spellchecking
	wrap = false,                            -- display lines as one long line
	scrolloff = 5,                           -- Keep cursor away from edges of screen  
	wildmode="longest:full,full",            -- change autocomplete menu in commandline to horizontal 
	wildignorecase=true,                     -- autocomplete not case-sensitiv

	-- clean ui
	numberwidth=4,
	showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	signcolumn = "yes",                      -- always show signcolumn (left of numbers for diagnostics etc)
	foldcolumn="2",
	winbar = "    %t",                       -- Filename in top-bar (only works with newer neovim versions)
	laststatus=3,
	statusline=" ",
	showtabline=3,
	tabline= " ",
}
vim.opt.wildoptions:remove('pum')
	
-- show Tab Indentation
vim.opt.list=true
vim.opt.lcs='tab:| ,trail:-'

-- default gruvbox theme from .config/nvim/colors file
vim.cmd([[colorscheme original-gruvbox]])

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set sessionoptions+=resize,tabpages,winsize")       -- make sessions remember splits and stuff
vim.cmd "set whichwrap+=<,>,[,],h,l"                  -- cursor jumps to next/prev line when moving with h&l 
vim.cmd("autocmd BufEnter * set formatoptions-=cro")  -- disable automatic newline continuation of comments
vim.cmd(":autocmd CursorHold * echo")                 -- :echo clears (error)messages, triggered  on Cusorhold (defalt 4 sec, use updatetime=2000 for 2sec) 
--vim.cmd("autocmd InsertLeave * set cul")                -- enable cursorline when leaving insert
--vim.cmd("autocmd InsertEnter * set cul!")               -- disable cursorline in insert mode

-- Cursorline on normal mode
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    callback = function()
        vim.opt.cursorline = true
    end,
})
-- No Cursorline in insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
    callback = function()
        vim.opt.cursorline = false
    end,
})

-- Wrap Text for md and txt files 
vim.cmd("autocmd BufRead,BufNewFile   *.txt setlocal wrap linebreak") --
vim.cmd("autocmd BufRead,BufNewFile   *.md setlocal wrap linebreak") --

-- FILE MANAGEMENT --
---------------------
-- BACKUPS
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- AUTO SAVE & READ 
vim.cmd"set autowrite"
vim.cmd"set autowriteall"
-- autosave current file after changes are made (if file is not readonly) ...
vim.cmd("autocmd TextChanged,InsertLeave * if &readonly == 0 && filereadable(bufname('%')) | silent write | endif") --
-- auto-update file if changed elsewhere 
vim.cmd"set autoread"                      -- trigger `autoread` when files changes on disk
vim.cmd("autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif")



-- Configure Netrw Filemanager

----------- I N F O -----------
-- <leader><leader> toggle netrw on the left
-- H: "go back" in history.
-- h: "go up" a directory.
-- l: open a directory or a file.
-- .: toggle the dotfiles.
-- P: close the preview window.
-- L: open a file and close Netrw.
-- d: make directory
-- D: Delete file/directory
-- R: Rename
-- a: add file (%))

vim.cmd ([[
	let g:netrw_banner = 0
	let g:netrw_liststyle = 3
	let g:netrw_browse_split = 4

	let g:netrw_altv = 1
	let g:netrw_winsize = 19
]])

vim.cmd ([[
	augroup netrw_mapping
		autocmd!
		autocmd filetype netrw call NetrwMapping()
	augroup END

	function! NetrwMapping()
		nnoremap <buffer> <C-l> <C-w>l
		nmap <buffer> H u
		nmap <buffer> h -^
		nmap <buffer> l <CR>

		nmap <buffer> . gh
		nmap <buffer> P <C-w>z
		nmap <buffer> a % 
	  " Toggle the mark on a file
		nmap <buffer> <TAB> mf
	  " Unmark all files in the buffer
		nmap <buffer> <S-TAB> mF
		" Copy marked files
  		nmap <buffer> c mc
  		" Copy marked files in the directory under cursor
  		nmap <buffer> C mtmc
  		" Move marked files
  		nmap <buffer> x mm
  		" Move marked files in the directory under cursor
  		nmap <buffer> X mtmm

	endfunction
]])

--vim.keymap.set("n", "<Leader><Leader>", ":Lexplore<CR>")
--vim.keymap.set("n", "<Leader>cd", ":Lexplore %:p:h<CR>")
