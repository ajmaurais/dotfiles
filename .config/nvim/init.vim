
" Plugin stuff
call plug#begin('~/.config/nvim/autoload')

" R console plugin
Plug 'jalvesaq/Nvim-R'

" status line
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" ncm autocompletion
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'gaalcaras/ncm-R'
" Plug 'sirver/UltiSnips'
" Plug 'ncm2/ncm2-ultisnips'

" csv plugin
" Plug 'chrisbra/csv.vim'

" lint plugin
Plug 'neomake/neomake'

" status line
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" color theme
" Plug 'morhetz/gruvbox'
Plug 'tanvirtin/monokai.nvim'

" send lines to console
Plug 'jalvesaq/vimcmdline'

" Better python autocompletion
" Plug 'ncm2/ncm2-jedi'
" 
" Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
" Plug 'ncm2/ncm2-path'  " filepath completion

Plug 'davidhalter/jedi-vim'   " jedi for python

Plug 'vim-python/python-syntax' " Better python syntax highlighting

Plug 'kshenoy/vim-signature' " Better marks plugin

Plug 'christoomey/vim-tmux-navigator' " Vim tmux nagivation

Plug 'ajmaurais/vim-wdl' " syntax highlighting for WDL

Plug 'LukeGoodsell/nextflow-vim' " syntax highlighting for nextflow

" Things for quarto
" Plug 'quarto-dev/quarto-nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'jmbuhr/otter.nvim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'nvim-treesitter/nvim-treesitter'

Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'quarto-dev/quarto-vim'
Plug 'cespare/vim-toml'

call plug#end()

" quarto config
" local quarto = require'quarto'
" require'quarto'.setup{
"   debug = false,
"   closePreviewOnExit = true,
"   lspFeatures = {
"     enabled = false,
"     languages = { 'r', 'python', 'julia' },
"     chunks = 'curly', -- 'curly' or 'all'
"     diagnostics = {
"       enabled = true,
"       triggers = { "BufWrite" }
"     },
"     completion = {
"       enabled = false,
"     },
"   },
"   keymap = {
"     hover = 'K',
"     definition = 'gd'
"   }
" }

" Plugin settings
set noshowmode
set laststatus=2

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "0"

let g:jedi#goto_command = "<Leader>jd"
let g:jedi#goto_assignments_command = "<Leader>jg"
let g:jedi#usages_command = "<Leader>jn"
let g:jedi#rename_command = "<Leader>jr"
let g:jedi#goto_stubs_command = "<Leader>js"
let g:jedi#documentation_command = "<Leader>jK"

" when to activate neomake
call neomake#configure#automake('nrw', 50)

" which linter to enable for Python source file linting
let g:neomake_python_enabled_makers = ['pylint']

" Better python syntax highlighting
let g:python_highlight_all = 1

colorscheme monokai
set background=dark

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" change leader timeout and mapping
set notimeout nottimeout

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" Get rid of stupid Nvim-R remapping
let R_assign = 0

" Set R wd to vim wd
let R_nvim_wd = 1

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" View R data frame in excell
let R_df_viewer = "ssview <- function(data){ temp_file <- paste0(tempfile(), '.csv'); write.table(data, file=temp_file, row.name=F, sep=','); system(paste0('wslview $(wslpath -w ', temp_file, ')')) }; ssview(%s)"

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

set clipboard^=unnamedplus " Use the system register for everything

syntax on
set number

" set relative line numbers on
set rnu

set autoread "auto load file changes

let cmdline_map_start = 'g'
let cmdline_app = {}
let cmdline_app['python'] = '/usr/bin/env ipython'
let cmdline_app['py'] = '/usr/bin/env ipython'

let cmdline_color_input = '#b35757'

" vimcmdline mappings
let cmdline_map_start          = '<Leader>cf'
let cmdline_map_send           = '<Leader>d'
let cmdline_map_send_and_stay  = '<Leader>l'
let cmdline_map_source_fun     = '<Leader>f'
let cmdline_map_send_paragraph = '<Leader>p'
let cmdline_map_send_block     = '<Leader>b'
let cmdline_map_send_motion    = '<Leader>m'
let cmdline_map_quit           = '<Leader>q'

" let cmdline_actions = {}
" let cmdline_actions['python'] = {}
" let cmdline_actions['python']['<Leader>rp'] = 'print(%s)'
" \ 'python': {'<Leader>rp': 'print(s)'}
" \ }
" let cmdline_actions['python']['<Leader>rr'] = 'clear'
"         {'<LocalLeader>rp', 'print(%s)'},
"         {'<LocalLeader>pt', 'type(%s)'},
"         {'<LocalLeader>pd', 'dir(%s)'},
"     }
" }

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"set spellfile 

" map CTRL-E to end-of-line
imap <C-e> <esc>$i<right>
"nmap <C-e> <end>
" map CTRL-A to beginning-of-line
imap <C-a> <esc>^i
" nmap <C-a> ^
" map alt right to move to next word
" inoremap <M-Left> <esc>bi
" inoremap ^[f <esc>ea

" Get rid of auto comment on new line
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Auto write
set autowriteall
set autoread

set tabstop=4
" set shiftwidth=4
set expandtab
" set number
" filetype indent plugin on
" set autoindent
" set smartindent

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile *.wdl set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

au FileType python setlocal formatprg=autopep8\ -

" set syntax for file extensions
autocmd BufEnter *.bats :setlocal filetype=sh

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set smartindent
set smarttab

set mouse=

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
set showcmd             " show (partial) command in status line

augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

nnoremap <CR> :noh<CR>
tnoremap <Esc> <C-\><C-n>

" settings for vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\ :TmuxNavigatePrevious<cr>

"
"function! SplitPaste(...)
"	let r = ""
"	echo a:0
"	if(a:0 == 0)
"		let r = @0
"	elseif(a:0 == 1)
"		let r = expand(@a:1)
"	else
"		echo 'Invalid arguments'
"		return
"	endif
"	let r=substitute(strtrans(r),'\^@',' ','g')
"	let r=substitute(strtrans(r),'\^I','','g')
"
"	echo strtrans(r)
"	"return r
"endfunction
"
"command! -nargs=* Spp :call SplitPaste(<f-args>)
