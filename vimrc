set nocompatible
se nowrap

execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

iab ipdb from IPython.core.debugger import Tracer
iab iplt import matplotlib.pyplot as plt

filetype off
filetype plugin indent on

set ts=4

" always keep a statusline
set laststatus=2

" lets see whether that works out.
imap jj <Esc>

" write files for which we do not have rights by using sudo to copy a tmp-file
cmap w!! %!sudo tee > /dev/null %

" restore visual mode selection after indenting
vmap < <gv
vmap > >gv

" show the (partial) command in last line of screen, turn off for slow
" terminals
set showcmd

" completion: show more infos
set showfulltag


let mapleader = ","

se nocompatible

" undo persistence
set undodir=~/.vim/undos


set expandtab
set sw=4
