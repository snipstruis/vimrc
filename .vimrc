"16 MILLION COLORS
set termguicolors

"vim specific things
set mouse=a "enable mouse

"file-based syntax highlighting
set omnifunc=syntaxcomplete#Complete

let g:tex_flavor = "latex"

set foldmethod=syntax

set number

"set directories
if empty(glob('~/.vim/backup'))
    silent !mkdir -p ~/.vim/backup
endif
set backupdir=~/.vim/backup//
if empty(glob('~/.vim/swap'))
    silent !mkdir -p ~/.vim/swap
endif
set directory=~/.vim/swap//
if empty(glob('~/.vim/undo'))
    silent !mkdir -p ~/.vim/undo
endif
set undodir=~/.vim/undo//

"tabs are 4 spaces
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
autocmd Filetype fsharp setlocal shiftwidth=2

"statusbar
set showcmd "shows command that while being typed
set wildmode=longest,list,full "tab-completion in colon menu

"redraw only when needed
set lazyredraw 
 
"searching
set hlsearch  " higligh matches
set showmatch " match braces

"windowing
set splitright
set splitbelow

"set leader key
let mapleader=" "

"move using visual lines instead of actual lines
nnoremap j gj
nnoremap k gk
nnoremap ; :
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a

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
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
silent! nmap <leader>nt :NERDTreeToggle<CR>
Plug 'scrooloose/syntastic'
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete'}
let g:fsharp_only_check_errors_on_write = 1
"Plug 'OmniSharp/omnisharp-vim', { 'for': 'csharp', 'do': 'cd server;xbuild' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'rhysd/vim-clang-format', { 'for': ['c','cc','cpp'] }
"Plug 'Rip-Rip/clang_complete', { 'for': ['c','cc','cpp'], 'do': 'make install' }
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
color gruvbox

"autocmd FileType c ClangFormatAutoEnable
autocmd FileType c nnoremap <leader>f :ClangFormat<CR>
