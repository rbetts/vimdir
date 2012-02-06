let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" set up pathogen
filetype on     "filetype off (when off) causes non-zero vim $?
filetype off    "filetype off for pathogon.
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocp
set backspace=2  " backspace over the whole world.
set encoding=utf-8
set rtp+=$HOME/go/misc/vim
set path=.**,,**        " curr file's cwd and vim's cwd descending
set hidden              " allow modified buffers to be hidden
set switchbuf=useopen   " don't make new buffers when switching
set vb                  " virtual bell vs. beep
set cpoptions=ces$      " help :cpoptions
set virtualedit=block   " allow block edits in non-space
set ignorecase          " search ignores case
set smartcase
set incsearch           " search is incremental
set hlsearch            " search highlights
set wrapscan            " wrap searches
set noswapfile
set nobackup            " do not keep backups (for write/renames)
set ruler               " cursor position
set laststatus=2        " show the status line.
set cmdheight=2
set showmode
set showmatch
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.obj,*.class,*.jar,*~,*.pyc,*.so,*.a,*.gif
set guioptions=a        " turn of toolbar, menu, scrollbars
set guifont=Inconsolata

" reduce vertical cursor width in insert mode.
set guicursor="n-v-c:block-Cursor/lCursor, ve:ver35-Cursor, o:hor50-Cursor, i-ci:ver25-Cursor/lCursor, r-cr:hor20-Cursor/lCursor, sm:block-Cursor -blinkwait175-blinkoff150-blinkon175"

syntax on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cinoptions=:2,=2,l1,g2,h2,t0,(0,W4,j1   " C indentation options.
set nowrap
set scrolloff=5                              " keep n lines top/bottom for scope

" Kill trailing whitepace on save. From stackoverflow/questions/356126
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType css,xml,c,cpp,h,java,py,javascript,html,go,sh,pl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

let mapleader = ","
let g:mapleader = ","

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Window movement remappings - override the comma movement operator
" http://www.derekwyatt.org/vim/the-vimrc-file/walking-around-your-windows/
noremap <silent> <C-h> :wincmd h<cr>   " Move the cursor to the window left of the current one
noremap <silent> <C-j> :wincmd j<cr>   " Move the cursor to the window below the current one
noremap <silent> <C-k> :wincmd k<cr>   " Move the cursor to the window above the current one
noremap <silent> <C-l> :wincmd l<cr>   " Move the cursor to the window right of the current one

" From destroyallsoftware - turn splits into a sized stack. We'll see...
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Use CTRL-S for saving, also in Insert mode
noremap <silent> <C-s>  :update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" reasonable completion menu behavior for clang_complete
" set completeopt=menu,longest,preview
" let g:clang_user_options='|| exit 0'
" let g:clang_periodic_quickfix=1
" let g:clang_user_library=1
" let g:clang_library_path="/home/rbetts/src/llvm_build/Release+Asserts/lib"
" nmap <silent> <leader>ee <Esc>:call g:ClangUpdateQuickFix()<CR>

" use menu, highlight longest match, allow preview information
set completeopt=menu,longest,preview
" disable include searching for completions.
set complete-=i

let g:EclimJavaSearchSingleResult='edit'
let g:EclimValidateSortResults = 'severity'
noremap ,im :JavaImportMissing<CR>

" auto-highlight the first selection the tab completion list
let g:SuperTabLongestHighlight=1
" deduce completion type from preceding text.
let g:SuperTabDefaultCompletionType = "context"

" add git branch to status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{fugitive#statusline()}

" map Ctrl-Enter to Escape to exit insert-mode
inoremap <C-CR> <Esc>
inoremap jj <Esc>

" use the bundled matchit.vim
source $VIMRUNTIME/macros/matchit.vim

" Use suggested Gundo binding
nnoremap <F5> :GundoToggle<CR>

" Store yankring somewhere other than $HOME
let g:yankring_history_dir="~/.vim"

" protobuf highlighting
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
