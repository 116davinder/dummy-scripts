:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set noswapfile
:set clipboard+=unnamedplus

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/wsdjeg/FlyGrep.vim'  " Fly Grep with  -- apt install silversearcher-ag

set encoding=UTF-8

call plug#end()


nnoremap <Space>s/ :FlyGrep<cr>
:map <F3> :NERDTreeToggle<CR>

" save file with <space>+s
nnoremap <Space>s :update<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

:colorscheme gruvbox


" My Functions
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * call TrimWhitespace()
