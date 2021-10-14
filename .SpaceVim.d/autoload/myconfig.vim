function! myconfig#after() abort
  set noswapfile

  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  autocmd BufWritePre * call TrimWhitespace()
endfunction
