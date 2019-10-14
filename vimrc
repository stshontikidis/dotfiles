set nocompatible

set termguicolors

filetype plugin on
syntax on

let g:dracula_italic = 0
let g:dracula_colorterm = 0

:packadd! dracula
colorscheme dracula

set rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=darkgrey ctermfg=yellow
highlight NonText ctermbg=darkgrey
