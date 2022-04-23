" ****** Basic configuration ******
set scrolloff=8
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf8
let g:airline_powerline_fonts = 1

" ****** Plugins ******
call plug#begin("~/.vim/plugged")

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'dracula/vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch':'release'}
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-pyright',
    \ 'coc-pydocstring',
    \ 'coc-json',
    \ 'coc-html-css-support',
    \ 'coc-css',
    \ 'coc-sql',
    \ 'coc-yaml'
    \]
Plug 'sheerun/vim-polyglot',
Plug 'bronson/vim-trailing-whitespace'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ****** Theme ******
if (has("termguicolors"))
set termguicolors
endif
syntax enable
colorscheme dracula

" ****** General mappings ******
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
inoremap jk <esc>:w<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-S> :update<cr>

" ****** NERDTree config ******
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['node_modules', '__pycache__']
let NERDTreeStatusLine='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-a> :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow

" ****** split navigations ******
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ****** tab navigations ******
map  <S-l> :tabn<CR>
map  <S-h> :tabp<CR>
map  <S-t> :tabnew<CR>

" ****** move lines ******
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ****** Terminal setup ******
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
split term://zsh
resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

augroup TerminalEnter
    autocmd!
    " Enter edit mode on terminal enter
    autocmd WinEnter term://* :startinsert
    " Autoresize terminal window
    autocmd WinLeave term://* :resize 1
    autocmd WinEnter term://* :resize 10
augroup END

" ****** Coc.nvim ******
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
