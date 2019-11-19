set nocompatible
set showcmd 

"Incremental highlight of search and highlight all
"will allow to clear highlights with ctrl-l
set incsearch
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>

filetype plugin indent on
syntax on

set autoindent
set smarttab
set wildmenu

" All tabs are 4 and use spaces instead of tab
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

set backspace=2 " Allow backspace in insert mode delete wrapped lines

" Start scrolling screen when cursor is n lines away from top/bottom/side
set scrolloff=2
set sidescrolloff=5

set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

let g:dracula_colorterm = 0

if ( $TERM ==? 'screen-256color' || $GDMSESSION !=? 'gnome' )
  let g:dracula_italic = 0
endif

:packadd! dracula
colorscheme dracula

:packadd! gitgutter
:packadd! fugitive
:packadd! vim-airline
:packadd! jedi-vim
":packadd! vim-pyenv

"if jedi#init_python()
"  function! s:jedi_auto_force_py_version() abort
"    let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
"  endfunction
"  augroup vim-pyenv-custom-augroup
"    autocmd! *
"    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
"    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
"  augroup END
"endif

set updatetime=500 "helps gitgutter update ever 1/2 second

"Line Numbering and color scheme for gutter, numbers and unused buffer
set nu rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=black ctermfg=yellow
highlight NonText ctermbg=darkgrey

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre *.py :call TrimWhitespace()

augroup WrapLineTxtFile
    autocmd!
    autocmd FileType text setlocal wrap textwidth=80
augroup END
