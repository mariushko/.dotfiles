" wyłączenie wstecznej zgodności z vi
set nocompatible

" ustawienie obsługi 256 kolorów
set t_Co=256

" tu będziemy instalować pluginy
let home_vim = '~/.vim'

" ----------------------------------------------------------
" instalacja i aktywacja schematu kolorów
" try
"   if empty(glob(home_vim . '/colors/codeschool.vim'))
"     if !isdirectory(home_vim . '/colors')
"       silent execute '!mkdir -p '.home_vim.'/colors'
"     endif
"     silent execute '!curl -sfLo - '
"     \ 'https://raw.githubusercontent.com/akmassey/vim-codeschool/master/colors/codeschool.vim '
"     \ '| sed "s/Code School 3/codeschool/" > '.home_vim.'/colors/codeschool.vim'
"   endif
"   colorscheme codeschool
" catch
"   colorscheme pablo
" endtry
" ----------------------------------------------------------

" ----------------------------------------------------------
" instalacja i aktywacja schematu kolorów
try
  if empty(glob(home_vim . '/colors/solarized.vim'))
    if !isdirectory(home_vim . '/colors')
      silent execute '!mkdir -p '.home_vim.'/colors'
    endif
    silent execute '!curl -sfLo '.home_vim.'/colors/solarized.vim '
    \ 'https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim'
  endif
  " let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set background=dark
  colorscheme solarized
catch
  colorscheme pablo
endtry
" ----------------------------------------------------------

" ----------------------------------------------------------
"  instalacja managera pluginów
try
  if empty(glob(home_vim . '/autoload/plug.vim'))
    silent execute '!curl -sfLo '.home_vim.'/autoload/plug.vim --create-dirs '
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  let plugin_manager_loaded = 1
catch
  let plugin_manager_loaded = 0
endtry
" ----------------------------------------------------------
syntax on

set formatoptions=tcq
set modeline
set smartindent
set hlsearch
set nopaste
set cursorcolumn
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

" zwijanie kodu:
" set foldmethod=syntax   "fold based on indent
" set foldnestmax=2       "deepest fold is 5 levels
" set foldlevel=1         "this is just what i use
" set nofoldenable        "dont fold by default
" set foldcolumn=3
" nnoremap <Space> za
" map <Backspace> zc

" tryb pracy myszki
" set mouse=a

" usuń podświetlenie w znalezionych wynikach wyszukiwania
nnoremap <F12> :let @/ = "" <CR>

" przełączaj między trybami paste/nopaste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" ----------------------------------------------------------
" Załaduj jeśli udało się załadować managera pluginów
if plugin_manager_loaded == 1

  " pokaż przeglądarkę plików (plugin)
  nnoremap <F3> :NERDTreeToggle <CR>
  " po wybraniu plików zamknij przeglądarkę plików
  let NERDTreeCustomOpenArgs = {'file':{'keepopen': 0}}

  " 'status line' (plugin lightline) ma się wyświetlać cały czas
  set laststatus=2
  " ponieważ używamy 'status line' to już nie trzeba wyświetlać trybu pracy
  set noshowmode
  " ustaw schemat kolorów 'status line' (plugin)
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ }

  " Załadowanie pluginów
  call plug#begin(home_vim.'/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'itchyny/lightline.vim'
  call plug#end()
endif
" ----------------------------------------------------------
