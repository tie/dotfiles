""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Execute pathogen
execute pathogen#infect()

" Disable shared data
set shada="NONE"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
set guicursor=a:blinkon0
set guicursor+=n-v-c-ci:block
set guicursor+=i:ver25
set guicursor+=r-cr:hor20
set guicursor+=o:blinkwait300-blinkon200-blinkoff150

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Set color scheme
colorscheme solarized

" Set background
if has("gui_running")
	set background=light
else
	set background=dark
endif

" Highlight search results
set hlsearch

" Highlight comments with italic font
highlight Comment cterm=italic gui=italic

" Highlight current line
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" 80 columns, please.
set textwidth=80
set colorcolumn=+1

" Change window title
set title
" Change title string
set titlestring=%f\ %a%r%m

" Show the cursor line and column number
set ruler

" Show special chars
set list
" Set special chars appearance
set listchars=tab:\|\ ,trail:.,nbsp:.,precedes:$,extends:$

" Disable highlight of special keys (tab, nbsp, trail)
highlight SpecialKey None

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Keyboard and shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sudo
cmap w!! w !sudo tee % >/dev/null

" Inc search (incsearch.vim)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Clear search highlight
nmap <silent> ,/ :nohlsearch<CR>

" Enable/disable line numbers.
nnoremap <Leader>l :set invnumber<CR>
" Enable/disable relative line numbers.
nnoremap <Leader>. :set invrelativenumber<CR>
" Toggle NERDTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
" Toggle Gudno (undo manager)
nnoremap <Leader>u :GundoToggle<CR>

"""""""""""""""""""""""""""""""
" Tabs and windows navigation "
"""""""""""""""""""""""""""""""
" Create and close tabs
nnoremap <A-t> :tabnew<CR>
nnoremap <A-w> :tabclose<CR>

" Relocate current tab
nnoremap <S-A-h> :tabm -1<CR>
nnoremap <S-A-j> :tabm +1<CR>
nnoremap <S-A-k> :tabm -1<CR>
nnoremap <S-A-l> :tabm +1<CR>

" Move between tabs
nnoremap <S-Tab>   gt
nnoremap <C-S-Tab> gT

nnoremap <A-Left>  :tabprev<CR>
nnoremap <A-Right> :tabnext<CR>

" Move between windows
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

nnoremap <C-Left>   <C-W>h
nnoremap <C-Down>   <C-W>j
nnoremap <C-Up>     <C-W>k
nnoremap <C-Right>  <C-W>l

" Paste toggle
set pastetoggle=<F2>

" Convert `n` spaces to tabs
" http://vim.wikia.com/wiki/Super_retab
command! -nargs=1 -range Rtab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Git instead
set nobackup
set noswapfile
set nowritebackup

" Use securemodelines/editorconfig instead
set nomodeline

" Unset backspace.
set backspace=

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let b:syntastic_c_cflags = $CFLAGS

" Enable filetype detection
filetype on
