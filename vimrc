set nocompatible
set showcmd

filetype plugin indent on
syntax on

set autoindent
set smarttab
set wildmenu

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

:packadd! vim-airline

set nu rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=black ctermfg=yellow
highlight NonText ctermbg=darkgrey

