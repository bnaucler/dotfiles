" bnaucler's vim configuration

" Script sources
execute pathogen#infect()

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
set statusline=%F       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ \|\ 	"divider
set statusline+=%{strftime(\"%H:%M\")} " Display current time
set statusline+=\ 		" Blankspace at the end

" Formatting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Syntax highlighing
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.ino set filetype=arduino
au BufRead,BufNewFile *.pde set filetype=arduino
hi Comment ctermfg=magenta

" Search
set hlsearch
set ignorecase
set smartcase

" Commentary
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType arduino setlocal commentstring=//\ %s

" Nerdtree
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeQuitOnOpen=1

" Better Whitespace
highlight ExtraWhitespace ctermbg=red

" Kebindings
let mapleader = "\<Space>"
nnoremap ; :
inoremap hh <Esc>
vnoremap hh <Esc>
nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk
nnoremap Q <NOP>
nnoremap <CR> o<Esc>k
nnoremap <C-E>  <C-E><C-E><C-E>
nnoremap <C-Y>  <C-Y><C-Y><C-Y>
nnoremap <C-L> :nohl<CR>:set nofoldenable<CR><C-L>
inoremap <C-U> <Esc>^d$i
nnoremap <Leader>n :set relativenumber!<CR>:set number!<CR>
nnoremap <Leader>s :PresentingStart<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>
nnoremap <Leader>tc :NERDTree-cd<CR>
nnoremap <Leader>f :tabe 
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader><Leader>h :tabm 0<CR>
nnoremap <Leader><Leader>j :tabm -1<CR>
nnoremap <Leader><Leader>k :tabm +1<CR>
nnoremap <Leader><Leader>l :tabm<CR>
nnoremap <Leader>c :center<CR>
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

" Vimux
nnoremap <Leader>vv :VimuxPromptCommand("")<CR>
nnoremap <Leader>vm :VimuxPromptCommand("make ")<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vo :VimuxRunCommand("clear && echo Vimux runner")<CR>
nnoremap <Leader>vd :VimuxRunCommand("clear && cd " . expand('%:p:h'))<CR>
nnoremap <Leader>vh :VimuxRunCommand("clear && cd ~")<CR>
nnoremap <Leader>vl :VimuxRunCommand("clear && ls -l " . expand('%:p'))<CR>
nnoremap <Leader>vp :VimuxRunCommand("clear && cd " . expand('%:p:h') .  "/.. &&  pio run -t upload")<CR>
nnoremap <Leader>vc :VimuxRunCommand("clear && cloc " . expand('%:p:h'))<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Automatic bracket closing
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i

" Initialize options at startup
autocmd VimEnter * ToggleWhitespace
