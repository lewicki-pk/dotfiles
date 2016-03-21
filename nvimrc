" Plugins
call plug#begin('~/.nvim/plugged')

" On demand loading
Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'dantler/vim-alternate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'szw/vim-tags'
Plug 'tpope/vim-fugitive'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" Plug 'Shougo/neosnippet.vim'
" Check some other guy Plugins
"Plug 'easymotion/vim-easymotion'
" " core plugins
" Plug "gmarik/vundle"
" Plug "flazz/vim-colorschemes"
" Plug "kien/ctrlp.vim"
"
" " vim main plugins
" Plug "sjl/gundo.vim"
" Plug "bling/vim-airline"
" Plug "jlanzarotta/bufexplorer"
" Plug "scrooloose/syntastic.git"
" Plug "vim-scripts/tComment"
" Plug "tpope/vim-surround"
" Plug "mileszs/ack.vim"
" Plug "rking/ag.vim"
" Plug "edsono/vim-matchit"
" Plug "henrik/vim-indexed-search"
" Plug "tpope/vim-abolish"
" Plug "tpope/vim-repeat"
" Plug "jiangmiao/auto-pairs"
" Plug "xolox/vim-session"
" Plug "xolox/vim-misc"
" Plug "editorconfig/editorconfig-vim"
" Plug "godlygeek/tabular"
" Plug "airblade/vim-gitgutter"
" Plug "Lokaltog/vim-easymotion"
" Plug "rhysd/clever-f.vim"
"
" " togglable panels
" Plug "scrooloose/nerdtree"
" Plug "tpope/vim-vinegar"
" Plug "vim-scripts/taglist.vim"
" Plug "majutsushi/tagbar"
"
" " language vundles
" Plug "pangloss/vim-javascript"
" Plug "marijnh/tern_for_vim"
" Plug "othree/javascript-libraries-syntax.vim"
"
" Plug "fatih/vim-go"
" " Plug "klen/python-mode"
" Plug "plasticboy/vim-markdown"
"
" Plug "vim-scripts/c.vim"
"
" " databases
" Plug "vim-scripts/SQLUtilities"
" Plug "NagatoPain/AutoSQLUpperCase.vim"
"
" " autocomplete
" Plug "Valloric/YouCompleteMe"
" Plug "MarcWeber/vim-addon-mw-utils"
" Plug "tomtom/tlib_vim"
"
" " snippets
" Plug "SirVer/ultisnips"
" Plug "honza/vim-snippets"

call plug#end()

" Section: colors
"set t_Co=256


" Section: deoplete
"Use deoplete for completion
let g:deoplete#enable_at_startup = 1

" For problems with autocompletion:
set completeopt-=preview

" deoplete-clang
" " libclang shared library path
" let g:deoplete#sources#clang#libclang_path = '/opt/llvm/lib/libclang.dylib'
" " or
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.6/lib/libclang.so.1'
"
" " clang builtin header path
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
"
" " C or C++ standard version
let g:deoplete#sources#clang#std#c = 'c11'
" " or c++
let g:deoplete#sources#clang#std#cpp = 'c++1z'
"
" " libclang complete result sort algorism
" " Default: '' -> deoplete.nvim delault sort order
" " libclang priority sort order
let g:deoplete#sources#clang#sort_algo = 'priority'
" " alphabetical sort order
" let g:deoplete#sources#clang#sort_algo = 'alphabetical'
"
" " compile_commands.json directory path
" " Not file path. Need build directory path
" let g:deoplete#sources#clang#clang_complete_database =
" '/path/to/neovim/build'
"
" " debug
" let g:deoplete#enable_debug = 1
" let g:deoplete#sources#clang#debug#log_file =
" '~/.log/nvim/python/deoplete-clang.log'

" Section: vim-airline

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" allow buffers to be available in upper bar when only one tab is open
let g:airline#extensions#tabline#enabled = 2
" the separator used on the left side >
" let g:airline_left_sep = '>'
" the separator used on the right side >
" let g:airline_right_sep = '<'
" enable modified detection >
let g:airline_detect_modified=1
" enable paste detection >
let g:airline_detect_paste=1
" enable crypt detection >
let g:airline_detect_crypt=1
" enable iminsert detection >
let g:airline_detect_iminsert=0
" determine whether inactive windows should have the left section collapsed to only the filename of that buffer.
" let g:airline_inactive_collapse=1
" themes are automatically selected based on the matching colorscheme. this can be overridden by defining a value.
let g:airline_theme='bubblegum'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" For airline symbols I'm using font "DejaVu Sans Mono for Powerline Book"
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Section: Neomake
" set makeprg=make
" set errorformat=%f:%l:%m

" Section: Ctrl-P plugin
set wildignore+=*.a,*.o
let g:ctrlp_map = ''
map <leader>p :CtrlP<CR>

" Section: Own commands
set mouse=""

" Section: Own mappings
"nnoremap ' ' <Nop>
let mapleader=","
map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>m :NERDTree %:p:h<CR>
map <leader>a :A<CR>
nmap <leader>t :TagbarToggle<CR>
nnoremap <silent> <Space> :silent noh<CR>
nmap <CR> o<Esc>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Section: Own options
set number
set wildignorecase

"==================================================
" Section: Old
" set syntax enable
set hidden
set number
set ignorecase
set hlsearch
set tabstop=6 shiftwidth=4 softtabstop=4 expandtab

set listchars=tab:»\ ,eol:¶,trail:·,   " show invisible characters as in eclipse IDE

" user defined commands
command! -nargs=1 Filter %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -in "<args>"

" ELFIN commands
command! GetFullFilename !readlink -f %
command! ToggleNumber set number !

set backspace=2

set textwidth=0
set wrapmargin=0
"==================================================
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.

set noerrorbells        " No beeps.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
"
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Relative numbering
function! NumberToggle()
if(&relativenumber == 1)
    set nornu
    set number
else
    set rnu
endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Toggle at startup
set rnu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-j>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-k>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-k>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-k>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-l>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-l>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-l>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-l>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    " Opening in new tab with ctrl+h

    nmap <C-h>s :tab cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-h>g :tab cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-h>c :tab cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-h>t :tab cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-h>e :tab cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-h>f :tab cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-h>i :tab cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-h>d :tab cs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

