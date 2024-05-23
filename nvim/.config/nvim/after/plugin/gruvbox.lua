
-- set all bars background to bg color
vim.cmd ([[
	hi clear StatusLine
	hi clear TabLineFill
	hi clear SignColumn
	hi clear FoldColumn
	hi MsgArea guifg=#504945
	hi WinBar guifg=#504945
	hi clear WinBarNC
	hi EndOfBuffer guifg=bg
	hi LineNr guifg=#504945
	hi VertSplit guibg=bg guifg=#3c3836
	hi clear DiagnosticSignHint 
	hi clear DiagnosticSignWarn
	hi clear DiagnosticSignError
	hi clear DiagnosticSignOk
]])

vim.cmd ([[
	  hi link VimwikiHeader1 GruvboxOrangeBold
	  hi link VimwikiHeader2 GruvboxAquaBold
	  hi link VimwikiHeader3 GruvboxBlueBold
	  hi link VimwikiHeader4 GruvboxPurpleBold
	  hi link VimwikiHeader5 GruvboxGreenBold
	  hi link VimwikiHeader6 GruvboxYellowBold
]])
