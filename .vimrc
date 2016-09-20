""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Setup `runtimepath`
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &rtp = substitute(&rtp, $HOME."/\.vim", $HOME."/\.config/vim", "g")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Execute pathogen
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
if !has('mac')
	" Start insert mode
	let &t_SI = "\<Esc>[6 q"
	" Start replace mode
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
endif

" Enable filetype detection
filetype on

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

" Highlight current line
if has('autocmd')
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
endif

" 80 columns, please.
set textwidth=80
set colorcolumn=+1

" Change window title
set title
" Change title string
set titlestring=%f\ %a%r%m

" Show special chars
set list
set listchars=tab:\|\ ,trail:.,nbsp:.,precedes:$,extends:$

" Set default tab size to 2 spaces.
set tabstop=2 shiftwidth=2

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Keyboard and shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sudo
cmap w!! w !sudo tee % >/dev/null

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Git instead
set nobackup
set nowritebackup

" Use securemodelines instead
set nomodeline

if has('mac')
	set backspace=indent,eol,start
else
	" Unset backspace.
	" Hardcore vim commands only :]
	set backspace&
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" `n` spaces to tabs
" http://vim.wikia.com/wiki/Super_retab
command! -nargs=1 -range Rtab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

set encoding=utf-8
set fileencoding=utf-8

" Enable indention
filetype plugin indent on

if has('autocmd')
	" DO NOT EXPAND TABS TO SPACES!!!
	autocmd filetype * set noexpandtab
endif
