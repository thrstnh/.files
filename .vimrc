".vimrc
"
" author:   thrstnh
" created:  14.05.2007
"
"
" changelog:
"   24.04.2012
"     - new plugins:
"       > https://github.com/fholgado/minibufexpl.vim
"       > https://github.com/vim-scripts/pep8
"       > https://github.com/fs111/pydoc.vim
"       > https://github.com/alfredodeza/pytest.vim
"       > https://github.com/tpope/vim-fugitive
"       > https://github.com/nathanaelkane/vim-indent-guides
"       > https://github.com/scrooloose/nerdtree
"       > https://github.com/mitechie/pyflakes-pathogen
"       > https://github.com/msanders/snipmate.vim
"       > https://github.com/tpope/vim-surround
"       > https://github.com/tpope/vim-git
"       > http://www.vim.org/scripts/script.php?script_id=850
"
"
" shortcuts:
"   <F1> help
"   <F2> nerdtree (toggle)
"   <F3> indent-highlight (toggle)
"   <F4> TlistTag (toggle)
"   <F5> PEP8 check
"   <F6>
"   <F7> vnew
"   <F8> highlightWordUnderCursor (toggle)
"   <C-p> code completion
"   <C-x><o> omnicomplete, nice completion
"   <C-space> code completion
"   <S-K> pydoc in buffer


" pathogen: autoload .vim/bundles
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" detect the type of file
filetype on
filetype plugin on
filetype indent on


""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""
set grepprg=grep\ -nH\ $*
" UTF8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" get out of horrible vi-compatible mode
set nocompatible
" history size
set history=1000
" enable error files and error jumping
set cf
" support all three in this order
set ffs=unix,dos,mac
" make sure it can save viminfo
set viminfo+=!
" none of these should be word dividers, so make them not be
set isk+=_,$,@,%,#,-
" syntax highlight
syntax on
" skip suffixes
set suffixes+=.pyc,.class
" see help (complex)
set fo=tcrqn
" autoindent
set ai
" set smartindent
set si
" do c-style indenting
set cindent
" tab spacing
set tabstop=4
" unify
set softtabstop=4
" unify
set shiftwidth=4
" spaces, no tabs
set expandtab
" do not wrap lines
set wrap
" turn on folding
set foldenable
" make folding indent sensitive
set foldmethod=indent
" fold manually
set foldlevel=100
" dont open folds when you search into them
set foldopen-=search
" dont open folds when you undo stuff
set foldopen-=undo
" split windows opens right
set splitright


""""""""""""""""""""""""""
" Files / Backup
""""""""""""""""""""""""""
" make no backup file
"set nobackup
set backup
" where to pub backup file
set backupdir=~/.vim/vimfiles/backup
" temp dir
set directory=~/.vim/vimfiles/temp
" dump files for make
set makeef=error.err


