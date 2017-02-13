" Shawn Poulson's .vimrc
"
" Pre-requisites:
" * Powerline compatible font for your terminal application due to use of vim-airline.
"   Obtain from: https://github.com/powerline/fonts
"   Note: 'guifont' setting only applies to GUI Vim implemenations, like: MacVim
"   and gvim.
"

" Install vim
set nocompatible
set hidden
filetype off

" Color scheme.
syntax on
set background=dark
let g:solarized_termcolors=256
set t_Co=256

" Plugins.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
if version > 730
	Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'kshenoy/vim-signature'
Plugin 'joonty/vdebug'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-syntastic/syntastic'
Plugin 'mhinz/vim-startify'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'AndrewRadev/switch.vim'

" Color schemes.
" Plugin 'altercation/vim-colors-solarized' " solarized
" Plugin 'gothic'
" Plugin 'molokai'
" Plugin 'railscasts'
" Plugin 'croaker/mustang-vim' " mustang
" Plugin 'jonathanfilip/vim-lucius' " lucius
" Plugin 'ciaranm/inkpot' " inkpot
" Plugin 'zenburn'
" Plugin 'fugalh/desert.vim' " desert
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" Color scheme.
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
" silent! colorscheme mustang
silent! colorscheme gruvbox

" Font.
"set guifont=Inconsolata-dz\ for\ Powerline:h12
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
"set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12

" Mouse scrolling enabled.
set mouse+=a
" Set ttymouse=xterm2 when running under tmux.  This corrects issues with mouse
" dragging features.
" http://superuser.com/a/550482/798
if &term =~ '^screen'
	" tmux knows the extended mouse mode.
	set ttymouse=xterm2
endif

" Always show the statusline.
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Line numbers.
set number

" Tab completion on filenames.
set wildmode=longest,list,full
set wildmenu

" Highlight cursor line.
set cursorline
hi cursorline term=bold cterm=bold ctermbg=236 guibg=gray25

" Highlight trailing whitespace.
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Soft word wrap in editor.
set wrap
au FileType gitcommit set textwidth=0 wrapmargin=0

" Visible tabs, off by default.
" Use ':set [list|nolist]' to enable/disable on demand.
set nolist
"set listchars=tab:▸\ 
set listchars=tab:→\ 
" F7: toggle display of tabs/spaces/etc
nmap <F7> :set list!<return>

" Tab width.
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab smarttab

" Indent guides.
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesEven ctermbg=232 guibg=#181818 guifg=fg
hi IndentGuidesOdd ctermbg=233 guibg=#202020 guifg=fg

" Enable search highlight
set hlsearch

" Enable sessions for Taboo.
set sessionoptions+=tabpages,globals

" YouCompleteMe.
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Easy switching buffers.
map gb :bnext<cr>
map gB :bprevious<cr>

" Tidy tools.
command Jsontidy execute "%!python -m json.tool"
command Xmltidy execute "%!xmllint --format -"

" Autosave session.
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Syntastic settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Map convert buffers to tabs.
map <leader>bt :tab sball<CR>

" Increase number of gitgutter marks.
let g:gitgutter_max_signs = 2048
"
" Switch symbol under cursor.
map <leader>s :Switch<CR>

" MacVim customizations.
if has("gui_macvim")
  set macmeta
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
  noremap <M-l> :bnext!<CR>
  noremap <M-h> :bprev!<CR>
  noremap <D-]> :bnext!<CR>
  noremap <D-[> :bprev!<CR>

  " Switch to specific tab numbers with Command-number.
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif
