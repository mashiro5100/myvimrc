set nocompatible
filetype plugin on
syntax on
call plug#begin()
Plug 'preservim/nerdtree'
" autocomplete quota
Plug 'Raimondi/delimitMate'
" color
Plug 'morhetz/gruvbox'
" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()



" custom
inoremap <C-l> <C-c>la



syntax enable
set hlsearch
set wildmode=list:longest,full

set backspace=indent,eol,start



let mapleader=" "
nnoremap <leader>vc :vsplit $MYVIMRC<cr>

nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>s :update<cr>

map <leader>ff :NERDTreeToggle<CR>





colorscheme gruvbox


if (executable('pyls'))
    au User lsp_setup call lsp#register_server({
	\ 'name': 'pyls',
	\ 'cmd': {server_info->['pyls', '-vv', '--log-file', '/Users/link/pyls.log']},
	\ 'whitelist': ['python']
	\ })
endif


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:asyncomplete_auto_completeopt=0
set completeopt=menuone,noinsert
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
