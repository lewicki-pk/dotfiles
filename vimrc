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

let g:tagbar_width = 55

function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()
