set encoding=UTF-8
"set termencoding=utf-8
set fileencodings=usc-bom,utf-8,cp936,gb18030,big5
set fileencoding=UTF-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"let $LANG = 'en'  "set message language
"set langmenu=en_US "set menu's language of gvim. no spaces beside '='
"set langmenu=zh_CN
"set helplang=en
set lines=45 columns=100
winpos 300 50
source $VIMRUNTIME/vimrc_example.vim

"========================================================================================
"                                        Vim-plug
"========================================================================================

call plug#begin('~/vimfiles/plugged')
Plug 'yianwillis/vimcdoc'
Plug 'tpope/vim-fugitive'
"Plug 'arcticicestudio/nord-vim'
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

"==========================================================================================
"                                        Colortheme Setting
"==========================================================================================
if has('termguicolors')
	set termguicolors
endif
"colorscheme Nord
"colorscheme challenger_deep
colorscheme onedark
"===========================================================================================
"                                        Airline Setting
"===========================================================================================
"let g:airline_theme='onedark'
"let g:airline#extensions#tabline#enabled = 1  "1:enable tabline 0:desable
"let g:airline#extensions#tabline#formatter = 'unique_tail' "tabline format
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1


"let g:netrw_liststyle = 3 " 0: thin 1: long 2: wide 3: tree
"let g:netrw_browse_split = 4 " 1: Sex 2: Vex 3: tabnew 4: this

set lcs=tab:<->,eol:⇣,space:·,trail:^,extends:⇌,precedes:⇇
set list
"detect the fileformats,first dos ,than unix, last mac,if you want to change
"the really fileformat, use edit ++ff=dos,then write the file
set fileformats=dos,unix
set laststatus=2
"set statusline content,see :help statusline for help
"set statusline=%m%F%r%h[%{&ff}]%y[%{&fileencoding}]%{fugitive#statusline()}%=%-10.(%l,%c%)%P

set selectmode+=mouse
set nowrap
set nu
set tabstop=4
set sw=4
set nosi
set ic
set nohls is

set nowrap
set nobackup
set noundofile
set noswapfile
"==========================================================================================
"                                        Statusline Setting
"==========================================================================================
source $HOME/vimfiles/statusline.vim
cd $HOME
set shell=powershell
"==========================================================================================
"                                        GUI Setting
"==========================================================================================
"set guifont=Sarasa/ Mono/ SC/ 12  " linux should be like this
set guifont=Sarasa_Mono_SC_Semibold:h10.5

set guitablabel=[%N]\ %t\ %M
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=b  "remove bottom scroll bar
set guioptions-=m  "remove menu bar
set guioptions-=r  "remove right-hand scroll bar
"==========================================================================================
"                                        Shotkey Setting
"==========================================================================================
nnoremap <F2> :edit! $MYVIMRC<CR>
nnoremap <F3> :source $MYVIMRC<CR>
"nnoremap <C-o> :browse tabnew<CR>
"Open markdown files with Chrome.
"win10 press <F5> to open chrome to view md file
autocmd BufEnter *.md,*.html exe 'noremap <F5> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %:p<CR>'
"mac press <F5> to open chrome to view md file
"autocmd BufEnter *.md exe 'noremap <F5> :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>
nnoremap <F10> :exec 'vert term python %'<cr>
