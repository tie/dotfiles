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
nnoremap <Leader>l :set invnumber<CR>
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

nnoremap <A-Up>    :tabnext<CR>
nnoremap <A-Down>  :tabprev<CR>
nnoremap <A-Left>  :tabprev<CR>
nnoremap <A-Right> :tabnext<CR>

" Move between windows
nnoremap <C-Down>   <C-W>h
nnoremap <C-Left>   <C-W>j
nnoremap <C-Up>     <C-W>k
nnoremap <C-Right>  <C-W>l

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

