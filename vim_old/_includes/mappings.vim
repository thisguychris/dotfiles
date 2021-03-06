" ---- mappings
" make it easy to edit vimrc file use $myvimrc as global variable
nmap <Leader>es :update<cr>
nmap <silent><Leader>ev :tabnew <bar>:tcd ~/dotfiles<bar>:e ./vim/.vimrc<cr><cr><cr>

noremap <silent><Leader>z :update<cr>
noremap <silent><Leader>q :q<cr>
noremap <silent><Leader>Q :q!<cr>
noremap <silent><Leader>a :qa<cr>
noremap <silent><Leader>A :qa!<cr>
noremap <silent><Leader>o :only<cr>
noremap <silent><Leader>w <C-w>
noremap <Leader>mm :Move <C-r>=expand("%:p:h")<cr>

" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

nnoremap / /\v
vnoremap / /\v

" remap split
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s

" general enhancements
" alternative for multi cursors
" thanks Kevin, taken from: http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *Ncgn
nnoremap cN *NcgN

vnoremap <expr> cn g:mc . "Ncgn"
vnoremap <expr> cN g:mc . "NcgN"
vnoremap cc c

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

nnoremap <Leader>l :ls<CR>:b<space>

" Quickly create a new terminal in a vertical split
tnoremap <Leader>5 <C-\><C-n>:vsp<CR><C-w><C-w>:term<CR>I
noremap <Leader>5 :vsp<CR><C-w><C-w>:term<CR>I
inoremap <Leader>5 <Esc>:vsp<CR><C-w><C-w>:term<CR>I

" Quickly create a new terminal in a horizontal split
tnoremap <Leader>6 <C-\><C-n>:sp<CR><C-w><C-w>:term<CR>I
noremap <Leader>6 :sp<CR><C-w><C-w>:term<CR>I
inoremap <Leader>6 <Esc>:sp<CR><C-w><C-w>:term<CR>I

" close buffer
nnoremap <silent> \x :cclose<CR>
nnoremap <silent> \c :copen<CR>

nnoremap <Leader>ct :ColorToggle<CR>

map <silent> <Leader>ex :Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>R

