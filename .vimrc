" Shawn Poulson's .vimrc
" http://git.sevone.com/spoulson/dotfiles
" git@git.sevone.com:spoulson/dotfiles.git
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
" Auto-install vim-plug.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'kshenoy/vim-signature'
" Plug 'joonty/vdebug'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'isRuslan/vim-es6'
" Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'
" Plug 'ternjs/tern_for_vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/fzf'
Plug 'matze/vim-move'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-user'

" Color schemes.
" Plug 'altercation/vim-colors-solarized' " solarized
" Plug 'gothic'
" Plug 'molokai'
" Plug 'railscasts'
" Plug 'croaker/mustang-vim' " mustang
" Plug 'jonathanfilip/vim-lucius' " lucius
" Plug 'ciaranm/inkpot' " inkpot
" Plug 'zenburn'
" Plug 'fugalh/desert.vim' " desert
Plug 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call plug#end()

" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

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

" Browse .spk files with zip browser.
au BufReadCmd *.spk call zip#Browse(expand("<amatch>"))

" Easy switching buffers.
map gb :bnext<cr>
map gB :bprevious<cr>

" Tidy tools.
command! Jsontidy execute "%!python -m json.tool"
command! Xmltidy execute "%!xmllint --format -"

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

" Switch symbol under cursor.
map <leader>s :Switch<CR>

" Tern settings.
" let g:tern_show_argument_hints='on_hold'
" let g:tern_map_keys=1

" Syntax highlighting rules.
augroup filetypedetect
	au BufRead,BufNewFile .tern-project set filetype=json
	au BufRead,BufNewFile .babelrc set filetype=json
	au BufRead,BufNewFile .flowconfig set filetype=dosini
	au BufRead,BufNewFile .npmrc set filetype=dosini
	au BufRead,BufNewFile .sequelize set filetype=javascript
augroup END

" Map x to a different register than d.
vmap X "_d
vmap x "_d

" netrw customizations.
" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 25
" augroup ProjectDrawer
" 	autocmd!
" 	autocmd VimEnter * :Vexplore
" augroup END

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
