"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Vim Setting                                    │
"╰───────────────────────────────────────────────────────────────────────────────╯

"set nocompatible
set encoding=utf-8
"set termencoding=utf-8
set fileencodings=usc-bom,utf-8,cp936,gb18030,big5
set fileencoding=utf-8
"delete the origin menu which may couse problem,generate a new one
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"let $LANG = 'en'  "set message language
"set langmenu=en_US "set menu's language of gvim. no spaces beside '='
"set langmenu=zh_CN
"set helplang=en
winpos 300 50 "设置初始界面位置
set lines=45 columns=100 "设置初始界面大小
"source $VIMRUNTIME/vimrc_example.vim


"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Plugin Setting                                 │
"╰───────────────────────────────────────────────────────────────────────────────╯

call plug#begin('~/vimfiles/plugged')

" Make sure you use single quotes
"Plug 'tpope/vim-fugitive'
"nord主题
Plug 'arcticicestudio/nord-vim'
"challenger-deep主题
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'joshdick/onedark.vim'

"Plug 'JamshedVesuna/vim-markdown-preview'
"base16主题
"Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()

"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Theme Setting                                  │
"╰───────────────────────────────────────────────────────────────────────────────╯
if has('termguicolors')
	set termguicolors
endif
"syntax on
set background=dark
"colorscheme Nord
"colorscheme challenger_deep
colorscheme onedark


"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Airline Setting                                │
"╰───────────────────────────────────────────────────────────────────────────────╯
"https://github.com/vim-airline/vim-airline
"let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 0  "1:enable tabline 0:desable 
let g:airline#extensions#tabline#formatter = 'unique_tail' "tabline format
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Netrw Setting                                  │
"╰───────────────────────────────────────────────────────────────────────────────╯
let g:netrw_liststyle = 3 " 0: thin 1: long 2: wide 3: tree
"let g:netrw_browse_split = 4 " 1: Sex 2: Vex 3: tabnew 4: this

"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Other Setting                                  │
"╰───────────────────────────────────────────────────────────────────────────────╯
"set listchars,use ':set list' to show invisible chars
set lcs=tab:<->,eol:<,space:_,trail:^,extends:>,precedes:v
"detect the fileformats,first dos ,than unix, last mac,if you want to change
"the really fileformat ,use edit ++ff=dos,then write the file
set fileformats=dos,unix
"设置statuline状态栏,laststatus=0 不显示状态栏 1 只有在两个窗口才显示状态栏 2 永远显示状态栏
set laststatus=2
"set statusline content,see :help statusline for help
set statusline=%F%r%h[%{&ff}]%y\ %{&fileencoding}
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
"设置set list特殊字符的显示
"取消instant_markdown自动启动，使用:InstantMarkdownPreview来启动预览


"╭───────────────────────────────────────────────────────────────────────────────╮
"│                                Shotkey Setting                                │
"╰───────────────────────────────────────────────────────────────────────────────╯

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
