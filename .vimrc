""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
filetype on

" Set theme
if has("gui_running")
	colorscheme wwdc16
else
	colorscheme solarized
endif

" Set default tab size to 4 spaces.
set tabstop=4 shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Keyboard and shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable/disable line numbers.
nmap <Leader>l :set invnumber<CR>

" Move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Move between tabs
nmap <S-Tab> :tabn<CR>
nmap <A-Tab> :tabp<CR>

" Relocate current tab
nmap <S-A-h> :tabm -1<CR>
nmap <S-A-j> :tabm +1<CR>
nmap <S-A-k> :tabm -1<CR>
nmap <S-A-l> :tabm +1<CR>

" Toggle NERDTree
nmap <Leader>n :NERDTreeTabsToggle<CR>

" Toggle Gudno (undo manager)
nmap <Leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix NERDTree arrows encoding in GUI mode.
if has("gui_running")
	set encoding=utf-8
endif

" Enable indention
filetype plugin indent on

" DO NOT EXPAND TABS TO SPACES!!!
autocmd FileType * set noexpandtab

