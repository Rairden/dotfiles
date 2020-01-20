" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" Pick a leader key
let mapleader = ","

set autoindent                  " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start  " Proper backspace behavior.
set hidden                      " Possibility to have more than one unsaved buffers.
set incsearch                   " Incremental search, hit `<CR>` to stop.
set ruler                       " Shows the current line number at the bottom-right of the screen.
set wildmenu                    " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number
set number relativenumber
set showmode
set showcmd
set hlsearch
set nowrap                      " Dont wrap lines
set linebreak                   " Wrap lines at convenient points
set autoread
set mouse=a
set history=1000                " Store lots of :cmdline history
set nofixendofline              " Unix standard is to ensure a new line at EOF. Let's disable that.

" attempt to convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab                   " Turns tabs into spaces

" case-sensitive settings (maybe delete this; use default settings)
set ignorecase                  " ignore case when searching...
set smartcase                   " ...unless we type a capital

" status bar
set laststatus=2
set cmdheight=2
set encoding=utf-8

" color theme
colorscheme monokai

"set list
nmap <F2> :set invlist<CR>
imap <F2> <ESC>:set invlist<CR>a
hi SpecialKey ctermbg=NONE ctermfg=NONE

"set lcs+=space:·
"set showbreak=↪\ 
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set listchars=
set listchars+=tab:→\ 
set listchars+=nbsp:␣
set listchars+=trail:•
set listchars+=space:·
set listchars+=eol:↲

" transparent BG
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE      " sets all empty lines (~) with transparent bg.

" set the color for the current window vs non-current windows.
hi StatusLine ctermfg=231 ctermbg=243
hi StatusLineNC ctermfg=231 ctermbg=239

" sets the statusline colors. These are groups for the below groups (%1, %2, etc)
hi User1 ctermfg=231 ctermbg=243
hi User6 ctermfg=231 ctermbg=160        " INSERT (red)
hi User7 ctermfg=231 ctermbg=55         " VISUAL (purple)
hi User8 ctermfg=231 ctermbg=208        " REPLACE (orange)

" my status bar
set statusline=
set statusline +=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline +=%6*%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline +=%8*%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline +=%7*%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline +=%*\ %n\ %*                         " buffer number
set statusline +=%*\ %<%.30F%*                      " short path, trunc to 30 length
set statusline +=%*%m%*                             " modified flag
set statusline +=%=(%{strlen(&ft)?&ft:'none'},      " filetype
set statusline +=%{strlen(&fenc)?&fenc:&enc},       " encoding
set statusline +=%{&fileformat})                    " file format
set statusline +=%*%=%5l%*                          " current line
set statusline +=%*/%L%*                            " total lines
set statusline +=%*%4v\ %*                          " virtual column number
set statusline +=%*0x%04B\ %*                       " character under cursor


" this allows you to type ":Filter <search>" to search an entire file, and copy it to a new file
" https://vim.fandom.com/wiki/Redirect_g_search_output
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" set F4 to toggle NERDTree
nmap <F4> :NERDTreeToggle<CR>

" Easier split navigations (so instead of ctrl-w then j, it’s just ctrl-j to move btwn windows)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Erik's custom hotkeys
nnoremap <F5> :edit!<LF>                    " binds F5 to :edit! which force reloads the file w/out asking to save changes
vnoremap <C-c> "+y
nnoremap <C-v> "+p

nnoremap <C-s> :w<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-w> :wq!<CR>

nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>w :wq!<CR>
nnoremap <Leader><space> :nohlsearch<CR>    " turns off highlighting from search

" this assigns Meta-j to konsole alt-j. In konsole the escape char is ^[ which konsole assigns to \E character.
" you can move lines/blocks up and down with alt-j/k.    https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
execute "set <M-j>=\ej"
nnoremap <M-j> j
execute "set <M-k>=\ek"
nnoremap <M-k> k

nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

