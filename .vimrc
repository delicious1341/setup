" automatically add vim.plug "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
  Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
call plug#end()

" use zathura for live preview with vim-latex-live-preview plugin "
let g:livepreview_previewer = 'zathura '

" configuration for ultisnips plugin "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" enable line and relative numbers "
set number
set rnu

" highlight current line "
set cursorline
  :highlight Cursorline cterm=bold ctermbg=black

" remove underline from cursor line number "
:highlight CursorLineNr cterm=bold ctermbg=black

" enable highlight search "
set hlsearch

" search with no caps, ignores case"
set ignorecase

" search with caps, shows exact matches only"
set smartcase

" enable matching parenthesis "
set showmatch

" enable syntax "
syntax on

" enable mouse support "
set mouse=a
