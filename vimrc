if &term =~ "xterm"
        if has("terminfo")
                set t_Co=8
                set t_Sf=1%dm
                set t_Sb=1%dm
        else
                set t_Co=8
                set t_Sf=m
                set t_Sb=m
        endif
endif

"set shell=which bash


set autowrite
set textwidth=0
set cinoptions=>4
set showcmd
set nostartofline
set magic
set joinspaces
set noignorecase
set t_kb
"set guifont=-adobe-courier-medium-r-normal-*-*-110-*-*-m-*-iso8859-1
set guifont=Courier_New:h8:cANSI
set title titlestring=%<%F%=%l/%L-%P titlelen=70
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set enc=utf-8
set dictionary=$HOME/.vimdic
set ttyfast
set showmode
set history=50                                  " Keep 50 commands and 50 search patterns in the history

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Comment ctermfg=DarkGrey guifg=DarkGrey
set background=dark     " we are using a dark background
syntax on                       " syntax highlighting on
colorscheme desert " my theme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                       " Always show current positions along the bottom
set nonumber            " turn off line numbers
set backspace=2         " make backspace work normal
"set mouse=a                    " use mouse everywhere
set shortmess=atI       " shortens messages to avoid 'press a key' prompt
set report=0            " tell us when anything is changed via :...
set selectmode+=mouse



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch           " show matching brackets
set mat=5                       " how many tenths of a second to blink matching brackets for
set nohlsearch          " highlight searched for phrases
set incsearch           " BUT do highlight as you type you search phrase
set visualbell          " blink
set noerrorbells        " no noises
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2        " always show the status line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noautoindent
set nosmartindent
set nocindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nowrap
set noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let perl_extended_vars=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set guioptions=agimrbtT
auto BufEnter * let &titlestring = "VIM@" . hostname() . " " . expand("%:p")
syntax on
fixdel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab YDATE <c-r>=strftime("%a-%b-%d %T:%Z:%Y")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
au BufNewFile,BufRead *.epl :set ft=html " all my .elp files ARE html
au BufNewFile,BufRead *.scr :set ft=c "    all my .scr files ARE c
au BufNewFile,BufRead *.inc :set ft=c "    all my .inc files ARE c
au BufNewFile,BufRead *.pc  :set ft=esqlc "    all my .pc files ARE esql c
au BufNewFile,BufRead *.pc.svn-base  :set ft=esqlc "    all my .pc files ARE esql c

"au FileType c call CStuff()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,L  1G/Last update:\s*/e+1<CR>CYDATE<ESC>
map _b  GoZ<Esc>:g/^[ <Tab>]*$/,/[^ <Tab>]/-j<CR>Gdd
map ,, maa0<ESC>mbbma$a x<ESC>`awgebi(<ESC>ea)<ESC>$xx`blx`a
map ,' maa0<ESC>mbbma$a x<ESC>`awgebi'<ESC>ea'<ESC>$xx`blx`a
map ," maa0<ESC>mbbma$a x<ESC>`awgebi"<ESC>ea"<ESC>$xx`blx`a

nmap <F5> :se list!<CR>         " Toggle list mode
nmap <F6> :se wrap!<CR>         " Toggle wrap mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CStuff
function CStuff()

    "syn region myFold start="\s*\<procedure\>" end="^}"he=e-1  keepend transparent fold
    syn region myFold start="^{" end="^}"he=e-1  keepend transparent fold

    set foldmethod=syntax
    set foldclose=all
    "set foldopen=all
    set foldnestmax=1

endfunction

