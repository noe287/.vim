
" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
"
" Plugin 'nerdcommenter'
" Plugin 'vim-nerdtree-tabs'
" Plugin 'tpope/vim-fugitive'
" Plugin 'auto-pairs'
" Plugin 'ctags.vim'
" Plugin 'gdbmgr'
" Plugin 'minibufexpl'
" Plugin 'nerdtree'
" Plugin 'snipmate'
" Plugin 'supertab'
" Plugin 'syntastic'
" Plugin 'taglist'
" Plugin 'taglist.vim'
" Plugin 'vim-airline'
" Plugin 'vim-autoclose'
" Plugin 'vim-gitgutter'
" Plugin 'vim-mltiple-cursors'
" Plugin 'vim-scriptease'
" Plugin 'vim-sensible'
" Plugin 'vim-rvm'
" Plugin 'cscope'
" Plugin 'vim-togglemouse'
" Plugin 'ack.vim'
" Plugin 'ag.vim'
" Plugin 'cscope_dynamic'
" " Plugin 'YouCompleteMe'
" Plugin 'vim-colorschemes'
" Plugin 'ripgrep'
" Plugin 'fzf'
" Plugin 'fzf.vim'
" Plugin 'lightline.vim'
" Plugin 'clang_complete'
" Plugin 'vim-orgmode'
"
" "All of your Plugins must be added before the following line
" call vundle#end()            " required
execute pathogen#infect()
syntax on
" To ignore plugin indent changes, instead use:
filetype plugin indent on
filetype plugin on
set nocompatible              " be iMproved, required
filetype off                  " required
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"fzf runtime path
set rtp+=~/.fzf





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""CSCOPE SETTINGS """"""""""""""""""""""""""""""""""""""""
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
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-

    " add any cscope database in current directory
    if filereadable("./cscope/cscope.out")
        cs add ./cscope/cscope.out
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
    " h map-which-keys
    " h map-alt-keys
    nmap <C-F1> :cs find g <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F2> :cs find s <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F3> :cs find c <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F4> :cs find d <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F5> :cs find t <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F6> :cs find e <C-R>=expand("<cword>")<CR><CR>:QFix2<CR>
    nmap <C-F7> :cs find f <C-R>=expand("<cfile>")<CR><CR>:QFix2<CR>
    nmap <C-F8> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:QFix2<CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


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
    set timeoutlen=4000
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

"cscope related
"set cscopetag
"set cst
"set csprg=/usr/bin/cscope
"set cscopequickfix
"set cscoperelative
"set csre
"set csverb
"set cspc=5


endif











""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""ALL THE SETTINGS """"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
"Custom Editor Environment from yavide
set sessionoptions=blank,buffers,folds,help,resize,tabpages,winpos,winsize  " Set session persistence options
set enc=utf-8                                                               " Set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set nocompatible                                                            " Disable vi compatibility (emulation of old bugs)
set autoindent                                                              " Use indentation of previous line
set smartindent                                                             " Use intelligent indentation for C
set tabstop=8                                                               " Tab width is 4 spaces
set shiftwidth=8                                                            " Indent also with 4 spaces
" set expandtab                                                               " Expand tabs to spaces
set nowrap                                                                  " Do not wrap lines
set noequalalways                                                           " Do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set textwidth=150                                                           " Wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
let mapleader = ","                                                         " Define ',' is leader key
syntax on                                                                   " Turn syntax highlighting on
"set ignorecase
"set smartcase
set incsearch
set hlsearch                                                                " Highlight all search results
set number                                                                  " Turn line numbers on
set showmatch                                                               " Highlight matching braces
set comments=sl:/*,mb:\ *,elx:\ */                                          " Intelligent comments
set wildmode=longest:full                                                   " Use intelligent file completion like in the bash
set wildmenu
set hidden                                                                  " Allow changing buffers without saving them
set cul                                                                     " Highlight the current line
set backspace=2                                                             " Backspace tweaks
set backspace=indent,eol,start
set smarttab
set undofile
set autoread
" /yavide custom editor environment