""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""
if has("gui_running")
    " font
    set gfn=Terminus\ 13
    " theme
    set background=dark
    " use colorscheme
    colorscheme thrstnh
    " space it out a little more (easier to read)
    set lsp=0
    " turn on wild menu
    set wildmenu
    " always show current positions along the bottom
    set ruler
    " command bar height is 2
    set cmdheight=1
    " turn on line numbers
    set number
    " no redraw while macros (faster)
    set lz
    " make backspace work normal
    set backspace=2
    " use mouse everywhere
    set mouse=a
    " shortens messages to avoid 'press a key' promt
    set shortmess=atI
    " tell us when anything is changed via :...
    set report=0
    " no bell
    set noerrorbells
    " no toolbar
    set guioptions-=T
    " no menu
    "set guioptions-=m
     show matching brackets
    set showmatch
    " how many tenths of a second to blink matching brackets for
    set mat=5
    " do highlight searched for phrase
    set hlsearch
    " and do highlight as you type you search phrase
    set incsearch
    " n lines tall
    set lines=63
    " n cols wide
    set columns=115
    " keep n lines(bottom/top) for scope
    set so=3
    " dont blink
    set novisualbell
    " no noises
    set noerrorbells
    " status line
    set statusline= "clear it first
    set statusline+=%<%{fugitive#statusline()}
    set statusline+=\ [%F%m%r%h%w]
    set statusline+=\ [FORMAT=%{&ff}] 
    set statusline+=\ [TYPE=%Y] 
    set statusline+=\ [ASCII=\%03.3b] 
    set statusline+=\ [HEX=\%02.2B] 
    set statusline+=\ [POS=%04l,%04v][%p%%] 
    set statusline+=\ [LEN=%L]
    " always show the status line
    set laststatus=2
endif


""""""""""""""""""""""
" TagList
""""""""""""""""""""""
" TagListTagName - Used for tag names
highlight MyTagListTagName  gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Yellow
" TagListTitle - Used for tag titles
highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
" location of ctags tool
"let Tlist_Ctags_Cmd=/usr/bin/ctags
" Displaying tags for only one file~
let Tlist_Show_One_File = 1
" if you are the last, kill yourself
let Tlist_Exist_OnlyWindow = 1
" split to the right side of the screen
let Tlist_Use_Right_Window = 1
" sort by order or name
let Tlist_Sort_Type = "name"
" do not show prototypes and not tags in the taglist window.
let Tlist_Display_Prototype = 0
" Remove extra information and blank lines from the taglist window.
let Tlist_Compart_Format = 1
" Jump to taglist window on open.
let Tlist_GainFocus_On_ToggleOpen = 1
" Show tag scope next to the tag name.
let Tlist_Display_Tag_Scope = 1
" Close the taglist window when a file or tag is selected.
let Tlist_Close_On_Select = 1
" Don't Show the fold indicator column in the taglist window.
let Tlist_Enable_Fold_Column = 0
let Tlist_WinWidth = 50
" generate ctags
"ctags -R -f ~/.vim/tags/language.ctags /usr/lib/language/
" add them
set tags+=$HOME/.vim/ctags/python.ctags


""""""""""""""""""""""
" MiniBufExpl
""""""""""""""""""""""
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1
" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 1
" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplUseSingleClick = 1
" <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
let g:miniBufExplMaxSize = 1
" There is a Vim bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
"let g:miniBufExplForceSyntaxEnable = 1 
" Setting this to 0 will cause the MBE window to be loaded even
"let g:miniBufExplorerMoreThanOne = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guibg=LightGray guifg=DarkGray
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guibg=Red guifg=DarkRed
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Black guifg=Red
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=Black guifg=Red


""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""
"Q. How can I open a NERDTree automatically when vim starts up if no files were specified?__
autocmd vimenter * if !argc() | NERDTree | endif
"Q. How can I close vim if the only window left open is a NERDTree?__
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinSize = 40
inoremap <C-Space> <C-x><C-o>
let NERDTreeIgnore = ['\.pyc$']


""""""""""""""""""""""
" pydiction
""""""""""""""""""""""
"pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20


""""""""""""""""""""""
" SuperTab
""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


"""""""""""""""""""""""""""""""""""""""""""
" OTHER stuff
"""""""""""""""""""""""""""""""""""""""""""
" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" vim indent guide
let g:indent_guides_auto_colors = 1


" highlight the word under the cursor
function HighlightWord()
  if !exists("s:highlightword")
    autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
    let s:highlightword=1
  else
    autocmd! CursorMoved *
    match None
    unlet s:highlightword
  endif
endfunction


" python settings
let g:python_highlight_builtins = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_string_formatting = 1
let g:python_highlight_string_format = 1
let g:python_highlight_string_templates = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_space_errors = 1
let g:python_highlight_doctests = 1
function! s:mpython_settings()
    " PEP8
    setlocal noic
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=80
    setlocal smarttab
    setlocal expandtab
    set omnifunc=pythoncomplete#Complete
endfunction


" settings for filetypes
au FileType python call s:mpython_settings()


" keys
nmap <silent> <F2> :NERDTreeToggle <CR>
nmap <silent> <F3> :IndentGuidesToggle <CR>
nmap <silent> <F4> :TlistToggle <CR>
nmap <silent> <F7> :vnew <CR>
nmap <silent> <F8> :call HighlightWord()<CR>


