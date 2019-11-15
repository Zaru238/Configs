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

" Suppress completion messages
set shortmess+=c

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

" Disable swap file
set noswapfile

" Disable backup files
set nobackup
set nowritebackup

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

" shortcuts
nnoremap <leader>s :wa<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>m :wa<CR> :make<CR>

" toggle quickfix window
function! ToggleQuickfix()
   let before_win_count = winnr('$')
   cclose
   if winnr('$') == before_win_count
     copen
   endif
 endfunction

nnoremap <silent> <space>q :<C-u>call ToggleQuickfix()<CR>


" plugin istallation
call plug#begin('~/.config/nvim/plugged')

  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/a.vim'
  Plug 'tpope/vim-commentary'
  Plug 'pboettch/vim-cmake-syntax'
  Plug 'mcchrish/nnn.vim'
  Plug 'rhysd/vim-clang-format'
  Plug 'airblade/vim-gitgutter'
  Plug 'kshenoy/vim-signature'
  Plug 'cohama/lexima.vim'
  Plug 'matze/vim-move'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'

call plug#end()

" lightline plugin configuration
let g:lightline =
\ { 'colorscheme': 'solarized',
\   'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'cocstatus', 'currentfunction','readonly', 'filename', 'modified' ] ] },
\   'component_function': { 'filename': 'LightLineFilename',
\                           'cocstatus': 'coc#status',
\                           'currentfunction': 'CocCurrentFunction',
\   },}

function! LightLineFilename()
  return expand('%')
endfunction

" fzf.vim plugin configuration
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
nnoremap <C-g> :Rg<CR>

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

"vim-move plug configuration
let g:move_key_modifier = 'C'

" coc plug configuration

" Use K to show documentation in preview window
nnoremap <silent> <space>i :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Jump between declaration & definition
nmap <silent>  <space>d <Plug>(coc-definition)
" Show all references
nmap <silent> <space>r <Plug>(coc-references)
" Remap for rename current word
nmap <space>n <Plug>(coc-rename)
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Do default action for next item.
nnoremap <silent> <space>k  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>j  :<C-u>CocPrev<CR>

" vim-lsp-cxx-highlight plugin configuration
hi default LspCxxHlGroupMemberVariable ctermfg=Brown guifg=Brown
hi link LspCxxHlGroupNamespace cppExceptions
