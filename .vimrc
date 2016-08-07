""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal type for cursor customization
" - Values: VTE, xfce-terminal, Konsole, iTerm2, iTerm2.tmux
let terminaltype = "VTE"

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
if has('unix') || has('macunix')
	if terminaltype == "VTE"
		let &t_SI = "\<Esc>[6 q"
		let &t_SR = "\<Esc>[4 q"
		let &t_EI = "\<Esc>[2 q"
	elseif terminaltype == "xfce-terminal" && has("autocmd")
		let sedcmd = '!sed -i.bak '
		let xfcerc = '~/.config/xfce4/terminal/terminalrc'
		let csunderline = 'TERMINAL_CURSOR_SHAPE_UNDERLINE'
		let csblock = 'TERMINAL_CURSOR_SHAPE_BLOCK'

		let bu = " 's/"+csblock+"/"+csunderline+"/' "
		let ub = " 's/"+csunderline+"/"+csblock+"/' "

		let cmdbu = sedcmd + "-e" + bu + xfcerc
		let cmdub = sedcmd + "-e" + ub + xfcerc

		au InsertEnter * silent execute cmdbu
		au InsertLeave * silent execute cmdub 
		au VimLeave * silent execute cmdub  
	elseif terminaltype == "Konsole"
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_SR = "\<Esc>]50;CursorShape=2\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	elseif terminaltype == "iTerm2"
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_SR = "\<Esc>]50;CursorShape=2\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	elseif terminaltype == "iTerm2.tmux"
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	endif
endif

" Enable filetype detection
filetype on

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Highlight search results
set hlsearch

" Set color scheme
colorscheme solarized

" Set background
if has("gui_running")
	set background=light
else
	set background=dark
endif

" Change window title
set title
" Change title string
let &titlestring = '%f %a%r%m'

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" 80 columns, please.
set textwidth=80
set colorcolumn=+1

" Set default tab size to 2 spaces.
set tabstop=2 shiftwidth=2


"if has('unix')
"	let os = substitute(system('uname'), "\n", "", "")
"endif

"if &t_Co >= 256 || has("gui_running")
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Keyboard and shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sudo
cmap w!! w !sudo tee % >/dev/null

" Clear search highlight
nmap <silent> ,/ :nohlsearch<CR>

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

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" `n` spaces to tabs
" http://vim.wikia.com/wiki/Super_retab
command! -nargs=1 -range Rtab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Fix NERDTree arrows encoding in GUI mode.
if has("gui_running")
	set encoding=utf-8
endif

" Enable indention
filetype plugin indent on

if has('autocmd')
	" DO NOT EXPAND TABS TO SPACES!!!
	autocmd filetype * set noexpandtab
endif
