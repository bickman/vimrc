function! GetFileName()
	let FileName=@%
	if FileName!=''
		return FileName
	else
		return 'NoFile'
	endif
endfunction

function! GetDir()
	let DirName=getcwd()
	return DirName
endfunction

function! ShowFileType()
	if &filetype!=''
		return &filetype
	else
		return 'NoType'
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ' '
  else
    return ''
endfunction


function! GitInfo()
	if exists('g:loaded_fugitive')
		let GitInfo = FugitiveHead()
		if GitInfo!= ''
			return ' '.FugitiveHead()
		else
			return 'NoGit'
		endif
	else
		return 'NoFugitive'
	endif
endfunction

let g:currentWin=winnr()
autocmd WinEnter * let g:currentWin=winnr()

function! Active()
	let l:winnu=winnr()
	if l:winnu==g:currentWin
		return '(●^_^●'
	else
		return '( ╥_╥'
	endif
endfunction

let g:currentmode={
	\ 'n'      : 'Normal ',
	\ 'no'     : 'N·Operator Pending ',
	\ 'v'      : 'Visual ',
	\ 'V'      : 'V·Line ',
	\ ''     : 'V·Block ',
	\ 's'      : 'Select ',
	\ 'S'      : 'S·Lie ',
	\ ''     : 'S·Block ',
	\ 'i'      : 'Insert ',
	\ 'R'      : 'Replace ',
	\ 'Rv'     : 'V·Replace ',
	\ 'c'      : 'Command ',
	\ 'cv'     : 'Vim Ex ',
	\ 'ce'     : 'Ex ',
	\ 'r'      : 'Prompt ',
	\ 'rm'     : 'More ',
	\ 'r?'     : 'Confirm ',
	\ '!'      : 'Shell ',
	\ 't'      : 'Terminal '
	\}
set statusline=
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}%*
"set statusline+=%2*%<\ %{GetDir()}\ %*
set statusline+=%2*\ %{GetFileName()}%{ReadOnly()}\ %*
set statusline+=%3*\ %{ShowFileType()}\ %*
set statusline+=%4*\ %{Active()}%=)\ %*
set statusline+=%5*\ %{GitInfo()}\ %*
set statusline+=%6*\ %{&ff}\ %*
set statusline+=%7*\ %{&fenc}\ %*
set statusline+=%8*\ %3l,%-3c\ %*
set statusline+=%9*\ %3p%%\ %*

hi Statusline guifg=#ffffff guibg=#282c34
hi StatuslineNC guifg=#282c34 guibg=#282c34

hi User1 guifg=#ffffff guibg=#BF616A
hi User2 guifg=#ffffff guibg=#D08770
hi User3 guifg=#ffffff guibg=#EBCB8B
hi User4 guifg=#ffffff guibg=#A3BE8C
hi User5 guifg=#ffffff guibg=#8FBCBB
hi User6 guifg=#ffffff guibg=#88C0D0
hi User7 guifg=#ffffff guibg=#81A1C1
hi User8 guifg=#ffffff guibg=#5E81AC
hi User9 guifg=#ffffff guibg=#B48EAD
