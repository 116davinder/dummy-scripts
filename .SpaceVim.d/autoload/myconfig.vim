function! myconfig#after() abort
  set noswapfile
  let g:spacevim_search_tools = ['rg', 'ag', 'pt', 'ack', 'grep']
  let g:spacevim_wildignore = '*/tmp/*,*.so,*.swp,*.zip,*.class,tags,*.jpg,*.ttf,*.TTF,*.png,*/target/*,.git,.svn,.hg,.DS_Store,*.svg'

  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * call TrimWhitespace()

endfunction
