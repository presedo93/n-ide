" ****** Basic configuration ******
set scrolloff=8
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf8

" ****** Plugins ******
call plug#begin("~/.vim/plugged")

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'dracula/vim'

" ****** NERDTree & commenter ******
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" ****** Conquer of Completion ******
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
Plug 'yaegassy/coc-tailwindcss3', {'do': 'yarn install --frozen-lockfile'}

" ****** Other plugins ******
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot',
Plug 'bronson/vim-trailing-whitespace'
Plug 'cohama/lexima.vim'

" ****** Airline ******
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ****** Theme ******
if (has("termguicolors"))
set termguicolors
endif
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" ****** General mappings ******
let mapleader = ","
let g:mapleader = ","
nnoremap <leader>v :Vex<CR>
nnoremap <leader>f :Files<CR>
inoremap jk <esc>:w<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-S> :update<CR>
nnoremap <C-A-S> :wq<CR>
nnoremap <F2> :q<CR>

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

" ****** change split navigations ******
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ****** resize split windows ******
nnoremap <silent> <C-A-K> <C-W>-<CR>
nnoremap <silent> <C-A-J> <C-W>+<CR>
nnoremap <silent> <C-A-H> <C-W><<CR>
nnoremap <silent> <C-A-L> <C-W>><CR>

" ****** tab navigations ******
map <C-Left> :tabp<CR>
map <C-Right> :tabn<CR>
map <C-T> :tabnew<CR>

" ****** Jump 20 lines ******
nnoremap <silent> <leader>j 20j<CR>
nnoremap <silent> <leader>k 20k<CR>

" ****** move lines ******
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ****** delete and cut ******
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ****** ack.vim ******

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
