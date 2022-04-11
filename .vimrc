set nocompatible              " be iMproved, required
filetype off                  " required

" to reinstall vundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
"
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" Plugin 'file:///home/patrick/src/patrick/netrw'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://github.com/jlanzarotta/bufexplorer'
Plugin 'https://github.com/rhysd/vim-clang-format'
" Plugin 'https://github.com/felipec/notmuch-vim'
" Plugin 'https://github.com/imain/notmuch-vim'
" Plugin 'https://github.com/Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
filetype indent off
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




set autoindent
set autoread
set autowrite
set fileformats=unix,dos
set nowrapscan
set incsearch
set ignorecase
set hlsearch
set smartcase
set shortmess=aIoWT
set showmatch
set noswapfile
set cursorline
set belloff=all
set mouse=a
set inccommand=nosplit

set tabstop=8
set shiftwidth=8
set softtabstop=4
set shiftround
set smarttab

set cinoptions=(0,u4,U4,m1,+4,g0
set colorcolumn=80

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

set termguicolors
highlight Comment	 ctermfg=8						  guifg=#007800					gui=none
"highlight Constant	 ctermfg=14			   cterm=none guifg=lightred				gui=none
highlight Constant	 ctermfg=14			   cterm=none guifg=#d96767					gui=none
highlight Identifier ctermfg=6						  guifg=#00e0e0					gui=none
highlight Statement  ctermfg=3			   cterm=none guifg=#00e0e0					gui=none
highlight PreProc	 ctermfg=10						  guifg=#00e0e0					gui=none
highlight Type		 ctermfg=2						  guifg=#00e0e0					gui=none
highlight Special	 ctermfg=12						  guifg=#00AA00					gui=none
highlight Error					ctermbg=9							guibg=#ff0000	gui=none
highlight Todo		 ctermfg=4	ctermbg=3			  guifg=#000080 guibg=#c0c000	gui=none
highlight Directory  ctermfg=2						  guifg=#00c000					gui=none
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff	gui=none
highlight Normal									  guifg=#d0d0d0 guibg=#000000	gui=none
highlight Search				ctermbg=3							guibg=#c0c000	gui=none
highlight Pmenu			guibg=#202040	gui=none
highlight PmenuSel		guibg=#5050A0	gui=none
highlight Cursorline	cterm=none guibg=#151515
highlight ColorColumn	guibg=#151515

" fix vertical split styling in neovim
set fillchars+=vert:\|

set gfn=ProggyCleanTT\ 12
"set gfn=Tamsyn\ 12

"let g:bufExplorerFindActive = 0

"Show whitespace errors
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()

"Check for file changes when entering buffer or gaining focus
autocmd FocusGained,BufEnter,InsertEnter * :checktime

"Diff options
set diffopt=filler,iwhite

"Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000

" Window switching from terminal mode
tnoremap <C-w>w <C-\><C-n><C-w>w
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

" clang-format
let g:clang_format#code_style = "LLVM"
let g:clang_format#style_options = {
	\ "AccessModifierOffset" : -8,
	\ "AlignAfterOpenBracket" : "Align",
	\ "AllowShortBlocksOnASingleLine" : "false",
	\ "AllowShortCaseLabelsOnASingleLine" : "true",
	\ "AllowShortFunctionsOnASingleLine" : "Inline",
	\ "AllowShortIfStatementsOnASingleLine" : "true",
	\ "AllowShortLoopsOnASingleLine" : "true",
	\ "AllowShortEnumsOnASingleLine" : "false",
	\ "AlwaysBreakAfterReturnType" : "TopLevelDefinitions",
	\ "AlwaysBreakTemplateDeclarations" : "true",
	\ "BreakBeforeBraces" : "Custom",
	\ "BraceWrapping" : {
	\   "AfterClass" : "false",
	\   "AfterControlStatement" : "false",
	\   "AfterEnum" : "false",
	\   "AfterFunction" : "true",
	\   "AfterNamespace" : "false",
	\   "AfterObjCDeclaration" : "false",
	\   "AfterStruct" : "false",
	\   "AfterUnion" : "false",
	\   "AfterExternBlock" : "false",
	\   "BeforeCatch" : "false",
	\   "BeforeElse" : "false",
	\   "IndentBraces" : "false",
	\   "SplitEmptyFunction" : "false",
	\   "SplitEmptyRecord" : "false",
	\   "SplitEmptyNamespace" : "false" },
	\ "BreakConstructorInitializers" : "BeforeComma",
	\ "BreakStringLiterals" : "false",
	\ "ConstructorInitializerIndentWidth" : 0,
	\ "FixNamespaceComments" : "false",
	\ "IncludeBlocks" : "Regroup",
	\ "IndentWidth" : 8,
	\ "PenaltyBreakAssignment" : 10,
	\ "PenaltyBreakBeforeFirstCallParameter" : 30,
	\ "PenaltyBreakComment" : 10,
	\ "PenaltyExcessCharacter" : 2,
	\ "SpaceAfterTemplateKeyword" : "false",
	\ "SpaceInEmptyBlock" : "true",
	\ "Standard" : "Latest",
	\ "TabWidth" : 8,
	\ "UseTab" : "Always" }
" \cf: use style defined here
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :let g:clang_format#detect_style_file = 0<CR>:<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :let g:clang_format#detect_style_file = 0<CR>:ClangFormat<CR>
" \cp: try to use project style, fall back to style defined here
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cp :let g:clang_format#detect_style_file = 1<CR>:<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cp :let g:clang_format#detect_style_file = 1<CR>:ClangFormat<CR>
