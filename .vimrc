" Vundle
" to reinstall vundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'https://github.com/jlanzarotta/bufexplorer'
Plugin 'https://github.com/rhysd/vim-clang-format'
Plugin 'https://github.com/neovim/nvim-lspconfig'
Plugin 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plugin 'https://github.com/nvim-lua/plenary.nvim' " for telescope
Plugin 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' " for telescope
Plugin 'https://github.com/nvim-telescope/telescope.nvim'
Plugin 'https://github.com/nvim-telescope/telescope-live-grep-args.nvim'
Plugin 'mrcjkb/rustaceanvim'
Plugin 'j-hui/fidget.nvim'
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'nvim-treesitter/playground'
Plugin 'tomasiser/vim-code-dark'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'chrisgrieser/nvim-lsp-endhints'
call vundle#end()
filetype plugin on
filetype indent off

" General configuration
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
set nowrap
syntax on
set updatetime=1000
set signcolumn=yes
set completeopt=menu
set linebreak

" Tabs
set tabstop=8
set shiftwidth=8
set softtabstop=4
set shiftround
set smarttab

" Indentation
set cinoptions=(0,u4,U4,m1,+4,g0
set colorcolumn=80

" Colours
let g:codedark_transparent=1
colorscheme codedark
highlight clear SignColumn
highlight link SignColumn CursorLine
highlight DiffChange guibg=#073655
highlight DiffText guibg=#005f87

" Set font
set gfn=ProggyCleanTT\ 12

" Show whitespace errors
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()

" Check for file changes when entering buffer or gaining focus
autocmd FocusGained,BufEnter,InsertEnter * :checktime

" Diff options
set diffopt=filler,iwhite

" Persistent undo
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
" let g:clang_format#extra_args = "--dump-config"
let g:clang_format#code_style = "LLVM"
let g:clang_format#style_options = {
	\ "AccessModifierOffset" : -8,
	\ "AlignAfterOpenBracket" : "Align",
	\ "AlignTrailingComments" : "false",
	\ "AllowShortBlocksOnASingleLine" : "false",
	\ "AllowShortCaseLabelsOnASingleLine" : "true",
	\ "AllowShortFunctionsOnASingleLine" : "Inline",
	\ "AllowShortIfStatementsOnASingleLine" : "AllIfsAndElse",
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
	\ "IncludeCategories" : [
	\   { "Regex": ".*", "Priority": 1, "SortPriority": 1, "CaseSensitive": "false" },
	\   { "Regex": "ignore" },
	\   { "Regex": "ignore" },
	\   { "Regex": "ignore" },
	\   { "Regex": "ignore" },
	\   { "Regex": "ignore" }, ],
	\ "IndentWidth" : 8,
	\ "PenaltyBreakAssignment" : 10,
	\ "PenaltyBreakBeforeFirstCallParameter" : 30,
	\ "PenaltyBreakComment" : 20,
	\ "PenaltyExcessCharacter" : 2,
	\ "SpaceAfterTemplateKeyword" : "false",
	\ "SpaceInEmptyBlock" : "true",
	\ "SpacesInContainerLiterals" : "false",
	\ "Standard" : "Latest",
	\ "TabWidth" : 8,
	\ "UseTab" : "Always" }
" \cf: use style defined here
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :let g:clang_format#detect_style_file = 0<CR>:<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :let g:clang_format#detect_style_file = 0<CR>:ClangFormat<CR>
" \cp: try to use project style, fall back to style defined here
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cp :let g:clang_format#detect_style_file = 1<CR>:<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cp :let g:clang_format#detect_style_file = 1<CR>:ClangFormat<CR>

" Rust configuration
let g:rust_recommended_style = 0
let g:my_rustfmt_options = '--unstable-features --config hard_tabs=true,tab_spaces=8,max_width=79,where_single_line=true,match_arm_blocks=false,use_small_heuristics=max'
autocmd FileType rust setlocal nosmartindent
autocmd FileType rust nnoremap <buffer><Leader>cf :let g:rustfmt_command = 'rustfmt +nightly'<CR>::let g:rustfmt_options = expand(g:my_rustfmt_options)<CR>:<C-u>RustFmt<CR>
autocmd FileType rust vnoremap <buffer><Leader>cf :let g:rustfmt_command = 'rustfmt +nightly'<CR>::let g:rustfmt_options = expand(g:my_rustfmt_options)<CR>:RustFmt<CR>
autocmd FileType rust nnoremap <buffer><Leader>cp :let g:rustfmt_command = 'rustfmt'<CR>:let g:rustfmt_options = ''<CR>:<C-u>RustFmt<CR>
autocmd FileType rust vnoremap <buffer><Leader>cp :let g:rustfmt_command = 'rustfmt'<CR>::let g:rustfmt_options = ''<CR>:RustFmt<CR>

" auto format on save
autocmd BufWritePre * lua vim.lsp.buf.format()

" a helper to figure out the syntax group under the cursor
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" newer neovim config requires lua
lua << EOF

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local keymap_opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, keymap_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set('n', '<leader>l', require('lsp_lines').toggle, keymap_opts)
vim.keymap.set('n', '<leader>d', '<cmd>Telescope diagnostics<cr>', keymap_opts)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', keymap_opts)
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope live_grep_args<cr>', keymap_opts)
vim.keymap.set('n', '<leader>a', '<cmd>ClangdSwitchSourceHeader<cr>', keymap_opts)
vim.keymap.set('n', '<leader>be', '<cmd>Telescope buffers<cr>', keymap_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>em', function()
    vim.cmd.RustLsp('expandMacro')
  end, bufopts)

  -- Inlay hints
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false
})

require('lspconfig').clangd.setup({
	on_attach = on_attach
})

require('lsp_lines').setup()

require('telescope').setup({
	defaults = {
		layout_config = {
			width = 280,
			height = 100
		},
		sorting_strategy = "ascending",
		mappings = {
			n = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			},
			i = {
				['<c-d>'] = require('telescope.actions').delete_buffer
			}
		},
		initial_mode = "normal",
	},
	pickers = {
		buffers = {
			sort_mru = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}
	}
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

-- Rust
vim.g.rustaceanvim = {
	-- LSP configuration
	-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
	server = {
		on_attach = on_attach,
		default_settings = {
			-- rust-analyzer language server configuration
			['rust-analyzer'] = {
				cargo = {
					extraArgs = {"--locked"},
				},
				check = {
					command = "clippy",
					allTargets = false,
				},
			},
		},
	},
	-- DAP configuration
	dap = { },
}

require('fidget').setup()

require('nvim-treesitter.configs').setup({
	ensure_installed = { "c", "cpp", "rust" },
	sync_install = true,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
})

require('nvim-treesitter.configs').setup({
	enable = true,
})

require("lsp-endhints").setup {
	icons = {
		type = "T:",
		parameter = "P:",
		offspec = "", -- hint kind not defined in official LSP spec
		unknown = "", -- hint kind is nil
	},
	label = {
		truncateAtChars = 30,
		padding = 1,
		marginLeft = 0,
		sameKindSeparator = ", ",
	},
	extmark = {
		priority = 50,
	},
	autoEnableHints = true,
}

vim.lsp.set_log_level("off")

EOF

