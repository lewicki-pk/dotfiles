if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/autoload/plug.vim
endif

" Plugins
call plug#begin('~/.nvim/plugged')

" On demand loading
Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang' ", '3fae53f009e5b7b1ae0b21a80c81028b2925640c'
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
Plug 'tpope/vim-surround'
Plug 'edsono/vim-matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'henrik/vim-indexed-search'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-eunuch'
Plug 'vim-ruby/vim-ruby'

" Syntax plugins
Plug 'kergoth/vim-bitbake'
Plug 'aklt/plantuml-syntax'

" Easy but I'm not sure if I'll ever use that

" Tested but somehow not working
" Plug 'sjl/gundo.vim' " not working

" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" Plug 'Shougo/neosnippet.vim'
"
" Check some other guy Plugins
"Plug 'easymotion/vim-easymotion'
" " core plugins
" Plug "flazz/vim-colorschemes"
"
" " vim main plugins
" Plug 'alepez/vim-gtest'
" Plug "scrooloose/syntastic.git"
" Plug "vim-scripts/tComment"
" Plug "rking/ag.vim"
" Plug "tpope/vim-abolish"
" Plug "xolox/vim-session"
" Plug "xolox/vim-misc"
" Plug "editorconfig/editorconfig-vim"
" Plug "Lokaltog/vim-easymotion"
" Plug "rhysd/clever-f.vim"
"
" " togglable panels
" Plug "tpope/vim-vinegar"
" Plug "vim-scripts/taglist.vim"
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
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.6/lib/libclang.so'
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

let g:python_host_prog = '/usr/bin/python3'

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
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wall"]

" Section: Ctrl-P plugin
set wildignore+=*.a,*.o
let g:ctrlp_map = '<C-p>'
let g:ctrlp_show_hidden = 1

" Section: Own commands
set mouse=""

" Section: Own mappings
"nnoremap ' ' <Nop>
let mapleader=","
nnoremap <Leader>p :CtrlP ~/repositories/<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>m :NERDTree %:p:h<CR>
map <leader>a :A<CR>
nmap <leader>bb :TagbarToggle<CR>
nnoremap <silent> <Space> :silent noh<CR>
nmap <CR> o<Esc>
map <leader>ll :set list! <CR>
" move to previously used tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

command! BuffersToTabs tab sball
nnoremap <script> <silent> <unique> <Leader>tt :BuffersToTabs<CR>

command! RunMe terminal ./%:t:r
command! RubyRun terminal ruby %
command! PythonRun terminal python3 %
command! MakeAll !make

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
set nowrap
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
  set scrolloff=2       " Show next 2 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.


"====[ Make the 81st column stand out ]====================
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%121v', 120)
"
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"
highlight OverLength ctermbg=white
match OverLength /\%120v.*/
" Enable / Disable the highlighting with ,he / ,hd
map <leader>hd :highlight clear OverLength <CR>
map <leader>he :highlight OverLength ctermbg=white <CR>
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=white
"  autocmd BufEnter * match OverLength /\%120v.*/
"augroup END

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

" Toggle relative numbering at startup
" set rnu

" disable vim-gutter in vim-diff
augroup diff
   autocmd!
   autocmd FilterWritePre * if &diff | GitGutterDisable | endif
   autocmd BufWinLeave fugitive://* if &diff | GitGutterEnable | endif
augroup END

" saving folds for my work-log file
augroup QuickNotes
    au BufWinLeave *.md mkview
    au BufWinEnter *.md silent loadview
augroup END
"au BufWinLeave *.md mkview
"au BufWinEnter *.md silent loadview
" This one works
"autocmd BufWinLeave *.md execute "mkview! " . expand('<afile>:p:h') . "/." . expand('<afile>:t') . ".view"
" And this one not
"autocmd BufWinEnter *.md execute "loadview! " . expand('<afile>:p:h') . "/." . expand('<afile>:t') . ".view"

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

    " Opening in the same window with ctrl+j
    nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-j>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Opening in new split with ctrl+k
    nmap <C-k>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-k>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-k>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Opening in new vertical split with ctrl+l
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
    "set ttimeoutlen=100           "default is 1000

endif
