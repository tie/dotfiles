" VIM
set nocompatible

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
" ==> Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ClearRegistersInRange(start, end)
	let i = a:start
	while (i <= a:end)
		exec 'let @' . nr2char(i) . '=""'
		let i += 1
	endwhile
	unlet i
endfunction

function ClearRegisters()
	call ClearRegistersInRange(char2nr("A"), char2nr("Z"))
	call ClearRegistersInRange(char2nr("a"), char2nr("z"))
	call ClearRegistersInRange(char2nr("0"), char2nr("9"))

	let str = '/-="'
	for char in split(str, '\zs')
		exec 'let @' . char . '=""' 
	endfor
	unlet str
endfunction

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Git instead
set nobackup
set noswapfile
set nowritebackup

" Use securemodelines/editorconfig instead
set nomodeline

if has('mac')
	set backspace=indent,eol,start
else
	" Unset backspace.
	" Hardcore vim commands only :]
	set backspace&
endif

" Perfomance imporvements
set ttyfast

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Convert `n` spaces to tabs
" http://vim.wikia.com/wiki/Super_retab
command! -nargs=1 -range Rtab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Force UTF8
set encoding=utf-8
set fileencoding=utf-8

" Enable indention
filetype plugin indent on

" Force 8 spaces indent width and size
autocmd filetype * set tabstop=8 shiftwidth=8 softtabstop=8

" DO NOT EXPAND TABS TO SPACES!!!
autocmd filetype * set noexpandtab
