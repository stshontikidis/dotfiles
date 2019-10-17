set nocompatible
set showcmd

filetype plugin on
syntax on

set termguicolors
let g:dracula_italic = 0
let g:dracula_colorterm = 0

:packadd! dracula
colorscheme dracula

set nu rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=darkgrey ctermfg=yellow
highlight NonText ctermbg=darkgrey

""set laststatus=2
""set statusline=test
