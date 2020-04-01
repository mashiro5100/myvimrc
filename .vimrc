filetype plugin on
syntax on
set number

call plug#begin()
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'preservim/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
call plug#end()

" coc config
nmap <silent> gd <Plug>(coc-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap gn <Plug>(coc-rename)


set statusline^=%{coc#status()}

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

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeChDirMode=2
" let NERDTreeIgnore=['__pycache__', 'venv', 'DS_Store', 'git', '\.idea']


set wildignore+=*/venv/*,*.so,*.swp,*.zip,*/__pycache__/*,*/git/*


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

set splitright

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number
    autocmd WinLeave * set nonumber
augroup END
