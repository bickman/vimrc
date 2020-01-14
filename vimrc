"==================================================================
"                              Source
"==================================================================
source $VIMRUNTIME/vimrc_example.vim
"source $HOME/vimfiles/statusline.vim
set nocompatible
set encoding=UTF-8
"set termencoding=utf-8
set fileencodings=usc-bom,utf-8,cp936,gb18030,big5
set fileencoding=UTF-8
"delete the origin menu which may couse problem,generate a new one
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"let $LANG = 'en'  "set message language
"set langmenu=en_US "set menu's language of gvim. no spaces beside '='
"set langmenu=zh_CN
"set helplang=en
set lines=45 columns=100 "设置初始界面大小
winpos 300 50 "设置初始界面位置
"英文字体设置，中文字体需要等宽
"很多中文字体没有等宽，使用system link可以解决这个问题
"set guifont=Sarasa/ Mono/ SC/ 12  " linux should be like this
"中文字体设置,使用 system link忽略此项,字体必需是vim可以识别的中文字体
"set guifontwide=黑体:h12

"set guifont=UbuntuMono_NF:h12
"set guifont=mononoki_NF:h10.5
"set guifont=NotoMono_NF:h10.5
set guifont=Sarasa_Mono_SC_Semibold:h10.5
"设置标签页显示内容
set guitablabel=[%N]\ %t\ %M
set selectmode+=mouse
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove left-hand scroll bar
set guioptions+=b
"set guioptions-=m  "remove menu bar
"set guioptions-=r  "remove right-hand scroll bar

"====================================================================
"                              Vim-plug
"====================================================================

call plug#begin('~/vimfiles/plugged')
Plug 'yianwillis/vimcdoc'
" Make sure you use single quotes
Plug 'tpope/vim-fugitive'
"nord主题
"Plug 'arcticicestudio/nord-vim'
"challenger-deep主题
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
"base16主题
"Plug 'chriskempson/base16-vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
"Plug 'ryanoasis/vim-devicons'
call plug#end()

if has('termguicolors')
	set termguicolors
endif
syntax on
"set background=dark
"colorscheme Nord
"colorscheme challenger_deep
colorscheme onedark
"https://github.com/vim-airline/vim-airline
"let g:airline_theme='onedark'
"let g:airline#extensions#tabline#enabled = 1  "1:enable tabline 0:desable
"let g:airline#extensions#tabline#formatter = 'unique_tail' "tabline format
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"let g:netrw_liststyle = 3 " 0: thin 1: long 2: wide 3: tree
"let g:netrw_browse_split = 4 " 1: Sex 2: Vex 3: tabnew 4: this

"set tabline=%t
"set listchars,use ':set list' to show invisible chars
set lcs=tab:<->,eol:⇣,space:·,trail:^,extends:⇌,precedes:⇇
set list
"detect the fileformats,first dos ,than unix, last mac,if you want to change
"the really fileformat, use edit ++ff=dos,then write the file
set fileformats=dos,unix
"设置statuline状态栏,laststatus=0 不显示状态栏 1 只有在两个窗口才显示状态栏 2 永远显示状态栏
set laststatus=2
"set statusline content,see :help statusline for help
"set statusline=%m%F%r%h[%{&ff}]%y[%{&fileencoding}]%{fugitive#statusline()}%=%-10.(%l,%c%)%P
function! ShowFileType()
	if &filetype!=''
		return &filetype
	else
		return 'ヾ(´ε`ヾ)'
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
			return '(　ﾟ 3ﾟ)'
		endif
	else
		return '(●^_^●)'
	endif
endfunction

set statusline=
set statusline+=%<
set statusline+=%1*\ %F%{ReadOnly()}\ %*
set statusline+=%2*\ %{&ff}\ %*
set statusline+=%3*\ %{&fenc}\ %*
set statusline+=%4*\ %{ShowFileType()}\ %*
set statusline+=%5*\ %{GitInfo()}\ %*
set statusline+=%8*%=%b,0x%B\ %*
set statusline+=%6*\ %l,%c\ %*
set statusline+=%7*\ %p%%\ %*

hi User9 guifg=#282C34 guibg=#B1A1C1
hi User8 guifg=#282C34 guibg=#81A1C1
hi User1 guifg=#282C34 guibg=#BF616A
hi User2 guifg=#282C34 guibg=#D08770
hi User3 guifg=#282c34 guibg=#EBCB8B
hi User4 guifg=#282c34 guibg=#A3BE8C
hi User5 guifg=#282c34 guibg=#8FBCBB
hi User6 guifg=#282c34 guibg=#5E81AC
hi User7 guifg=#282c34 guibg=#B48EAD

"鼠标选择模式，在normal或者insert模式下用鼠标拖拽选择，再点击，选择部分会被点击字母替换
set selectmode+=mouse
set nowrap
"显示行数
set nu
"设置tab键的长度
set tabstop=4
"设置每层缩进的空格数
set sw=4
"设置自动缩进
set nosi
"搜索忽略大小写
set ic
"搜索高亮和递增显示，取消高亮：nohls
set nohls is

set nowrap
"取消缓存文件
set nobackup
set noundofile
set noswapfile
filetype plugin on
cd ~\desktop


"<F2>打开配置文件
nnoremap <F2> :tabnew $MYVIMRC<CR>
"<F3>重新载入配置文件
nnoremap <F3> :source $MYVIMRC<CR>
"nnoremap <C-o> :browse tabnew<CR>
" Open markdown files with Chrome.
"win10 press <F5> to open chrome to view md file
autocmd BufEnter *.md exe 'noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>'
"mac press <F5> to open chrome to view md file
"autocmd BufEnter *.md exe 'noremap <F5> :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>'
