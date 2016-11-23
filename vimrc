execute pathogen#infect()

filetype off
filetype plugin indent on

set nocompatible
se nowrap

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

iab ipdb from IPython.core.debugger import Tracer
iab iplt import matplotlib.pyplot as plt

set ts=4

" always keep a statusline
set laststatus=2


" write files for which we do not have rights by using sudo to copy a tmp-file
cmap w!! %!sudo tee > /dev/null %

" restore visual mode selection after indenting
vmap < <gv
vmap > >gv


let mapleader = ","

se nocompatible

" undo persistence
set undodir=~/.vim/undos


set expandtab
set sw=4
