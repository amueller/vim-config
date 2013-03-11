set nocompatible
se nowrap

call pathogen#infect()

iab ipdb from IPython.core.debugger import Tracer
iab iplt import matplotlib.pyplot as plt

filetype off
filetype plugin indent on

" ctags open vertical split
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set ts=4
set wildmenu
set wildmode=longest,full
nmap . .`[

"let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'

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

let g:autodate_keyword_pre = '__version__ = '
let g:autodate_keyword_post = ''


map Q mxgqip`x
map T :TlistToggle<CR>

" Alternate
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,cu"
let g:alternateExtensions_hpp = "c,cpp,cxx,cc,CC,cu"
let g:alternateExtensions_cu  = "h,hpp,H"
let mapleader = ","

" CTAGS
map <Leader>C :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <Leader>t :TodoOpen<CR>

" Popup Colors
hi Pmenu ctermfg=0 ctermbg=7
hi PmenuSel ctermfg=7 ctermbg=4
hi PmenuSbar ctermfg=0 ctermbg=4
hi PmenuThumb gui=reverse

" Filetypes
au BufEnter *.cu  set ft=cuda
au BufEnter *.cuh set ft=cuda
au BufNewFile,BufRead *.py,*pyw set filetype=python
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType python let python_highlight_all=1
au FileType python let python_print_as_function=1
au FileType python syn keyword pythonStatement class nextgroup=pythonClass skipwhite
au FileType python syn match pythonClass "[a-zA-Z_][a-zA-Z0-9_]*" display contained
au FileType python hi link pythonClass Type
let g:NERDShutUp=1

" requires vim-python and python-git
"function! CommitFile()
"python << EOF
"import vim, git
"curfile = vim.current.buffer.name
"if curfile:
    "try:
        "repo = git.Repo(curfile)
        "repo.git.add(curfile)
        "repo.git.commit(m='Automatic Update: File saved.')
        "i = os.popen("ifconfig eth0 | grep inet | awk '{print $2}' | sed -e s/.*://", "r").read()
        "if i.startswith('10.7.7.231'): os.popen("cd `dirname %s` ; git push bigcuda1 master 2>&1 > /dev/null" % curfile).read()
    "except (git.InvalidGitRepositoryError, git.GitCommandError):
        "pass
"EOF
"endfunction
"au BufWritePost *.wiki call CommitFile()
"let g:vimwiki_folding=1
"let g:vimwiki_fold_lists=1


" Python
"let $PYTHONPATH .= ":~/.vim/ropevim-0.3-rc"
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"let g:ropevim_autoimport_modules = ["os", "sys", "pdb"]
se nocompatible


" undo persistence
set undofile
set undodir=~/.vim/undos


let g:syntastic_cpp_check_header = 1
set expandtab
set sw=4

" quit if only quickfix window left
let s:cpo_save = &cpo
set cpo&vim
augroup plugin-now-quit-if-only-quickfix-buffer-left
    autocmd!
    autocmd WinEnter * if winnr('$') == 1 && &buftype == 'quickfix' | quit | endif
augroup end
let &cpo = s:cpo_save
unlet s:cpo_save

