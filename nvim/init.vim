" how relative line numbers
set number
set relativenumber

" Highlight searched word. Highlight is disabled by :noh ex
set hlsearch

" Tab autoindent stuff
set expandtab
set softtabstop=2

" Autoindent stuff
set shiftwidth=2
set autoindent

" Show spaces, tabs and trail whitespace
set list
set listchars=space:·,tab:>-,trail:■

" Allow switch buffers without saving or discarding changes
set hidden

" Set tab autocomplete schema
set wildmenu
set wildmode=full

" Set search directories path
set path+=**

" Editor colorscheme
set t_Co=16
set background=dark " dark | light "
colorscheme solarized

" Set the clipboard as the default register
set clipboard=unnamedplus

" Set swap file save directory
set swapfile
set dir=~/.vim/temp

" Set case insensetive find, search and etc.
set ignorecase

" Set syntax highlight
syntax enable
