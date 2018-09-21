set nocompatible              " be iMproved, required filetype off                  " required

call plug#begin('~/.config/nvim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('/home/abdulkarim/.nvim/bundle/Vundle.vim')

Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set colorscheme VIM
let g:enable_bold_font = 1
let g:enable_italic_font = 1
syntax enable
let g:onedark_termcolors=256
colorscheme onedark

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermfg=grey

"Set Leader
let mapleader=','

" Set relative numbers:
set rnu
set nu

"Set directory of swapfile
set noswapfile

"Format
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set autoindent
set backup
set smartindent
set showmatch
set textwidth=80
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set modeline
set ls=2

"Search things
set hlsearch
set incsearch
set ignorecase
set smartcase

set clipboard=unnamedplus


" Set shortcut key Nerdree on F3 and tagbar on F4:
nmap <F4> :TagbarToggle<CR>
map <F3> :NERDTreeToggle<CR>

" Nerdtree opens automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Set tab Vim-support
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-Right> :bn<CR>
noremap <C-Left> :bp<CR>
noremap <C-b> :split<CR>
noremap <C-v> :vsplit<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <S-t> :tabnew<CR>

"Copy & Past Support in Vim!
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

"Comment and Uncomment word with cc and cu respectively
 autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
 autocmd FileType sh,ruby,python   let b:comment_leader = '# '
 autocmd FileType conf,fstab       let b:comment_leader = '# '
 autocmd FileType tex              let b:comment_leader = '% '
 autocmd FileType mail             let b:comment_leader = '> '
 autocmd FileType vim              let b:comment_leader = '" '
 noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
 noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
 noremap <silent> <leader><space> :noh<cr>

" Snippets toggels
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe essential
let g:ycm_global_ycm_extra_conf = '/home/abdulkarimh/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" Statusline configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1

"Airline Essential
let g:airline_theme='onedark'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

" Ctrl-P basic Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd BufNewFile *.py :set omnifunc=python3complete#Complete

"prérequis tags      
set nocp      
filetype plugin on      
"
" configure tags - add additional tags here or comment out not-used ones      
set tags+=~/.vim/tags/stl      
set tags+=~/.vim/tags/gl      
set tags+=~/.vim/tags/sdl      
set tags+=~/.vim/tags/qt4      
"
" build tags of your own project with CTRL+F12      
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>      
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      
"
" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview
