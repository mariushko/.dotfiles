set nocompatible
set t_Co=256
" colorscheme pablo

syntax on

set formatoptions=tcq
set modeline
set smartindent
set hlsearch
set nopaste
set cursorcolumn
hi CursorColumn ctermbg=black
set backspace=indent,eol,start
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab

" Markdown
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 et

" podświetl na czerwono białe znaki na końcu linii
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" usuń podświetlenie w znalezionych wynikach wyszukiwania
nnoremap <F12> :let @/ = "" <CR>

" przełączaj między trybami paste/nopaste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
