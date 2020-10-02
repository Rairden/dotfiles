" Enabling filetype support provides filetype-specific indenting
filetype plugin indent on
syntax on

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
set splitbelow splitright       " reverse split order
set noshowmode                  " doesnt show '-- INSERT --' at bottom

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

set listchars=
set listchars+=tab:→\ 
set listchars+=nbsp:␣
set listchars+=trail:•
set listchars+=space:·
set listchars+=eol:↲

colorscheme monokai

hi SpecialKey ctermbg=NONE ctermfg=NONE

" transparent BG
hi Normal  guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE      " sets all empty lines (~) with transparent bg.

" set the color for the current window vs non-current windows.
hi StatusLine   ctermfg=231 ctermbg=243
hi StatusLineNC ctermfg=231 ctermbg=239

" sets the statusline colors. These are groups for the below groups (%1, %2, etc)
hi User1 ctermfg=231 ctermbg=243
hi User6 ctermfg=231 ctermbg=160        " INSERT (red)
hi User7 ctermfg=231 ctermbg=55         " VISUAL (purple)
hi User8 ctermfg=231 ctermbg=208        " REPLACE (orange)

" sets color for autocomplete popup menus
hi Pmenu ctermbg=238
hi PmenuSel ctermbg=242

" my status bar
set statusline=
set statusline +=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline +=%6*%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline +=%8*%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline +=%7*%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline +=%*\ %n\ %*                         " buffer number
set statusline +=%*\ %<%.30F%*                      " path, trunc to 30 length
set statusline +=%*%m%*                             " modified flag
set statusline +=%=                                 " right align
set statusline +=(%{strlen(&ft)?&ft:'none'},        " filetype
set statusline +=%{strlen(&fenc)?&fenc:&enc},       " encoding
set statusline +=%{&fileformat})                    " file format
set statusline +=%*%5l%*                            " current line
set statusline +=%*/%L\ %*                          " total lines
set statusline +=%*%4v\ %*                          " virtual column number
set statusline +=%*0x%04B\ %*                       " character under cursor

" Easier split navigations (so instead of ctrl-w then j, it’s just ctrl-j to move btwn windows)
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Erik's custom hotkeys
nmap <F2> :set invlist<CR>
imap <F2> <Esc>:set invlist<CR>a
nmap <F4> :NERDTreeToggle<CR>
" binds F5 to :edit! which force reloads the file w/out asking to save changes
nnoremap <F5> :edit!<LF>
nnoremap <leader>r :vs<CR>
nnoremap <leader>t :sp<CR>
nnoremap <C-i> :bp<CR>
nnoremap <C-o> :bn<CR>
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pA
nnoremap <S-d> mzyyp`zj$
nnoremap <C-y> dd
" visual block mode
nnoremap <C-b> <Esc><C-v>

" tab, shift+tab to move blocks
vnoremap <Tab> >>_
vnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-D>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-w> dvb

nnoremap <Leader>s :w<CR>
"nnoremap <Leader>n :enew<CR>
nnoremap <Leader>w :wq!<CR>
" turns off highlighting from search
nnoremap <Leader><space> :nohlsearch<CR>
" reformat code
nnoremap <leader>l mzgg=G`z
" run macro @e
nnoremap <leader>e @e
nnoremap <Leader>g :Rg<space>
nnoremap <Leader>F :Filter<space>
nnoremap <Leader>f :FZF<CR>
nnoremap <leader>v <Esc>q:
" deletes all Javadoc comments
nnoremap <leader>c :g/[/]\*\+\\|^\s\+\*/d<CR>
" run go
nnoremap <leader>m :GoRun %<CR>
nnoremap <leader>q :bd<CR>

" https://github.com/skywind3000/asyncrun.vim#asyncrun---run-shell-command
nnoremap <leader>b <Esc>:AsyncRun -mode=term -pos=curwin go run .<CR><C-w><C-k>
nnoremap <F10> <Esc>:AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 go run .<CR>

" this assigns Meta-j to konsole alt-j. In konsole the escape char is ^[ which konsole assigns to \e character.
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

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/jremmen/vim-ripgrep.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
call plug#end()

" CtrlP
let g:ctrlp_use_caching = 0

" make CtrlP ignore all your .gitignore files.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|pyc|pyo|obj|o|lib|psd)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable('rg')
    let g:rg_derive_root='true'
endif

" this allows you to type ":Filter <search>" to search an entire file, and copy it to a new file (https://vim.fandom.com/wiki/Redirect_g_search_output)
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" test settings
set timeoutlen=1000
set ttimeoutlen=50
set noswapfile
set softtabstop=4
set scrolloff=5
let NERDTreeShowHidden=1

