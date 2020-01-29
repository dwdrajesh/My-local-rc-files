""""""""""""""""""
""" smartcase for case-insensitive search"
:set ignorecase
:set smartcase
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive
""""""""""""""""""""""""""""""""""
" This is to insert a new line without going to insert mode.
" In some console versions, S-Enter may not work , so use <C-o>
"nmap <S-Enter> O<Esc>j 
"nmap <CR> o<Esc>k
"nmap oo o<Esc>j 
" Disable these things to speed up vim diff
if &diff
    syntax off
    set undolevels=0
endif

" Exit vim git difftool with qq and while committing
if &diff
  map Q :cquit<CR>
endif
if &diff
  map q :qa<CR>
endif
"""""""""""""""""""""""""""""""""
" Exit vim git difftool with qq and while committing
" map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
if &diff
     map <A-Up> [c
     map <A-Down> ]c
     map <A-Right> do 
" do means diffget : put diff from left to right (do = diff obtain)
" dp means diffput : put diff from right to left
endif
""""""""""""""""""""""""""""""""
"set foldmethod=indent
" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen
if &diff
    colorscheme jellybeans"railscasts "evening
endif

" colorscheme wombat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" give location of tags file to vim: 
" this will search from current directory and up, up until $HOME for the file named 'tags'
set tags=./tags,tags;$HOME
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" ctag go to next tag, previous
" main mapping, go to first matching tag
map tt <c-]>
" move forward and back through matching tags
"map <c-b> :tprevious<CR>
"map <c-t> :tnext<CR>
" For openning tag in new horizontal split: Ctrl + W + Ctrl + ] : 
" Ctrl + \ : open tag in new tab (not needed)
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Alt + ] : open in new vertical split
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" To open the current vertical split as horizontal (notice the capital 'H')
noremap <c-w>/  <c-w>t<c-w>H
" vertical to horizontal ( | -> -- )
" noremap <c-w>-  <c-w>t<c-w>K
"  <C-w>r  to swap two windows if they are not in the good orde
" tabclose: 
map ct :tabclose <CR>
" go to next tab: gt or gT
" Open the split in new tab: Ctrl + w + T (capital T)
""""""""""""""""""""""""""""""""""""
" cscope close/open quickfix 
" let mapleader =","
map <C-n> : cn<CR>
map <C-m> : cp<CR>
" nnoremap <leader>q : cclose<CR>
nnoremap ,q : cclose<CR>
nnoremap ,c : copen<CR>
"cscope quickfix window close and open
"nmap <C-q> cclose 
" To open cscope in quickfix window automatically
set cscopequickfix=s-,c-,d-,i-,t-,e-
augroup qf
autocmd!
autocmd QuickFixCmdPost * cwindow
augroup END
""""""""""""""""""""""
" For CtrlP : Fuzzy file finder
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Set root directory as the root directory of the project
noremap <C-a> :CtrlP /repo/`whoami`/radiosw <CR>
"""""
" OmnicppComplete
"call plug#begin('~/.vim')
"Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
"call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""
" --- OmniCppComplete ---
"set tags+=~/.vim/commontags
" The below ~./vim/tags/cpp file was created manually and is needed for auto-completion to work for std:: library
"set tags+=~/.vim/tags/cpp
" -- required --
"set nocp " non vi compatible mode
"filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode or moving away
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave *  if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
" -- configs --
"let OmniCpp_MayCompleteDot   = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem  = 1 " select first item inserted.
"let OmniCpp_NamespaceSearch  = 2 " search namespaces in this and included files
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
"let OmniCpp_LocalSearchDecl  = 1 " don't require special style of function opening braces
"let OmniCpp_DefaultNamespaces= ["std", "_GLIBCXX_STD", "_GLIBCXX_STD_A", "_GLIBCXX_STD_C"]
" -- ctags --  -- proj.vim
" map <ctrl>+F12 to generate ctags for current folder:
"map <C-x><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags;
set tags+=~/bin/cpp_tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentation: 
" use intelligent indentation for C
" the preferred method now is NOT to use smartindent, but instead use the following
"set smartindent
set autoindent
filetype plugin indent on
set tabstop=4        " show existing tab with 4 spaces width
set shiftwidth=4     " indent with '>' also with 4 spaces
set expandtab        " on pressing tab, insert 4 spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=100
" turn syntax highlighting on
set t_Co=256
syntax on

""""""""""""""""""""""""""""""""""""""""
" to let vim know where to look for cscope DB
" cs add $CSCOPE_DB
set csprg=/usr/bin/cscope
"cs add $CSCOPE_DB
"exe "cs add /repo/ezdawra/radiosw/files.cs.txt"
"""""""""""""""""""""""""""""""""""""""""""""
"function! LoadCscope()
"  let db = findfile("files.cs.txt", ".;")
"  if (!empty(db))
"    let path = strpart(db, 0, match(db, "/files.cs.txt$"))
"    set nocscopeverbose " suppress 'duplicate connection' error
"    exe "cs add " . db . " " . path
"    set cscopeverbose
"  " else add the database pointed to by environment variable 
"  elseif $CSCOPE_DB != "" 
"    cs add $CSCOPE_DB
"  endif
"endfunction
"au BufEnter /* call LoadCscope()
""""""""""""""""""""""""""""""""""""""""""""""""""
" To hide the duplicate cscope database warning
set nocscopeverbose 
:set number
"set mouse=a
nmap <C-j>  <C-W>j
nmap <C-k>  <C-W>k
nmap <C-h>  <C-W>h
nmap <C-l>  <C-W>l
"""""""""""""""""""""""""""""""
""""""""""""""""""""""
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
""""""""""""""""""""""
"let Tlist_Auto_Open = 1
    """""""""""""""""""""""""""""""""""""""""
" Newly added on 27 Sept, for recursive grep:
" http://chase-seibert.github.io/blog/2013/09/21/vim-grep-under-cursor.html
" redraw! at last is added to redraw screen from blank screen
command! -nargs=+ Grep execute 'silent grep! -I -r -n --include *.{cc,h} --exclude *.{o,P} --exclude tags . -e <args>' | copen | execute 'silent /<args>' | redraw!
"command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{o,P} --exclude tags . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
nmap ,g :Grep <c-r>=expand("<cword>")<cr><cr>
"nmap <F3> :vimgrep  /\<<C-R>=expand("<cword>")<CR>\>/ %<CR>:cl<CR>
"nmap <Space> <C-F>
