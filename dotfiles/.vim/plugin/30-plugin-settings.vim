" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Neovim
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_auto_select=1

" Utilsnips settings
let g:UltiSnipsEditSplit="vertical"

" YCM settings
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"CTRLP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['BUILD']

