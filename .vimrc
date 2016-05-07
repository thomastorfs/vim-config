" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle 
Plugin 'VundleVim/Vundle.vim'

" Plugins for searching and navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
" Plugin 'rking/ag.vim'
" Plugin 'easymotion/vim-easymotion'

" Plugins for editing
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
" Plugin 'kana/vim-textobj-user'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
" Plugin 'sjl/gundo.vim'

" Themes
Plugin 'sickill/vim-monokai'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'w0ng/vim-hybrid'
Plugin 'abra/vim-obsidian'

" Looks
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggdroot/indentLine'

" Code awareness
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'majutsushi/tagbar'
" Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'stanangeloff/php.vim'
" Plugin 'skammer/vim-css-color'
" Plugin 'hail2u/vim-css3-syntax'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'elzr/vim-json'

" Versioning
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Compatibility
" Plugin 'christoomey/vim-tmux-navigator'
"
call vundle#end()
filetype plugin indent on

" -----------------------------------------------------------------------------
" General configuration 
" -----------------------------------------------------------------------------
set encoding=utf-8
set term=xterm
set t_Co=256

colorscheme monokai
let g:airline_powerline_fonts = 1
let g:airline_theme="powerlineish"
set laststatus=2

set visualbell
set mouse=a
set number
set nowrap
set ruler
set showcmd

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set incsearch
set hlsearch
set showmatch
set smartcase

set splitbelow
set splitright

" -----------------------------------------------------------------------------
" Custom mappings 
" -----------------------------------------------------------------------------

" Set the mapleader to something easier to type
let mapleader="," 

" Easy escape 
imap jk <ESC>

" Buffers
nmap <leader>t :enew<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" Open new buffers in a new split 
nmap <leader>sh :leftabove vnew<cr>
nmap <leader>sl :rightbelow vnew<cr>
nmap <leader>sk :leftabove new<cr>
nmap <leader>sj :rightbelow new<cr>

" Easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Indent and format the entire buffer
nmap <leader>ib ggVG=
nmap <leader>fb ggVGgq

" -----------------------------------------------------------------------------
" Plugin configuration and mappings
" -----------------------------------------------------------------------------

" NERDTRee
map <leader>n :NERDTreeToggle<cr>

" UltiSnips
" let g:UltiSnipsExpandTrigger="<leader>s"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Filename only

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
let g:ctrlp_working_path_mode = 'r' " Nearest git directory is the cwd
nmap <leader>p :CtrlP<cr>
nmap <leader>bs :CtrlPBuffer<cr>

" Buffergator
let g:buffergator_viewport_split_policy = 'R' " Right side of the screen
let g:buffergator_suppress_keymaps = 1 " Personal mappings
nmap <leader>bl :BuffergatorOpen<cr>

" Eunuch
nmap <leader>bd :Remove<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1

" Indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'

" -----------------------------------------------------------------------------
" Extra 
" -----------------------------------------------------------------------------

" Automatically remove whitespace
autocmd FileType php,python,javascript,html,scss,css,xml,markdown,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

" HTML syntax highlighting
au BufRead *.html set filetype=htmlm4

" Store swap and backup files in subdirectories of the .vim directory
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
