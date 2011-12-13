" let g:zenesque_colors=3
" colorscheme zenesque

let g:solarized_termcolors=16
set background=dark
colorscheme solarized

set nocp
set backspace=2  " backspace over the whole world.

" set up pathogen
filetype on     "filetype off (when off) causes non-zero vim $?
filetype off    "filetype off for pathogon.
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

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

set nobackup            " no backups after close
set nowritebackup         " safe writes
set noswapfile

set ruler               " cursor position
set laststatus=2        " show the status line.
set cmdheight=2
set showmode
set showmatch
set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class
set guioptions=a        " turn of toolbar, menu, scrollbars
set guifont=Inconsolata:h14

" reduce vertical cursor width in insert mode.
set guicursor="n-v-c:block-Cursor/lCursor, ve:ver35-Cursor, o:hor50-Cursor, i-ci:ver5-Cursor/lCursor, r-cr:hor20-Cursor/lCursor, sm:block-Cursor -blinkwait175-blinkoff150-blinkon175"

syntax on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cinoptions=:2,=2,l1,g2,h2,t0,(0,W4,j1   " C indentation options.
set nowrap
set scrolloff=5         " keep n lines top/bottom for scope

" Kill trailing whitepace on save. From stackoverflow/questions/356126
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType css,xml,c,cpp,java,py,javascript,html autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Folding commands. Not really sure about these yet.
" set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

let mapleader = ","
let g:mapleader = ","

noremap <leader>ss z= "suggest a spelling correction
noremap <leader>sn ]s "next mis-spelled word
noremap <leader>sp [s "previous mis-spelled word

" Window movement remappings - override the comma movement operator
" http://www.derekwyatt.org/vim/the-vimrc-file/walking-around-your-windows/
noremap <silent> <C-h> :wincmd h<cr>   " Move the cursor to the window left of the current one
noremap <silent> <C-j> :wincmd j<cr>   " Move the cursor to the window below the current one
noremap <silent> <C-k> :wincmd k<cr>   " Move the cursor to the window above the current one
noremap <silent> <C-l> :wincmd l<cr>   " Move the cursor to the window right of the current one
noremap <silent> ,ml <C-W>L         " Move the current window to the right of the main Vim window
noremap <silent> ,mk <C-W>K     " Move the current window to the top of the main Vim window
noremap <silent> ,mh <C-W>H     " Move the current window to the left of the main Vim window
noremap <silent> ,mj <C-W>J     " Move the current window to the bottom of the main Vim window


" Use CTRL-S for saving, also in Insert mode
noremap <silent> <C-s>  :update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" reasonable completion menu behavior for clang_complete
set completeopt=menu,longest,preview
let g:clang_user_options='|| exit 0'
let g:clang_periodic_quickfix=1
let g:clang_user_library=1
let g:clang_library_path="/home/rbetts/src/llvm_build/Release+Asserts/lib"

" nmap <silent> <leader>ee <Esc>:call g:ClangUpdateQuickFix()<CR>

" add git branch to status line
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{fugitive#statusline()}

" map Ctrl-Enter to Escape to exit insert-mode
inoremap <C-CR> <Esc>
inoremap jj <Esc>
noremap ; :

" use the bundled matchit.vim
source $VIMRUNTIME/macros/matchit.vim
