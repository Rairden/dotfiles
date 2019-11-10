" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" Pick a leader key
let mapleader = ","

set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one unsaved buffers.
set incsearch                  " Incremental search, hit `<CR>` to stop.
set ruler                      " Shows the current line number at the bottom-right of the screen.
set wildmenu                   " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number
set number relativenumber
set showmode
set showcmd
set hlsearch
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set autoread
set mouse=a

" attempt to fix tabs vs spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Status bar
set laststatus=2
set cmdheight=2
set encoding=utf-8

" color theme
colorscheme monokai

" transparent BG
hi Normal guibg=NONE ctermbg=NONE

" this allows you to type ":Filter <search>" to search an entire file, and copy it to a new file
" https://vim.fandom.com/wiki/Redirect_g_search_output
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" set F4 to toggle NERDTree
nmap <F4> :NERDTreeToggle<CR>

" Easier split navigations		So instead of ctrl-w then j, it’s just ctrl-j to move btwn windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Erik's custom hotkeys
nnoremap <F5> :edit!<LF>		" binds F5 to :edit! which force reloads the file w/out asking to save changes
vnoremap <C-c> "+y
map <C-v> "+p
