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
set viminfo='100,n$HOME/.viminfo

" Allow .vimrc/.vim work in alternate path outside of home dir.
" Usage: vim -u <path_to_vimrc>
let $VIMHOME = expand('<sfile>:p:h') . '/.vim'
set rtp^=$VIMHOME

" Color scheme.
syntax on
set background=dark
let g:solarized_termcolors=256
set t_Co=256

" Plugins.
" Auto-install vim-plug.
if empty(glob($VIMHOME . '/autoload/plug.vim'))
  silent exec '!curl -fLo ' . $VIMHOME . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
silent! call plug#begin($VIMHOME . '/plugged')
" vim-airline: Powerline-like status line.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-fugitive: Git commands.
Plug 'tpope/vim-fugitive'

Plug 'rhysd/git-messenger.vim'

" vim-gitv: gitk-like repository viewer.
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" vim-gitgutter: Show git diff symbols in the gutter.
Plug 'airblade/vim-gitgutter'

" vim-surround: Manipulate quotes, brackets, and stuff.
Plug 'tpope/vim-surround'

" CtrlP: Find files by name.
Plug 'kien/ctrlp.vim'

" YouCompleteMe: Autocompletion popups.
" Requires compiling server executable.
" It rarely works right and not portable.
" Use VimCompletesMe, instead.
" Plug 'Valloric/YouCompleteMe'

" VimCompletesMe: Tab completion popups.
" Plug 'ajh17/VimCompletesMe'

" Deoplete: Auto completion popups.
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" vim-indent-guides: Indicate indent level by coloration.
Plug 'nathanaelkane/vim-indent-guides'

" editorconfig: Parse .editorconfig files.
Plug 'editorconfig/editorconfig-vim'

" vim-windowswap: ?
Plug 'wesQ3/vim-windowswap'

" vim-signature: Toggle, display, and navigate marks.
Plug 'kshenoy/vim-signature'

" Vdebug: can debug PHP.
" Plug 'joonty/vdebug'

" Ag: The Silver Searcher, search in files.
" Must install ag tool. https://github.com/ggreer/the_silver_searcher#installing
" Plug 'rking/ag.vim'

" Ack: Search in files.
Plug 'mileszs/ack.vim'

" Tcomment: Code commenting commands.
Plug 'tomtom/tcomment_vim'

" vim-syntastic: Syntax checking tools.
Plug 'vim-syntastic/syntastic'

" vim-startify: Default UI on startup.
Plug 'mhinz/vim-startify'

" yajs: Javascript syntax highlighting.
" Plug 'othree/yajs.vim'

" es-Next-Syntax: Javascript syntax highlighting.
" Plug 'othree/es.next.syntax.vim'

" vim-es6: Javascript syntax highlighting
" Plug 'isRuslan/vim-es6'

" vim-javascript: Javascript syntax highlighting.
" Plug 'pangloss/vim-javascript'

" vim-javascript-syntax: Javascript syntax highlighting. (best)
Plug 'jelera/vim-javascript-syntax'

" javascript-libraries-syntax: Javascript syntax highlighting for popular libraries.
" Plug 'othree/javascript-libraries-syntax.vim'

" vim-jsx: Javascript/JSX syntax highlighting.
" Plug 'mxw/vim-jsx'

" tern for vim: Code analysis tool for Javascript.
" Plug 'ternjs/tern_for_vim'

" Markdown-Syntax: Markdown syntax highlighting.
" Review: Not as good syntax highlighting and faulty indentation.  Use
" built-in Markdown instead.
" Plug 'plasticboy/vim-markdown'

" JSON.vim: JSON syntax highlighting.
Plug 'elzr/vim-json'

" vim-misc: Required for vim-session.
Plug 'xolox/vim-misc'

" vim-session: Editor session state save/restore.
Plug 'xolox/vim-session'

" switch: Toggle common words.
Plug 'AndrewRadev/switch.vim'

" FZF: Fuzzy finder.  Find files by name.
" Must install fzf tool. https://github.com/junegunn/fzf#installation
Plug 'junegunn/fzf'

" vim-move: Move lines and selections up and down.
Plug 'matze/vim-move'

" vim-textobj-*: Text object enhancements.
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-user'

" comittia: When vim launches from git commit, show 3 way split of commit
" message editor, git status, and git diff.
Plug 'rhysd/committia.vim'

" ALE: Asynchronous Linting Engine.
" Plug 'w0rp/ale'

" Narrow Region: Edit regions in separate buffer.
Plug 'chrisbra/NrrwRgn'

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

set rtp+=/usr/local/opt/fzf

filetype plugin indent on

" Color scheme.
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
set termguicolors
silent! colorscheme gruvbox

" Font.
" set guifont=Inconsolata-dz\ for\ Powerline:h12
" set guifont=DejaVu\ Sans\ Code\ for\ Powerline:h12
" set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h14
" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
set guifont=DejaVuSansMonoNerdFontCompleteM-Book:h14
" set guifont=Inconsolata\ Nerd\ Font:h16
" set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
" set guifont=Fira\ Code:h11
" set guifont=Monoid:h11
" set guifont=Hasklig:h12

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
" Hide file encoding section
let g:airline_section_y = ''

" Line numbers.
set number
set scrolloff=10

" Text wrap width.
" set tw=80

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
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab

" Indent guides.
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesEven ctermbg=232 ctermfg=240 guibg=#181818 guifg=#606060
hi IndentGuidesOdd ctermbg=233 ctermfg=240 guibg=#202020 guifg=#606060
hi Comment gui=italic

" Enable search highlight
set hlsearch

" Enable sessions for Taboo.
set sessionoptions+=tabpages,globals

" YouCompleteMe.
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Easy switching buffers.
map gb :bnext<cr>
map gB :bprevious<cr>

" Tidy tools.
command! Jsontidy execute "%!jq"
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
set updatetime=100

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

" Toggle paste mode: ;p.
set pastetoggle=;p

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

" Use JSON.vim on json files.
au! BufRead,BufNewFile *.json set filetype=json

" Set session save path, incase $VIMHOME is custom.
let g:session_directory = $VIMHOME . '/sessions'

" Customize ack.vim to use ag.
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev Ag Ack

" MacVim customizations.
if has("gui_macvim")
	" Would prefer ligatures, but MacVim doesn't render them properly.
	set nomacligatures
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

	" Remove full screen button from TouchBar
	aunmenu TouchBar.EnterFullScreen
endif
