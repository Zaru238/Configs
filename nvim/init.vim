" how relative line numbers and min number colomn width
set number
set relativenumber
set numberwidth=4

" Highlight searched word. Highlight is disabled by :noh ex
set hlsearch

" Start highligh at typing start
set incsearch

" Tab autoindent stuff
set expandtab
set softtabstop=2

" Autoindent stuff
set shiftwidth=2
set autoindent

" Show spaces, tabs and trail whitespace
set list
set listchars=space:ˑ,tab:>-,trail:■

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

" disable mode show (lightline plugin shows mode now)
set noshowmode

" status settings
set laststatus=2

" reload file on external change
set autoread

" set input delay
set timeoutlen=500
set ttimeoutlen=100

" generate ctags hotkey
nnoremap <f5> :!ctags -R -h "h.hpp.c.cpp"<CR>

" Substitute jump to first tag with jump that can handle several destination
nnoremap <C-]> g<C-]>

" cnext cpevious hotkeys
nnoremap gn :cnext<CR>
nnoremap gp :cprevious<CR>

" set width exceeding line hint
set colorcolumn=81

" disable width exceeding line hint for quickfix window
augroup colorcolumn_qf
    autocmd!
    au FileType qf setlocal colorcolumn=
augroup END

" Swap physical line move up/down with display line one's
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Words aren't divided on line break
set wrap
set linebreak

" set how often file is written to disk. Affects gitgutter plugin update time
set updatetime=100

" always show sign column
set signcolumn=yes


" plugin istallation
call plug#begin('~/.config/nvim/plugged')

  Plug 'itchyny/lightline.vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/fzf' }
  Plug 'vim-scripts/a.vim'
  Plug 'tpope/vim-commentary'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
  Plug 'pboettch/vim-cmake-syntax'
  Plug 'mcchrish/nnn.vim'
  Plug 'rhysd/vim-clang-format'
  Plug 'airblade/vim-gitgutter'
  Plug 'kshenoy/vim-signature'
  Plug 'cohama/lexima.vim'

call plug#end()

" lightline plugin configuration
let g:lightline =
\ { 'colorscheme': 'solarized',
  \ 'component_function': { 'filename': 'LightLineFilename' }, }

function! LightLineFilename()
  return expand('%')
endfunction

" vim-cpp-enhanced-highlight plugin configuration (though looks like these
" options doesn't affect anything
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" fzf plugin configuration
let $FZF_DEFAULT_COMMAND = 'rg --files'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <C-p> :FZF<CR>

" a.vim plugin configuration
nnoremap <C-a> :A<CR>

" nnn plugin configuration
function! GetCurrentBufferDirectory()
  let l:curBufDir = expand('%:p')
  if isdirectory(l:curBufDir) ==# 0
    let l:curBufDir = expand('%:p:h')
  endif
  return l:curBufDir
endfunction

let g:nnn#set_default_mappings = 0
let g:nnn#replace_netrw = 1
nnoremap <C-n> :call nnn#pick(GetCurrentBufferDirectory())<CR>

" vim-clang-format plug configuration
let g:clang_format#code_style = "google"

nnoremap <C-s> :ClangFormat<CR>
vnoremap <C-s> :ClangFormat<CR>

"vim-signature plug configuration
let g:SignatureMap = {
  \ 'ListBufferMarkers'  :  "<Nop>"
  \ }

nnoremap m? :SignatureListGlobalMarks<CR>
