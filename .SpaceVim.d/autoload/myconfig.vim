function! myconfig#after() abort
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * call TrimWhitespace()

endfunction

" ----- Config Changes
set noswapfile
set mouse=r
let g:spacevim_search_tools = ['ag', 'pt', 'ack', 'grep']
let g:spacevim_wildignore = '*/tmp/*,*.so,*.swp,*.zip,*.class,tags,*.jpg,*.ttf,*.TTF,*.png,*/target/*,.svn,.hg,.DS_Store,*.svg'
