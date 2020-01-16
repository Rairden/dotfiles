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
set nofixendofline              " disable adding a newline at EOF (unix standard)

" attempt to convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab                   " Turns tabs into spaces
retab                           " This will affect the existing tab characters. expandtab only will not.

" status bar
set laststatus=2
set cmdheight=2
set encoding=utf-8

" color theme
" colorscheme darcula
colorscheme monokai
 
" transparent BG
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE      " sets all empty lines (~) with transparent bg.

" sets the statusline colors. These are groups for the below groups (%1, %2, etc)
hi User1 ctermfg=231 ctermbg=241
hi User2 ctermfg=231 ctermbg=241
hi User3 ctermfg=231 ctermbg=241
hi User4 ctermfg=231 ctermbg=241
hi User5 ctermfg=231 ctermbg=241

" my status bar
set statusline=
set statusline +=%1*\ %n\ %*            " buffer number
set statusline +=%5*%{&ff}%*            " file format
set statusline +=%3*%y%*                " file type
set statusline +=%4*\ %<%F%*            " full path
set statusline +=%2*%m%*                " modified flag
set statusline +=%1*%=%5l%*             " current line
set statusline +=%2*/%L%*               " total lines
set statusline +=%1*%4v\ %*             " virtual column number
set statusline +=%2*0x%04B\ %*          " character under cursor

" this allows you to type ":Filter <search>" to search an entire file, and copy it to a new file
" https://vim.fandom.com/wiki/Redirect_g_search_output
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" set F4 to toggle NERDTree
nmap <F4> :NERDTreeToggle<CR>

" Easier split navigations              So instead of ctrl-w then j, it’s just ctrl-j to move btwn windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Erik's custom hotkeys
nnoremap <F5> :edit!<LF>                " binds F5 to :edit! which force reloads the file w/out asking to save changes
vnoremap <C-c> "+y
map <C-v> "+p

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


