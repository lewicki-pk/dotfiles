if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source ~/.config/nvim/autoload/plug.vim
endif

" Plugins
call plug#begin('~/.nvim/plugged')

" On demand loading
Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang' ", '3fae53f009e5b7b1ae0b21a80c81028b2925640c'
Plug 'Shougo/neoinclude.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'dantler/vim-alternate'
Plug 'henrik/vim-indexed-search'
Plug 'jiangmiao/auto-pairs'
" snippets plugin
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
" snippets templates
Plug 'honza/vim-snippets'
" syntax plugins
Plug 'peterhoeg/vim-qml'
Plug 'kergoth/vim-bitbake'
call plug#end()

" Section: use simpler colors for diff mode
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Section: saving folds for my work-log file
augroup QuickNotes
    autocmd!
    autocmd BufWinLeave *.md execute "mkview! " . expand('<afile>:p:h') . "/." . expand('<afile>:t') . ".view"
    autocmd BufWinEnter *.md execute "silent! source " . expand('%:p:h') . "/." . expand('%:t') . ".view"
augroup END

" Section: Own mappings
let mapleader=","
map <leader>a :A<CR>
nmap <CR> o<Esc>
map <leader>ll :set list! <CR>
nnoremap <silent> <Space> :silent noh<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>m :NERDTree %:p:h<CR>
command! BuffersToTabs tab sball
nnoremap <script> <silent> <unique> <Leader>tt :BuffersToTabs<CR>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
set nowrap

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

" Section: autopairs options
let g:AutoPairsMapCR = 0

" Section: deoplete options
"Use deoplete for completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1


" For problems with autocompletion:
"set completeopt-=preview

" Section: deoplete-clang options
" libclang shared library path
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'

" clang builtin header path
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/3.8.0/include'
let g:python_host_prog = '/home/piotr/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/piotr/.pyenv/versions/neovim3/bin/python'

" Section: vim-airline

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" allow buffers to be available in upper bar when only one tab is open
let g:airline#extensions#tabline#enabled = 2
" enable modified detection >
let g:airline_detect_modified=1
" themes are automatically selected based on the matching colorscheme. this can be overridden by defining a value.
let g:airline_theme='bubblegum'
"
" unicode symbols
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

" Section: git-gutter options
augroup diff
   autocmd!
   autocmd FilterWritePre * if &diff | GitGutterDisable | endif
   autocmd BufWinLeave fugitive://* if &diff | GitGutterEnable | endif
augroup END

" Section: Own commands
command! GetFullFilename !readlink -f %
command! -nargs=1 Filter %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -in "<args>"

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

command! RunMe terminal ./%:t:r
command! RubyRun terminal ruby %
command! Python3Run terminal python3 %
command! Python2Run terminal python %
command! MakeAll !make

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! RangeTmux() range
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  "echo get(lines, 0)
  execute '!tmux.session "'.get(lines,0).'"'
endfunction

command! -range TmuxSession <line1>,<line2>call RangeTmux()
command! -range ClangFormat <line1>,<line2> !clang-format

" Section: Own options
set number
syntax enable
set ignorecase
set hlsearch
set tabstop=6 shiftwidth=4 softtabstop=4 expandtab
set showmatch
set hidden
set mouse=""
set listchars=tab:»\ ,eol:¶,trail:·,   " show invisible characters as in eclipse IDE

" Enable / Disable the highlighting with ,he / ,hd
highlight OverLength ctermbg=white
match OverLength /\%120v.*/

map <leader>hd :highlight clear OverLength <CR>
map <leader>he :highlight OverLength ctermbg=white <CR>

""""""""""""""""""""" CSCOPE """""""""""""""""""""

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















""""""""""""""DISABLED PART"


