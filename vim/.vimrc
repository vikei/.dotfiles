syntax on

set history=1500

set mouse=a

set autoread

set showcmd
set cmdheight=1

set updatetime=300

set relativenumber

filetype plugin indent on

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround

set lbr
set tw=500

set ai
set si
set wrap
set wrapmargin=8
set linebreak

set so=7

set wildmenu

set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set showmatch

set noswapfile

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry


set nobackup
set nowritebackup

map <leader>s :source ~/.vimrc<cr>

nmap <leader>w :w!<cr>

" :W sudo saves the file
command W w !sudo tee % > /dev/nul

imap jj <Esc>

let mapleader = ","

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'https://github.com/sheerun/vim-polyglot'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'scrooloose/nerdtree'
let g:NERDTreeWinPos = "right"
function OpenNERDTree()
  if g:NERDTree.IsOpen()
    :NERDTreeClose
  else
    :NERDTreeFind
  endif
endfunction
nmap <C-n> :call OpenNERDTree()<CR>

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

" Plug 'w0rp/ale'
" let g:ale_fix_on_save = 1
" let g:ale_linters_explicit = 1
" let g:ale_fixers = ['prettier', 'eslint']

Plug 'mxw/vim-jsx'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'

Plug 'wakatime/vim-wakatime'

Plug 'vim-scripts/matchit.zip'

Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'

" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> InitializeCoc() }}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-emmet',
\ 'coc-eslint',
\ 'coc-html',
\ 'coc-json',
\ 'coc-markdownlint',
\ 'coc-tabnine',
\ 'coc-snippets',
\ 'coc-prettier',
\ 'coc-pairs',
\ 'coc-css',
\ 'coc-jest',
\ 'coc-snippets',
\ ]
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use <c-space> to trigger completion.
imap <silent><expr> <A-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
imap <C-l> <Plug>(coc-snippets-expand)
imap <C-j> <Plug>(coc-snippets-expand-jump)

call plug#end()

colorscheme challenger_deep
