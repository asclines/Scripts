" Personal/ 3rd party plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'chriskempson/base16-vim'
Plug 'hzchirs/vim-material'
Plug 'dracula/vim'

" Autocomplete
Plug 'shougo/deoplete.nvim'
Plug 'Shougo/neocomplete.vim'

" Visual Interface
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Code formatting
Plug 'Raimondi/delimitMate' " For closing of things

" Snippers
Plug 'SirVer/ultisnips' " For snippets
Plug 'honza/vim-snippets' " External snippets collection

" Fuzzy File
Plug 'ctrlpvim/ctrlp.vim'

"Initialize plugin system
call plug#end()


