set termguicolors "16 MILLION COLORS
set guioptions-=T "remove toolbar
set guioptions-=m "remove menu
set guioptions-=r "remove scrollbar
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 13

" allow true color in the terminal
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" don't break in the middle of words
set linebreak

"vim specific things
set mouse=a "enable mouse

"file-based syntax highlighting
set omnifunc=syntaxcomplete#Complete

let g:tex_flavor = "latex"

set foldmethod=syntax

set number
set relativenumber

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
set tabstop=4
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
set incsearch

"windowing
set splitright
set splitbelow

"set leader key
let mapleader=" "


"move using visual lines instead of actual lines
nnoremap j gj
nnoremap k gk
nnoremap ; :

"colon commands
nmap <C-q> :q<CR>
nmap <C-Q> :q!<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>a
"ctrl-/ to substitute previous search
nmap <C-_> :%s//
"turn off search highlight until next search
nmap <leader>/ :noh<CR>
nmap <leader>t :tabnew<space>

" sudo sove
cmap :w!! w !sudo tee > /dev/null %

"unmap EX mode
nmap Q <Nop>

"keyboard hack
imap <F1> <Del>

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
" why not tpope All the things?
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_color = 1
let g:colorizer_colornames = 0
let g:colorizer_fgcontrast = 0

" general stuff
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
silent! nmap <leader>nt :NERDTreeToggle<CR>
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

" langage specific plugins
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'petrushka/vim-opencl', { 'for': 'opencl' }
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete'}
let g:fsharp_only_check_errors_on_write = 1
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'rhysd/vim-clang-format', { 'for': ['c','cc','cpp'] }

Plug 'valloric/YouCompleteMe', { 'for': ['c','cc','cpp'], 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator',  { 'for': ['c','cc','cpp'], 'branch': 'stable'}
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_error_symbol   = '!!'
let g:ycm_warning_symbol = '~~'

" colorscheme
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
color gruvbox

" minimum lines above/below cursor
set scrolloff=3

"autocmd FileType c ClangFormatAutoEnable
autocmd FileType c nnoremap <leader>f :ClangFormat<CR>

