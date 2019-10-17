set nocompatible
set showcmd

filetype plugin on
syntax on

let g:dracula_colorterm = 0

if ( $TERM ==? 'screen-256color' || $GDMSESSION !=? 'gnome' )
  let g:dracula_italic = 0
endif

:packadd! dracula
colorscheme dracula

set nu rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=black ctermfg=yellow
highlight NonText ctermbg=darkgrey

""set laststatus=2
""set statusline=test
