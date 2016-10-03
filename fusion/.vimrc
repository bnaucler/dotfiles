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
set number
set relativenumber
set display+=lastline
set nofoldenable

" Mouse
set mouse=nv
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>

" Status bar and tab bar
hi StatusLine ctermbg=white ctermfg=red
hi TabLineFill ctermbg=red ctermfg=white
hi TabLine ctermbg=white ctermfg=black
hi TabLineSel ctermbg=red ctermfg=white
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
set statusline+=\ %P    "percent through file
set statusline+=\ \|	"divider
set statusline+=\ %{strftime(\"%H:%M\")} " Display current time
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

" Kebindings
let mapleader = "\<Space>"
let g:riv_global_leader = "\<C-K>"
nnoremap ; :
inoremap hh <Esc>
vnoremap hh <Esc>
nnoremap H <Home>
nnoremap L <End>
nnoremap zb zb<C-E><C-E><C-E>
nnoremap zt zt<C-Y><C-Y><C-Y>
nnoremap <C-E>  <C-E><C-E><C-E>
nnoremap <C-Y>  <C-Y><C-Y><C-Y>
nnoremap <C-L> :nohl<CR>:set nofoldenable<CR><C-L>
nnoremap <Leader>n :set invrelativenumber<CR>
nnoremap <Leader>p :PresentingStart<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :tabe 
nnoremap <Leader>l :tabn<CR>  
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>m :tabm<CR>
nnoremap <Leader>c :center<CR>

" Vimux
nnoremap <Leader>vv :VimuxPromptCommand("")<CR>
nnoremap <Leader>vm :VimuxPromptCommand("make ")<CR>
nnoremap <Leader>vr :VimuxRunLastCommand<CR>
nnoremap <Leader>vo :VimuxRunCommand("clear && echo Vimux runner")<CR>
nnoremap <Leader>vd :VimuxRunCommand("clear && cd " . expand('%:p:h'))<CR>
nnoremap <Leader>vh :VimuxRunCommand("clear && cd ~")<CR>
nnoremap <Leader>vl :VimuxRunCommand("clear && ls -l " . expand('%:p'))<CR>
nnoremap <Leader>vp :VimuxRunCommand("clear && cd " . expand('%:p:h') .  "/.. &&  pio run -t upload")<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" Automatic bracket closing 
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
