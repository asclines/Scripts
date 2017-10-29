" Format code
noremap <C-K> :pyf /usr/lib/clang-format/clang-format.py<CR>
inoremap <C-K> <C-O>:pyf /usr/lib/clang-format/clang-format.py<CR>

" Handling splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy Shift
vnoremap < <gv
vnoremap > >gv
