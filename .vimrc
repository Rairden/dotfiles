" Enabling filetype support provides filetype-specific indenting
filetype plugin indent on
syntax on

" Pick a leader key
let mapleader = ","

set autoindent					" Minimal automatic indenting for any filetype.
set backspace=indent,eol,start  " Proper backspace behavior.
set hidden						" Possibility to have more than one unsaved buffers.
set incsearch					" Incremental search, hit `<CR>` to stop.
set ruler						" Shows the current line number at the bottom-right of the screen.
set wildmenu					" Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set number
set number relativenumber
set showmode
set showcmd
set hlsearch
set nowrap						" Dont wrap lines
set linebreak					" Wrap lines at convenient points
set autoread
set mouse=a
set history=1000				" Store lots of :cmdline history
set nofixendofline				" Unix standard is to ensure a new line at EOF. Let's disable that.
set splitbelow					" reverse split order
set noshowmode					" doesnt show '-- INSERT --' at bottom
set nohlsearch

" tabs vs spaces
set tabstop=4
set shiftwidth=4
set noexpandtab					" tabs vs spaces

" case-sensitive settings (maybe delete this; use default settings)
set ignorecase					" ignore case when searching...
set smartcase					" ...unless we type a capital

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
" colorscheme ayu

hi SpecialKey ctermbg=NONE ctermfg=NONE

" transparent BG
hi Normal  guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE		" sets all empty lines (~) with transparent bg.

" set the color for the current window vs non-current windows.
hi StatusLine   ctermfg=231 ctermbg=243
hi StatusLineNC ctermfg=231 ctermbg=239

" sets the statusline colors. These are groups for the below groups (%1, %2, etc)
hi User1 ctermfg=231 ctermbg=243
hi User6 ctermfg=231 ctermbg=160		" INSERT (red)
hi User7 ctermfg=231 ctermbg=55			" VISUAL (purple)
hi User8 ctermfg=231 ctermbg=20			" REPLACE (orange)

" sets color for autocomplete popup menus
hi Pmenu ctermbg=238
hi PmenuSel ctermbg=242

" my status bar
set statusline=
set statusline +=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline +=%6*%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline +=%8*%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline +=%7*%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline +=%*\ %n\ %*							" buffer number
set statusline +=%*\ %<%.30F%*						" path, trunc to 30 length
set statusline +=%*%m%*								" modified flag
set statusline +=%=									" right align
set statusline +=(%{strlen(&ft)?&ft:'none'},		" filetype
set statusline +=%{strlen(&fenc)?&fenc:&enc},		" encoding
set statusline +=%{&fileformat})					" file format
set statusline +=%*%5l%*							" current line
set statusline +=%*/%L\ %*							" total lines
set statusline +=%*%4v\ %*							" virtual column number
set statusline +=%*0x%04B\ %*						" character under cursor

" Easier split navigations (so instead of ctrl-w then j, it’s just ctrl-j to move btwn windows)
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" ### Erik's custom hotkeys
nmap <F1> :set invrelativenumber<CR>
nmap <F2> :set invlist<CR>
imap <F2> <Esc>:set invlist<CR>a
nmap <F3> :set hls! <CR>
nmap <F4> :NERDTreeToggle<CR>
" binds F5 to :edit! which force reloads the file w/out asking to save changes
nnoremap <F5> :edit!<CR>
nnoremap <leader>r :vs<CR>
nnoremap <leader>t :sp<CR>
nnoremap <C-i> :bp<CR>
nnoremap <C-o> :bn<CR>
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+p
nnoremap <S-d> mzyyp`zj$
nnoremap <C-y> "_dd
" yy and Y are the same. Remap Y to exclude the newline
nnoremap Y ^vg_y
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
"nnoremap <C-w> dvb

nnoremap <leader>s :w<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>w :wq!<CR>
" turns off highlighting from search
nnoremap <leader><space> :nohlsearch<CR>
" reformat code
nnoremap <leader>l mzgg=G`z
" run macro @e
nnoremap <leader>e @e
nnoremap <leader>g :Rg<space>
nnoremap <leader>F :Filter<space>
nnoremap <leader>f :Files<CR>
nnoremap <leader>v <Esc>q:
" deletes all Javadoc comments
nnoremap <leader>c :g/[/]\*\+\\|^\s\+\*/d<CR>
nnoremap <leader>q :bp\|bd#<CR>
" YouCompleteMe jump to defintion
nnoremap <leader>j :YcmCompleter GoTo<CR>
" in vim foward slash / is mapped to underscore _
map <C-_> <plug>NERDCommenterToggle<CR>
imap <C-_> <Esc><plug>NERDCommenterToggle<CR>
vmap <C-_> <plug>NERDCommenterToggle<CR>
" fix dd so that deleting a line doesnt overwrite the most recent 0 reg
nnoremap dd "_dd
" ### END Erik's custom hotkeys

" run go
nnoremap <leader>b :GoRun %<CR>
" https://github.com/skywind3000/asyncrun.vim#asyncrun---run-shell-command
" nnoremap <leader>m <Esc>:AsyncRun -mode=term -pos=curwin go run .<CR><C-w><C-k>
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
" Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/jremmen/vim-ripgrep.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'https://github.com/skywind3000/asyncrun.vim.git'
Plug 'preservim/nerdcommenter'
" Plug 'https://github.com/kien/ctrlp.vim.git'
" Plug 'ayu-theme/ayu-vim'
call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif

" this allows you to type ":Filter <search>" to search an entire file, and copy it to a new file (https://vim.fandom.com/wiki/Redirect_g_search_output)
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" ### test settings ##################################
set timeoutlen=1000
set ttimeoutlen=50
set noswapfile
set softtabstop=4
set scrolloff=5
let NERDTreeShowHidden=1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
set shortmess=aoOtI
au VimEnter * wincmd l 	" any file type * to run the ex command :wincmd l (same as <C-w>l)

" run with ':call ClearReg()'
func! ClearReg()
	let regs=split('0123456789"', '\zs')
	for r in regs
		call setreg(r, [])
	endfor
endfunc

" this allows me to use help and it go 100% height. Use with ':H'
command! -nargs=? -complete=help H help <args> | :exe "normal \<C-W>_"

" disable autoformatting on save in vim-go plugin.
let g:go_fmt_autosave = 0

" ### END test settings ##################################
