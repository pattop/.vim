set nocp
set autoindent
set autoread
set autowrite
set fileformats=unix,dos
set nobackup
set nowrapscan
set incsearch
set ignorecase
set hlsearch
set shortmess=aIoWT
set showmatch
set noswapfile

set tabstop=8
set shiftwidth=8
set softtabstop=4
set shiftround
set smarttab

set cinoptions=(4,u4,U4

set nowrap
syntax on
set updatetime=1000

filetype plugin on

highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "patrick"

highlight Comment	 ctermfg=8						  guifg=#007800					gui=none
highlight Constant	 ctermfg=14			   cterm=none guifg=lightred				gui=none
highlight Identifier ctermfg=6						  guifg=cyan					gui=none
highlight Statement  ctermfg=3			   cterm=none guifg=cyan					gui=none
highlight PreProc	 ctermfg=10						  guifg=cyan					gui=none
highlight Type		 ctermfg=2						  guifg=cyan					gui=none
highlight Special	 ctermfg=12						  guifg=#00AA00					gui=none
highlight Error					ctermbg=9							guibg=#ff0000	gui=none
highlight Todo		 ctermfg=4	ctermbg=3			  guifg=#000080 guibg=#c0c000	gui=none
highlight Directory  ctermfg=2						  guifg=#00c000					gui=none
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff	gui=none
highlight Normal									  guifg=#d0d0d0 guibg=#000000	gui=none
highlight Search				ctermbg=3							guibg=#c0c000	gui=none
highlight Pmenu			guibg=#202040	gui=none
highlight PmenuSel		guibg=#5050A0	gui=none

set gfn=ProggyCleanTT\ 12

let g:bufExplorerFindActive = 0

"Show whitespace errors
highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()
