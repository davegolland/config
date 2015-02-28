" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

" dsg additions

" set theme
:source $VIMRUNTIME/colors/desert.vim

" spell checking and highlighting
:setlocal spell spelllang=en_us
:highlight clear SpellBad
:highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
:highlight clear SpellCap
:highlight SpellCap term=underline cterm=underline
:highlight clear SpellRare
:highlight SpellRare term=underline cterm=underline
:highlight clear SpellLocal
:highlight SpellLocal term=underline cterm=underline

" set the tabsize
:set tabstop=2
:set shiftwidth=2

:set expandtab

" set the indentation
":set smartindent

" set line numbers
:set number

" turn off word wrap
:set nowrap

" disable spellcheck by default
:set nospell

" autoindent when editing python files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.tex set smartindent
autocmd BufRead *.tex set spell
autocmd BufRead *.txt set spell



" java specific stuffs
autocmd BufRead *.java setlocal nospell
autocmd BufRead *.java set smartindent

execute pathogen#infect()
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/Cellar/go/1.1.2/libexec/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2 nolist

" define macro to clear search highlights
:map <silent> <F12> <Esc>mP:silent! %s/[\t ]\+$//g<CR><Esc>:mod<CR><Esc>:nohl<CR><Esc>`Pzz
:map <silent> <F11> <Esc>:set nospell!<CR><ESC>
:map <silent> <F10> <Esc>:set nu!<CR><ESC>
:map <silent> <F9> <Esc>mO/signature(.*)<CR>2w<C-a><F12><ESC>`O

" define macro to build latex file and open evince "
" FOR HELP SEARCH: filename-modifiers
"autocmd FileType tex :map <silent> <F5> <Esc>:w<CR><ESC>mP:silent !pdflatex "%" ; evince "%:r.pdf" & <CR> :mod <CR> <F12> <Esc>`P
autocmd FileType tex :map <silent> <F5> <Esc>:w<CR><ESC>mP:silent !pdflatex "%" ; <CR> <ESC>mP:silent !bibtex "%" ; <CR><ESC>mP:silent !pdflatex "%" ; <CR><ESC>mP:silent !pdflatex "%" ; <CR>:mod <CR> <F12> <Esc>`P
autocmd FileType tex :map <silent> <F6> <Esc>:silent !makeTex.pl % ; evince *.pdf & <CR> :mod <CR> <Esc>

" fixes annoying backspace
:set t_kb=
:fixdel
