let g:currentmode={
	\ 'n'      : 'NORMAL',
	\ 'no'     : 'N·OPERATOR PENDING',
	\ 'v'      : 'VISUAL',
	\ 'V'      : 'V·LINE',
	\ ''     : 'V·BLOCK',
	\ 's'      : 'SELECT',
	\ 'S'      : 'S·LIE',
	\ ''     : 'S·BLOCK',
	\ 'i'      : 'INSERT',
	\ 'R'      : 'REPLACE',
	\ 'Rv'     : 'V·REPLACE',
	\ 'c'      : 'COMMAND',
	\ 'cv'     : 'VIM EX',
	\ 'ce'     : 'EX',
	\ 'r'      : 'PROMPT',
	\ 'rm'     : 'MORE',
	\ 'r?'     : 'CONFIRM',
	\ '!'      : 'SHELL',
	\ 't'      : 'TERMINAL'
	\}

function ShowMode()
	if winnr()==g:currentWin
		return '  '.g:currentmode[mode()].' '
	else
		return ''
	endif
endfunction

function! GetFileName()
	let FileName=@%
	if FileName!=''
		return toupper('  '.FileName.'  ')
	else
		return ' 未命名 '
	endif
endfunction

function! ReadOnly()
	if &readonly || !&modifiable
		return '  '
	else
		return ''
endfunction

function! GetDir()
	let DirName=getcwd()
	return DirName
endfunction

function! ShowFileType()
	if &filetype!=''
		return toupper('  '.&filetype.' ')
	else
		return ''
endfunction

function! GitInfo()
	if exists('g:loaded_fugitive')
		let GitInfo = FugitiveHead()
		if GitInfo!= ''
			return '   '.FugitiveHead().'  '
		else
			return ''
		endif
	else
		return ''
	endif
endfunction


function! GetEncode()
	return toupper('  '.&fenc.'  ')
endfunction

function! GetEndingType()
	return toupper(' '.&ff.' ')
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


"hi NCo guifg=Black guibg=#ffffff
"hi ICo guifg=Black guibg=#BF616A 
"hi RCo guifg=Black guibg=#EBCB8B
"hi VCo guifg=Black guibg=#8FBCBB

set statusline=
"set statusline+=%#NCo#%{(mode()=='n'&&winnr()==g:currentWin)?'\ \ NORMAL\ ':''}
"set statusline+=%#ICo#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#RCo#%{(mode()=='R')?'\ \ REPLACE\ ':''}
"set statusline+=%#VCo#%{(mode()=='v')?'\ \ VISUAL\ ':''}%*
set statusline+=%{ShowMode()}
set statusline+=%<
set statusline+=%{GetFileName()}%{ReadOnly()}
"set statusline+=%f%{ReadOnly()}
set statusline+=%{GitInfo()}
set statusline+=%=
set statusline+=%{ShowFileType()}
set statusline+=%{GetEncode()}
set statusline+=%{GetEndingType()}
set statusline+=%4l,%-4.c%-4P

hi Statusline guifg=#111111 guibg=white
hi StatuslineNC guifg=#555555 guibg=#777777

"hi User1 guifg=#ffffff guibg=#BF616A
"hi User2 guifg=#ffffff guibg=#D08770
"hi User3 guifg=#ffffff guibg=#EBCB8B
"hi User4 guifg=#ffffff guibg=#A3BE8C
"hi User5 guifg=#ffffff guibg=#8FBCBB
"hi User6 guifg=#ffffff guibg=#88C0D0
"hi User7 guifg=#ffffff guibg=#81A1C1
"hi User8 guifg=#ffffff guibg=#5E81AC
"hi User9 guifg=#ffffff guibg=#B48EAD
