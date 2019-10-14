execute pathogen#infect()

set nocompatible
filetype plugin on
syntax on

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""set background=dark
""colorscheme dracula

set rnu
highlight LineNr ctermbg=darkgrey ctermfg=yellow
highlight CursorLineNr ctermbg=darkgrey ctermfg=yellow
highlight NonText ctermbg=darkgrey
