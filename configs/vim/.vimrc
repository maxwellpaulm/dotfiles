" Custom Vim Configuration
" Enable line numbers
set number

" Custom navigation mappings using jkl;
" Map jkl; to hjkl (left, down, up, right)
noremap j h
noremap k j
noremap l k
noremap ; l

" Also map in visual mode
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l

" Custom shortcuts with 's' prefix
" s; -> end of line
noremap s; $
" sj -> start of line  
noremap sj ^
" sk -> down half page
noremap sk <C-d>
" sl -> up half page
noremap sl <C-u>

" Custom delete mappings with 'd' prefix
" d; -> delete to end of line
noremap d; d$
" dj -> delete to beginning of line
noremap dj d^

" Optional: Make sure these work in insert mode navigation too
" (You can comment these out if you prefer default insert mode behavior)
inoremap <C-j> <Left>
inoremap <C-k> <Down>
inoremap <C-l> <Up>
inoremap <C-;> <Right>

" Basic vim improvements (optional - remove if you don't want them)
set nocompatible        " Disable vi compatibility
set encoding=utf-8      " Set encoding
syntax enable           " Enable syntax highlighting
set autoindent          " Auto indent
set smartindent         " Smart indent
set tabstop=4           " Tab width
set shiftwidth=4        " Indent width
set expandtab           " Use spaces instead of tabs
set hlsearch            " Highlight search results
set incsearch           " Incremental search
set ignorecase          " Case insensitive search
set smartcase           " Case sensitive if uppercase present