"My settings
set shell=$SHELL
set showmatch
set dictionary=/usr/share/dict/words
"set colorcolumn=150
highlight ColorColumn ctermbg=darkgray
set wildignore=*.o,*.obj,*~,*.out,*.ko,tags,*.txt,*.in,package*,cscope.*,*.swp,*.bak,*.pyc,*.class,*.diff,*.patch,*.a







"Scripts for color
colorscheme mustang
"colorscheme codeburn
" colorscheme erez
"colorscheme stonewashed-gui
"colorscheme zenburn

"For mouse activation/deactivation
set mouse=a
set pastetoggle=<F2>







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""MAPPINGS"""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" My mappings
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >
vnoremap <S-Tab> <


" copy paste to out
map <leader>y "+y
map <leader>p "+p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <F11> :!cscope -b<CR>:cs reset<CR><CR>
"  nmap <C-F12> <Plug>CscopeDBInit <bar> :!rm cscope.out <CR>
"nmap <C-F11> <Plug>CscopeDBInit <bar><CR>

nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easily GREP current word in current file.
"quickfix window gets the focus with cw but not with cc.
"map <F4>  :execute "silent grep -srnw --binary-files=without-match --exclude-dir=.git --exclude=*.o --exclude=*~ --exclude=*cscope.* --exclude=tags . -e " . expand("<cword>") . " "  <bar> botright cw <CR>
"map <F5> :execute "vimgrep /" . expand("<cword>") . "/ **" <Bar>botright cw <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4>  :execute "silent grep -srnw --binary-files=without-match --exclude-dir=.git --exclude=*.o --exclude=*~ --exclude=*cscope.* --exclude=tags . -e " . expand("<cword>") . " "  <bar> botright cwindow <CR>
map <F5> :execute "vimgrep /" . expand("<cword>") . "/ **" <Bar>botright cwindow <CR>

"Resizing windows
nnoremap <silent> <Leader>0 :exe "vertical resize +150"<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize -150"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>* :exe "vertical resize -5"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <Leader>6 :exe "resize -5"<CR>
nnoremap <silent> <Leader>7 :exe "resize +5"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set number toggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <Leader>. :exe "set number! "<CR>
"Toggle quickfix
nmap <silent> <leader>. :NumTog<CR>
command -bang -nargs=? NumTog call NumToggle()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tabs/spaces visible
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shows empty spaces and tabs in the file
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=trail:.,extends:#,nbsp:.



" set list
set listchars=tab:>-,trail:.,space:.
nnoremap <silent> <Leader>ç :TabVis<CR>
command -bang -nargs=? TabVis call TabVisible()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Delete/hide bad-whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <C-h> :ShowBadWhitespace <CR>
" map <C-j> :HideBadWhitespace <CR>
" map <C-m> :ToggleBadWhitespace <CR>
" map <C-m> :EraseBadWhitespace <CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"minibufferexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-f> :MBEbn <CR>
map <C-a> :MBEbp <CR>
map <C-d> :MBEbd <CR>
map <C-c> :MBEToggle <CR>

"or Tabbar
" map <C-f> :Tbbn <CR>
" map <C-a> :Tbbp <CR>
" map <C-d> :Tbbd <CR>
" map <C-c> :TbToggle <CR>

"Powerline
:let g:Powerline_symbols = 'fancy'
"vim-tabber
set tabline=%!tabber#TabLine()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tagbar toggle and Taglist Toggles
nnoremap <silent> <leader>ğ :TagbarToggle<CR>
nnoremap <silent> <leader>ü :TlistToggle<CR>
:let g:Tlist_WinWidth=20
:let g:tagbar_width = 20
"https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle <CR>
:let g:NERDTreeWinSize=20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TComment
map <C-t> :TComment<CR>
map <c-p> m`vip:TComment<cr>``

"Toggle quickfix
nmap <silent> <leader>l :QFix<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tired of clearing highlighted searches by searching for “ldsfhjkhgakjks”? Use this:
nmap <silent> <leader>" :nohlsearch<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Finally, a trick by Steve Losh for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts). This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings for choosing the window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"works only with vim-gtk version. so turned it off
" map <C-Up>   : LargerFont <CR>
" map <C-Down> : SmallerFont <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :botright cw
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :botright cwindow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command -bang -nargs=? QFix call QFixToggle(<bang>0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command -bang -nargs=? QFix2 call QFixToggle2(<bang>0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 F :call F("<args>")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=1 Find :call Find("find . -iname '*'" . shellescape('<args>') . "'*'")
" command! -nargs=1 Gfind call Find('git ls-files | grep -E ' . shellescape('<args>'))
" command! -nargs=1 Gtfind call Find('git rev-parse --show-toplevel && git ls-files | grep -E ' . shellescape('<args>'))
" command! -nargs=1 Locate call Find('locate ' . shellescape('<args>'))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* -complete=file Rg Grepper -tool rg -query <args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" FUNCTIONS """"""""""""""""""""""""""""""""""""""""""
" remap <Plug>TComment_<c-_>p m`vip:TComment<cr>```
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Quickfix related segment
"QuickFix window height
au FileType qf call AdjustWindowHeight(3, 20)

function! AdjustWindowHeight(minheight, maxheight)
      let l = 1
      let n_lines = 0
      let w_width = winwidth(0)
      while l <= line('$')
          " number to float for division
          let l_len = strlen(getline(l)) + 0.0
          let line_width = l_len/w_width
          let n_lines += float2nr(ceil(line_width))
          let l += 1
      endw
      exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"1 - QFix funct toogle
"let g:jah_Quickfix_Win_Height = 10
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    :copen 10 | :botright cwindow
    " copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

"2 - QFix funct to cscope
"let g:jah_Quickfix_Win_Height = 10
function! QFixToggle2(forced)
"  if exists("g:qfix_win") && a:forced == 0
"    cclose
"    unlet g:qfix_win
"  else
    :copen 10 | :botright cwindow
    " copen 10
    let g:qfix_win = bufnr("$")
"  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find file in current directory and edit it.
function! F(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
" replace above line with below one for gvim on windows
" let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Find(cmd)
  let l:files = system(a:cmd)
  if (l:files =~ '^\s*$')
    echomsg 'No matching files.'
    return
  endif
  tabedit
  set filetype=filelist
      set buftype=nofile
  " TODO cannot open two such file lists with this. How to get a nice tab label then?
  " http://superuser.com/questions/715928/vim-change-label-for-specific-tab
  "file [filelist]
  put =l:files
  normal ggdd
  nnoremap <buffer> <Enter> <C-W>gf
  execute 'autocmd BufEnter <buffer> lcd ' . getcwd()
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"If taken off an underline will be added as well as highlighting.
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=darkgray ctermfg=white
endfunction
autocmd VimEnter * call s:SetCursorLine()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Font size adjustment functions
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
" set autoread
au CursorHold * checktime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NumToggle()
    exe "set number!"
endfunction

" Toggle Tabs and space visibility
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TabVisible()
    exe "set list!"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""" PLUGIN settings"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"TagList open
let Tlist_Use_Right_Window   = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NeerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AG
let g:ackprg = "/usr/bin/ag --vimgrep"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"clang_complete
syntax on
set number
filetype plugin on
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" let g:rg_command = '
"   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"   \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"   \ -g "!{.git,node_modules,vendor,release,qcm_plc_firmware,tools,zlib,openssl,profiles,openssl,open-plc-utils,libxml2,libstrophe,json,expat,airwpa,air_led,configs}/*" '
"
" command! -bang -nargs=* Z call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"FZF
" command! -bang -nargs=? -complete=dir Files
" \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
