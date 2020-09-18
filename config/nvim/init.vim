set smartcase
set ignorecase
set incsearch
set hlsearch

syntax on
filetype plugin indent on

set hidden

set mouse=a

set number

set nowrap
set textwidth=80
set linebreak

set so=5
set sidescroll=20

set whichwrap=b,s,<,>,l,h

set tabstop=2 shiftwidth=2 expandtab

let mapleader=","

set ut=300

set shortmess+=c

map <Leader>r :so $MYVIMRC<cr>

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
let g:coc_global_extensions = [
\ 'coc-html',
\ 'coc-css',
\ 'coc-emmet',
\ 'coc-eslint',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-tabnine',
\ 'coc-snippets',
\ 'coc-prettier',
\ 'coc-pairs',
\ 'coc-snippets',
\ 'coc-markdownlint',
\ 'coc-actions',
\ 'coc-calc',
\ 'coc-explorer',
\ 'coc-graphql',
\ 'coc-sh',
\ 'coc-stylelint',
\ 'coc-fzf-preview',
\ 'coc-sql',
\ 'coc-template',
\ ]
" <tab> for trigger completion, completion confirm, snippet expand and jump
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" <CR> to confirm competion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
function Format() 
  call CocAction('runCommand', 'tsserver.organizeImports')
  call CocAction('runCommand', 'prettier.formatFile')
  " call CocAction('runCommand', 'eslint.executeAutofix')
endfunction

nmap <leader>qf :call Format()<CR>

" coc-explorer
nmap <leader>e :CocCommand explorer<CR>

" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" coc-fzf-preview
nmap <leader>fp :call CocAction('runCommand', 'fzf-preview.ProjectFiles')<CR>
" open buffers list
nmap <leader>fb :call CocAction('runCommand', 'fzf-preview.Buffers')<CR>
" last written
nmap <leader>fw :call CocAction('runCommand', 'fzf-preview.MrwFiles')<CR>
" last used
nmap <leader>fu :call CocAction('runCommand', 'fzf-preview.ProjectMruFiles')<CR>
" marks
nmap <leader>fm :call CocAction('runCommand', 'fzf-preview.Marks')<CR>
" jumps
nmap <leader>fm :call CocAction('runCommand', 'fzf-preview.Jumps')<CR>
" last changes
nmap <leader>flc :call CocAction('runCommand', 'fzf-preview.Changes')<CR>
" git actions
nmap <leader>fga :call CocAction('runCommand', 'fzf-preview.GitActions')<CR>
" look references on cursor
nmap <leader>fr :call CocAction('runCommand', 'fzf-preview.CocReferences')<CR>
" project diagnostic
nmap <leader>fdp :call CocAction('runCommand', 'fzf-preview.CocDiagnostics')')<CR>
" current file diagnostic
nmap <leader>fcd :call CocAction('runCommand', 'fzf-preview.CocCurrentDiagnostics')')<CR>
" end of coc

Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

Plug 'easymotion/vim-easymotion'

Plug 'vim-scripts/matchit.zip'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'

Plug 'sjl/gundo.vim'

Plug 'plasticboy/vim-markdown'

Plug 'mileszs/ack.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf'

Plug 'jparise/vim-graphql'

Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
