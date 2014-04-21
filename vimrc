" All of this is stolen from other vimrc's yay

set showcmd
set nocompatible


" File stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*
set noautowrite

set ruler
set more
set autoread

set expandtab
set smarttab
set tabstop=8
set softtabstop=2
set shiftwidth=2
set shiftround
set copyindent
set cindent
set preserveindent


set scrolloff=5
set sidescrolloff=5

set backspace=eol,indent,start
set linebreak

set cmdheight=2
set undolevels=1000
set updatecount=100 "Update swap file after 200 chars are entered

set complete=.,w,b,u,U,t,i,d

set ttyfast
set noerrorbells

set shell=bash
set fileformats=unix

set showmatch

" Use english to spellcheck, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

set number

set ignorecase
set smartcase

" Remap jj to esc
inoremap jj <Esc>

" I've no clue what JJJJ was mapped to 
nnoremap JJJJ <Nop>

set incsearch
set hlsearch
set matchtime=5

set nostartofline

" Think of Jon
set textwidth=80

" Linux clipboard
let g:clipbrdDefaultReg = '+'

" Remove buffer when a tab is closed
set nohidden

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Setup backup dirs
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set cul

set lazyredraw


nore ; :
nore , ;


noremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
 endf
