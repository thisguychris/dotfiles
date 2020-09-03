
if (has("termguicolors"))
  set termguicolors
endif


colorscheme gruvbox

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_sign_column_background = 'none'

let g:gruvbox_invert_selection='0'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_contrast_dark = 'hard'

" For dark version.
set background=dark
" hi Normal guibg=#1d2021
" hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE

" hi netrwMarkFile guibg=#ff00ff ctermbg=#ff00ff
hi netrwMarkFile guibg=#ff00ff


" hi Floating guibg=#000044
hi Pmenu guibg=#1a1a1a
hi Term guibg=#1a1a1a
hi Floating guibg=#000000 ctermbg=NONE
