" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'leafgarland/typescript-vim'
Plug '$HOME/Projects/vim-cds'
Plug 'airblade/vim-gitgutter'
Plug 'bfrg/vim-jq'

" Add plugins to &runtimepath
call plug#end()

set nocompatible
syntax on
filetype plugin indent on

set background=dark
set encoding=utf-8
set ts=2
set expandtab
set shiftwidth=2
set number relativenumber
set splitbelow splitright
set linebreak

let mapleader = ","

" Prevent any use of the cursor keys by mapping them to 'no operation'
noremap <Up>    <nop>
noremap <Down>  <nop>
noremap <Left>  <nop>
noremap <Right> <nop>

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>gs :Gstatus<cr>

" Automatically turn on auto-save for markdown files (so I can live preview them)
autocmd FileType markdown let g:auto_save = 0

" Integrate Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Shortcutting split navigation, saves a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Edit and source .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Check leading whitespace
set listchars=tab:▸·,eol:¬
nnoremap <silent> <leader>l :set list!<cr>

" Abbreviations
iabbrev scp SAP Cloud Platform
iabbrev s4h S/4HANA
iabbrev sbs side-by-side
iabbrev s4s S/4HANA Cloud SDK
" iabbrev hosd https://bit.ly/handsonsapdev
iabbrev capcom https://bit.ly/cap-com
iabbrev SRIKANTHPERI [Srikanth Peri](https://people.sap.com/speri)
iabbrev RONNIESLETTA [Ronnie Sletta](https://people.sap.com/rsletta)
iabbrev CHRISWHEALY [Chris Whealy](https://people.sap.com/chris.whealy)
iabbrev THOMASJUNG [Tom Jung](https://people.sap.com/thomas.jung)
iabbrev MARIUSOBERT [Marius Obert](https://people.sap.com/mariusobert)
iabbrev GREGORWOLF [Gregor Wolf](https://people.sap.com/gregor.wolf)
iabbrev MARKTEICHMANN [Mark Teichmann](https://people.sap.com/mark.teichmann)
iabbrev BRENTONOCALLAGHAN [Brenton O'Callaghan](https://people.sap.com/ocallaghan001)
iabbrev PIERREDOMINIQUE [Pierre Dominique](https://people.sap.com/pdominique-bio)
iabbrev VOLKERBUZEK [Volker Buzek](https://people.sap.com/vobu)
iabbrev HENDRIKNEUMANN [Hendrik Neumann](https://people.sap.com/hendrik.neumann)
iabbrev HELMUTTAMMEN [Helmut Tammen](https://people.sap.com/helmut.tammen2)
iabbrev LARSHVAM [Lars Hvam](https://people.sap.com/lars.hvam)
iabbrev ENNOWULFF [Enno Wulf](https://people.sap.com/enno.wulff)
iabbrev NABHEETMADAN [Nabheet Madan](https://people.sap.com/nabheetscn)
iabbrev MAXSTREIFENEDER [Max Streifeneder](https://people.sap.com/iinside)
iabbrev JOHNMURRAY [John Murray](https://people.sap.com/jbm1991)
iabbrev CHRISTIANDRUMM [Christian Drumm](https://people.sap.com/christian.drumm)
iabbrev PHILCOOLEY [Phil Cooley](https://people.sap.com/phil.cooley)
iabbrev hosd https://bit.ly/handsonsapdev

" Quick insertions of various patterns when writing markdown
autocmd FileType markdown inoremap ii -<space>[<space>]<space>
autocmd FileType markdown inoremap ppp :point_right:<space>

" To enable project/folder specific vimrc settings
" (see https://andrew.stwrt.ca/posts/project-specific-vimrc/)
"set exrc

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
"let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:airline#extension#ale#enabled = 1

nnoremap <silent> <leader>ll :call LocationToggle()<cr>
nnoremap <silent> <leader>gd :ALEGoToDefinition<cr>
nnoremap <silent> <leader>fr :ALEFindReferences<cr>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Bind Ctrl-P to use fzf 'Files' command now
nnoremap <c-p> :Files<cr>

" Improve search UI
set hlsearch incsearch
nnoremap <leader>h :set hls!<cr>

" See https://github.com/neovim/neovim/issues/5559#issuecomment-258143499
let g:is_bash = 1

" Git features
nnoremap <leader>g  :G<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>

nnoremap [[ :bprev<cr>
nnoremap ]] :bnext<cr>

" Ignore markdown complaints about underscores
" (see https://github.com/tpope/vim-markdown/issues/21)
autocmd FileType markdown syn match markdownError "\w\@<=\w\@="


" More steps towards improving my shell scripting.
" If it exists, use shfmt (see https://github.com/mvdan/sh)
" to format Bash scripts on write. Using options to get close
" to the Google Shell Style Guide:
" -i 2  two spaces indent
" -bn   binary operators like && and | may start a line
" -ci   switch cases will be indented
" -sr   redirect operators will be followed by a space
fun! s:FormatBashScripts()
  if getline(1) =~# '^#!.*bash' && executable('shfmt')
    %!shfmt -i 2 -bn -ci -sr -
  endif
endfun
"autocmd BufWritePre * call s:FormatBashScripts()

highlight clear SignColumn
set cursorline
hi CursorLine term=none cterm=bold ctermbg=darkgrey
hi CursorLineNr cterm=none

" Make comments italic
" See https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
hi Comment cterm=italic gui=italic
set t_ZH=[3m
set t_ZR=[23m

" 'I want to scroll like rwxrob'
set scroll=1 "affects C-D,C-U

hi MatchParen cterm=none ctermbg=green ctermfg=white

set colorcolumn=72
