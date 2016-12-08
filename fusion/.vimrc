" bnaucler's vim configuration

" Script sources
execute pathogen#infect()
call pathogen#helptags()

" Undo and swap buffers
set updatecount=50
set undolevels=1000

" Display
set ruler
set laststatus=2
set linebreak
set relativenumber
set number
set display+=lastline
set nofoldenable
set cursorline

" Movement
set scrolloff=3
set mouse=nv
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>

" Normal backspace
set backspace=eol,start

" System clipboard integration
set clipboard=unnamed

" Status bar and tab bar
hi StatusLine ctermbg=white ctermfg=blue
hi TabLineFill ctermbg=blue ctermfg=white
hi TabLine ctermbg=white ctermfg=black
hi TabLineSel ctermbg=blue ctermfg=white
set statusline=%F							" Filename tail
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]						" File format
set statusline+=%h							" Help file flag
set statusline+=%m							" Modified flag
set statusline+=%r							" Read only flag
set statusline+=%y							" Filetype
set statusline+=%{fugitive#statusline()}	" Git flag
set statusline+=%=							" Left/right separator
set statusline+=%c,							" Cursor column
set statusline+=%l/%L						" Cursor line/total lines
set statusline+=\ \|\ 						" Divider
set statusline+=%{strftime(\"%H:%M\")}		" Display current time
set statusline+=\ 						" Blankspace at the end

" Formatting & indention
filetype plugin indent on
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
au BufRead,BufNewFile *.css filetype indent off

" We live in the 21st century after all
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1
set termencoding=utf-8

" Syntax highlighing
syntax on
au BufRead,BufNewFile *.ino set filetype=arduino
au BufRead,BufNewFile *.pde set filetype=arduino
hi Comment ctermfg=magenta

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Wildmenu
set wildmenu
set wildmode=list:longest

" When writing email
autocmd BufRead $TMPDIR/* execute "normal /^$/\n"
autocmd BufRead $TMPDIR/* execute ":startinsert"

" Commentary
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType arduino setlocal commentstring=//\ %s

" Nerdtree
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeQuitOnOpen=1

" Marked
let g:marked_app = 'Markoff'

" Better Whitespace
highlight ExtraWhitespace ctermbg=red
let g:better_whitespace_filetypes_blacklist=['go', 'diff', 'gitcommit', 'unite', 'qf', 'help']

" Kebindings
let mapleader = "\<Space>"
inoremap <C-U> <Esc>^d$i
inoremap hh <Esc>
vnoremap hh <Esc>
nnoremap ; :
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap Q <NOP>
nnoremap <Tab> :set cursorcolumn!<CR>
nnoremap <CR> o<Esc>k
nnoremap <C-E>  <C-E><C-E><C-E>
nnoremap <C-Y>  <C-Y><C-Y><C-Y>
nnoremap <C-L> :nohl<CR>:set nofoldenable<CR><C-L>
nnoremap <Leader>n :set relativenumber!<CR>:set number!<CR>
nnoremap <Leader>s :PresentingStart<CR>
nnoremap <Leader>e "zyiwdiw:r! ~/bin/khrawemail <C-R>z<CR>kJ
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tc :NERDTree-cd<CR>
nnoremap <Leader>j :split<CR>
nnoremap <Leader>k :only<CR>
nnoremap <Leader>f :tabe 
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader><Leader>h :tabm 0<CR>
nnoremap <Leader><Leader>j :tabm -1<CR>
nnoremap <Leader><Leader>k :tabm +1<CR>
nnoremap <Leader><Leader>l :tabm<CR>
nnoremap <Leader>c :center<CR>
nnoremap <Leader>q gqap
nnoremap <Leader>; mo$a;<Esc>`o
nnoremap <Leader>wd :silent r ! w3m -dump 
nnoremap <Leader>wt :ToggleWhitespace<CR>
nnoremap <Leader>ws :StripWhitespace<CR>
nnoremap <Leader>ss :silent ! surfraw -browser=open stack 
nnoremap <Leader>sg :silent ! surfraw -browser=open google 
nnoremap <Leader>sds :silent r ! surfraw -browser=dw3m.sh stack 
nnoremap <Leader>sdg :silent r ! surfraw -browser=dw3m.sh google 
nnoremap <Leader>xp :w<CR>:silent ! pandoc %:p -s -o %:p:r.pdf &<CR>
nnoremap <Leader>xh :w<CR>:silent ! pandoc %:p -s -o %:p:r.html &<CR>
nnoremap <Leader>xm :MarkedOpen<CR>

" Vimux
let VimuxUseNearest = 0
let g:VimuxPromptString = "cmd: "
let g:VimuxOrientation = "v"
nnoremap <Leader>vv :VimuxPromptCommand("")<CR>
nnoremap <Leader>vm :w<CR>:VimuxPromptCommand("make ")<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vo :VimuxRunCommand("clear && echo Vimux runner")<CR>
nnoremap <Leader>vd :VimuxRunCommand("clear && cd " . expand('%:p:h'))<CR>
nnoremap <Leader>vh :VimuxRunCommand("clear && cd ~")<CR>
nnoremap <Leader>vl :VimuxRunCommand("clear && ls -l " . expand('%:p'))<CR>
nnoremap <Leader>vp :w<CR>:VimuxRunCommand("clear && cd " . expand('%:p:h') .  "/.. &&  pio run -t upload")<CR>
nnoremap <Leader>vg :w<CR>:VimuxRunCommand("clear && cd " . expand('%:p:h') .  " &&  go run " . expand('%:t'))<CR>
nnoremap <Leader>vc :VimuxRunCommand("clear && cloc " . expand('%:p:h'))<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Automatic bracket closing
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

" Initialize options at startup
autocmd VimEnter * ToggleWhitespace