"set wildignorecase
"
""==================================================
"" Section: Old
"" set syntax enable
"set viewoptions=folds
"set foldmethod=manual
"
"
"
"" ELFIN commands
"command! ToggleNumber set number !
"
"set backspace=2
"
"set textwidth=0
"set wrapmargin=0
"set nowrap
""==================================================
"set showcmd             " Show (partial) command in status line.
"set showmode            " Show current mode.
"set ruler               " Show the line and column numbers of the cursor.
"set number              " Show the line numbers on the left side.
"set formatoptions+=o    " Continue comment marker in new lines.
"
"set noerrorbells        " No beeps.
"set linespace=0         " Set line-spacing to minimum.
"set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
"
"" More natural splits
"set splitbelow          " Horizontal split below current.
"set splitright          " Vertical split to right of current.
""
"if !&scrolloff
"  set scrolloff=2       " Show next 2 lines while scrolling.
"endif
"if !&sidescrolloff
"  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
"endif
"set display+=lastline
"set nostartofline       " Do not jump to first character with page commands.
"
"
""====[ Make the 81st column stand out ]====================
""highlight ColorColumn ctermbg=magenta
""call matchadd('ColorColumn', '\%121v', 120)
""
""highlight OverLength ctermbg=red ctermfg=white guibg=#592929
""match OverLength /\%81v.\+/
""
"highlight OverLength ctermbg=white
"match OverLength /\%120v.*/
""augroup vimrc_autocmds
""  autocmd BufEnter * highlight OverLength ctermbg=white
""  autocmd BufEnter * match OverLength /\%120v.*/
""augroup END
"
"" Relative numbering
"function! NumberToggle()
"if(&relativenumber == 1)
"    set nornu
"    set number
"else
"    set rnu
"endif
"endfunc
"







"Plug 'benekastah/neomake'
"Plug 'majutsushi/tagbar'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'szw/vim-tags'
"Plug 'edsono/vim-matchit'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-speeddating'
"Plug 'jlanzarotta/bufexplorer'
"Plug 'godlygeek/tabular'
"Plug 'tpope/vim-eunuch'
"Plug 'vim-ruby/vim-ruby'
""Plug 'davidhalter/jedi-vim' "requires 'pip install jedi'
"
"" Syntax plugins
"Plug 'aklt/plantuml-syntax'
"
"" Easy but I'm not sure if I'll ever use that
"
"" Tested but somehow not working
"" Plug 'sjl/gundo.vim' " not working
"
"" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"
"" Plug 'Shougo/neosnippet.vim'
""
"" Check some other guy Plugins
""Plug 'easymotion/vim-easymotion'
"" " core plugins
"" Plug 'flazz/vim-colorschemes'
""
"" " vim main plugins
"" Plug 'alepez/vim-gtest'
"" Plug "scrooloose/syntastic.git"
"" Plug "vim-scripts/tComment"
"" Plug "rking/ag.vim"
"" Plug "tpope/vim-abolish"
"" Plug "xolox/vim-session"
"" Plug "xolox/vim-misc"
"" Plug "editorconfig/editorconfig-vim"
"" Plug "Lokaltog/vim-easymotion"
"" Plug "rhysd/clever-f.vim"
""
"" " togglable panels
"" Plug "tpope/vim-vinegar"
"" Plug "vim-scripts/taglist.vim"
""
"" " language vundles
"" Plug "pangloss/vim-javascript"
"" Plug "marijnh/tern_for_vim"
"" Plug "othree/javascript-libraries-syntax.vim"
""
"" Plug "fatih/vim-go"
"" " Plug "klen/python-mode"
"" Plug "plasticboy/vim-markdown"
""
"" Plug "vim-scripts/c.vim"
""
"" " databases
"" Plug "vim-scripts/SQLUtilities"
"" Plug "NagatoPain/AutoSQLUpperCase.vim"
""
"" " autocomplete
"" Plug "Valloric/YouCompleteMe"
"" Plug "MarcWeber/vim-addon-mw-utils"
"" Plug "tomtom/tlib_vim"
"
"call plug#end()
"
"" Section: colors
""set t_Co=256
"
"
"" Section: jedi-vim
"
"let g:jedi#force_py_version=3
"
"" Section: Neomake
"" set makeprg=make
"" set errorformat=%f:%l:%m
"let g:neomake_cpp_clang_args = ["-std=c++14", "-Wall"]
"
"" Section: Ctrl-P plugin
"set wildignore+=*.a,*.o
"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_show_hidden = 1
"
"
"" Section: Own mappings
"nnoremap <Leader>p :CtrlP ~/repositories/<CR>
"nmap <leader>bb :TagbarToggle<CR>
"
"
"command! RunMe terminal ./%:t:r
"command! RubyRun terminal ruby %
"command! PythonRun terminal python3 %
"command! MakeAll !make
"
"
"" Toggle between normal and relative numbering.
"nnoremap <leader>r :call NumberToggle()<cr>
"
"" Toggle relative numbering at startup
"" set rnu
"
"
"
