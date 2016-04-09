"vim specific things
set mouse=a "enable mouse

"file-based syntax highlighting
syntax enable
filetype indent on
set omnifunc=syntaxcomplete#Complete

"relative line numbers
set relativenumber

"set directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"tabs are 4 spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
autocmd Filetype fsharp setlocal shiftwidth=2
set smarttab
set autoindent
set backspace=indent,eol,start

" disable completion from include files (use tags instead)
set complete-=i

" big-ass history
set history=1000

"don't assume prefixed zeroes mean octal
set nrformats-=octal 

"statusbar
set showcmd "shows command that while being typed
set wildmode=longest,list,full
set wildmenu "tab-completion in colon menu

"redraw only when needed
set lazyredraw 
 
"searching
set incsearch " search as characters are entered
set hlsearch  " higligh matches
set showmatch " match braces

"windowing
set splitright
set splitbelow

"set leader key
let mapleader=" "

"set terminal stuff
set t_Co=256
set encoding=utf-8
set laststatus=2

"move using visual lines instead of actual lines
nnoremap j gj
nnoremap k gk

" folding
set foldenable
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
nnoremap <leader><space> za

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
silent! nmap <leader>nt :NERDTreeToggle<CR>
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete'}
let g:fsharp_only_check_errors_on_write = 1
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
call plug#end()
