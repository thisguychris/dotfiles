" this unloads netrw
let g:loaded_netrw= 1
let g:netrw_loaded_netrwPlugin= 1 

augroup dirvish_config
  autocmd!

  let g:dirvish_mode = ':sort ,^.*[\/],'
	set splitright                     " to control dirvish preview option
  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
augroup END
