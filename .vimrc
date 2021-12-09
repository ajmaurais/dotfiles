
" Plugin stuff
call plug#begin('~/.vim/autoload/')

Plug 'christoomey/vim-tmux-navigator' " Vim tmux nagivation

call plug#end()

" settings for vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\ :TmuxNavigatePrevious<cr>

syntax on
" set number

" set relative line numbers on
set rnu

" map CTRL-E to end-of-line
imap <C-e> <esc>$i<right>
"nmap <C-e> <end>
" map CTRL-A to beginning-of-line
imap <C-a> <esc>^i
" nmap <C-a> ^

set tabstop=4
set shiftwidth=4
"set expandtab
set number
"filetype indent on
"set autoindent
set hlsearch
nnoremap <CR> :noh<CR>

" Get rid of auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Hopefully turn on omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" dark background
set background=dark

