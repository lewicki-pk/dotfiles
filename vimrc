"" Plugins
"call plug#begin('~/.nvim/plugged')
"
"" On demand loading
"Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
"" Plug 'Shougo/deoplete.nvim'
"" Plug 'zchee/deoplete-clang'
"" Plug 'Shougo/neoinclude.vim'
"Plug 'benekastah/neomake'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'majutsushi/tagbar'
"Plug 'dantler/vim-alternate'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'szw/vim-tags'
"call plug#end()

"call pathogen#infect()

set syntax=on
set hidden
set number
set ignorecase
set hlsearch
set tags=./tags;/
set tabstop=6 shiftwidth=4 softtabstop=4 expandtab


" keyboard mappings
set listchars=tab:»\ ,eol:¶,trail:·,   " show invisible characters as in eclipse IDE

nmap <F4> :cs f f %:t:r<CR>
nmap <F5> :! tags_generate<CR> 
nmap <F7> :NERDTreeToggle<CR> 
nmap <F6> :NERDTree %:p:h<CR>
nmap <F8> :TagbarToggle<CR> 
nmap <F9> :!git diff \|less<CR>
nmap <CR> o<Esc>

nnoremap <silent> <Space> :silent noh<Bar>echo<CR>
" user defined commands
command DBGPrint ! cat % <Bar> grep \%\%\% <Bar> less
command! -nargs=1 Filter %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -in "<args>"
command! -nargs=1 FilterInv %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -ci "<args>"

command! -nargs=1 FilterSens %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -n "<args>"
command! -nargs=1 FilterSensInv %y z <Bar> tabnew <Bar> 0put=@z <Bar> %!grep -c "<args>"

" ELFIN commands
command GetFullFilename !readlink -f %
command ToggleNumber set number !
command ToggleCIndent set cindent !
command BuffersToTabs tab sball

set backspace=2

set textwidth=0
set wrapmargin=0

let g:tagbar_width = 55
