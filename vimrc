nnoremap x "_x
vnoremap x "_x
" 光標樣式設置
if &term =~ "xterm\\|rxvt"
  " 使用 DECSCUSR 序列來改變光標樣式
  let &t_SI = "\<Esc>[6 q"  " 插入模式 - 豎線
  let &t_SR = "\<Esc>[4 q"  " 替換模式 - 下劃線
  let &t_EI = "\<Esc>[2 q"  " 普通模式 - 塊狀
endif

" 使用 Vim 的高亮組來改變背景顏色
function! SetInsertColor()
  highlight Normal guibg=#000044 ctermbg=17
endfunction

function! SetNormalColor()
  highlight Normal guibg=#000000 ctermbg=0
endfunction

" 當模式改變時自動調用這些函數
augroup ModeColors
  autocmd!
  autocmd InsertEnter * call SetInsertColor()
  autocmd InsertLeave * call SetNormalColor()
augroup END

" 狀態欄顏色變化
augroup StatusColors
  autocmd!
  " 普通模式 - 綠色
  autocmd InsertLeave * hi StatusLine guifg=#000000 guibg=#00FF00 ctermfg=black ctermbg=green
  " 插入模式 - 藍色
  autocmd InsertEnter * hi StatusLine guifg=#000000 guibg=#0000FF ctermfg=black ctermbg=blue
augroup END

" 確保顏色在不同終端下都能正常顯示
if &term =~ '256color'
    set t_ut=
endif

" 添加模式指示器到狀態欄
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%{mode()}

" 始終顯示狀態欄
set laststatus=2


" Basic settings
syntax on
filetype plugin indent on
let mapleader=" "

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Display settings
set nonumber
set ruler
set showmode
set scrolloff=5
set list
" set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<

" Indentation and editing
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" Clipboard settings
set clipboard=unnamed,unnamedplus

" Visual mode settings
set selection=exclusive
vmap <C-c> "+y

" Performance settings
set lazyredraw

" File management
set autoread
set nobackup
set noswapfile

" Key mappings
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :noh<CR>

" Optional: Uncomment if you want relative line numbers
" set relativenumber

" Optional: Uncomment if you want to always show the status line
" set laststatus=2

" Optional: Uncomment if you want to enable mouse support
" set mouse=a
"

" Vim-Plug
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Basic Settings
set number
set relativenumber
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus

" Key mappings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>

" Theme
set background=dark
colorscheme default

" Airline settings
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" NERDTree settings
let NERDTreeShowHidden=1
