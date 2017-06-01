" NeoBundle --- {{{
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif
" ---}}}

" Plugins --- {{{"
call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'neomake/neomake.git'
NeoBundleFetch 'editorconfig/editorconfig-vim.git'
NeoBundleFetch 'frankier/neovim-colors-solarized-truecolor-only.git'
NeoBundleFetch 'scrooloose/nerdtree.git'
NeoBundleFetch 'vim-airline/vim-airline.git'
NeoBundleFetch 'vim-airline/vim-airline-themes.git'
NeoBundleFetch 'tpope/vim-git.git'
NeoBundleFetch 'tpope/vim-fugitive.git'
NeoBundleFetch 'fatih/vim-go.git'
NeoBundleFetch 'vim-syntastic/syntastic.git'
NeoBundleFetch 'bronson/vim-trailing-whitespace.git'
NeoBundleFetch 'tiagofumo/vim-nerdtree-syntax-highlight.git'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'mac' : './install.sh --clang-completer --gocode-completer',
     \     'unix' : './install.sh --clang-completer --gocode-completer',
     \     'windows' : './install.sh --clang-completer --gocode-completer',
     \     'cygwin' : './install.sh --clang-completer --gocode-completer'
     \    }
     \ }
NeoBundle 'ryanoasis/vim-devicons.git'
call neobundle#end()
NeoBundleCheck
" --- }}

silent! call pathogen#infect()

" Settings ---{{{
set omnifunc=syntaxcomplete#Complete
set nocursorcolumn
set norelativenumber
" Enable true colors
set encoding=utf-8
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
"set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h12
set t_Co=256
set vb
set ruler
set showmatch
set backspace=2
set list
set listchars=tab:→·,trail:·
set modeline
set modelines=5
set cursorline
set autowrite
set showmode
set noshowmode
set noerrorbells
set novisualbell
set synmaxcol=200
set scrolljump=5
set lazyredraw
set hidden
set number
set hlsearch
set incsearch
set spelllang=en
set completeopt=longest,menuone
set mouse=c
set nobackup
set nowritebackup
set noswapfile
" Crosshair plugin
"set cursorline    " enable the horizontal line
"set cursorcolumn  " enable the vertical line
" Enable status line always
set laststatus=2
set tabstop=4 shiftwidth=4 expandtab
" Disable welcome
set shortmess+=I
syntax enable
filetype plugin indent on
syntax sync minlines=128

" Theme --- {{{
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_termtrans = 0

set termguicolors
set background=dark
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
colorscheme solarized
" Addon to highlighting of folding
"hi Folded          ctermfg=14   ctermbg=0

" Highlight lines over 80 chars
highlight ColorColumn ctermfg=green
call matchadd('ColorColumn', '\%81v', 100)

"autocmd BufWinLeave * call clearmatches()
" ---}}}

" Syntastic --- {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

" Use Neomake insted
let b:syntastic_skip_checks = 1
" --- }}}

" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#neomake#error_symbol=''
let g:airline#extensions#neomake#warning_symbol=''

" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1
"
" Show hex value of char
let g:airline_section_y = airline#section#create_right(['ffenc', 'Hex:0x%02B'])
"let g:airline_section_c = airline#section#create_right(['file','BN: %{bufnr("%")}'])

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='solarized'
" ---}}}

" Youcompleteme --- {{{
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_filetype_blacklist = {'tex' : 1, 'markdown' : 1, 'text' : 1, 'html' : 1}
let g:ycm_python_binary_path = '/usr/bin/python2'
let g:ycm_confirm_extra_conf = 0 "no annoying tips on vim starting
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" ---}}}

" Neomake ---{{{
highlight NeomakeErrorSign guifg=#ff0000 guibg=#073642
highlight NeomakeWarnSign  guifg=#fffc56 guibg=#073642
highlight NeomakeInfoSign  guifg=#4264ff guibg=#073642
let g:neomake_error_sign={'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign={'text': '', 'texthl': 'NeomakeWarnSign'}
let g:neomake_info_sign={'text': '', 'texthl': 'NeomakeInfoSign'}

let g:neomake_open_list = 0 " 2
let g:neomake_list_height = 5

" Only add neomake to known files
autocmd! BufWritePost,BufRead *.c Neomake
autocmd! BufWritePost,BufRead *.cpp Neomake
autocmd! BufWritePost,BufRead *.asm Neomake
autocmd! BufWritePost,BufRead *.go Neomake
autocmd! BufWritePost,BufRead *.py Neomake
autocmd! BufWritePost,BufRead *.yaml Neomake
autocmd! BufWritePost,BufRead *.json Neomake
autocmd! BufWritePost,BufRead *.sh Neomake
autocmd! BufWritePost,BufRead *.yml Neomake
autocmd! BufWritePost,BufRead *.rb Neomake
" ---}}}

" Devicons ---{{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'Linux'
" ---}}}

" Nerdtree ---{{{
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
"let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
" ---}}}

" Mappings ---{{{
let mapleader = ","

" Ctrl + n change buffer
nmap <c-n> :bnext<CR>
" Ctrl + p change buffer
nmap <c-p> :bprevious<CR>
",n new buffer
nmap <leader>n :enew<CR>
" ,q quit buffer
nmap <leader>q :bp <BAR> bd #<CR>

" close window
map <Leader>c :close<CR>

" redraw buffer
nmap <C-l> :redraw!
nmap <Leader>t :NERDTreeToggle<CR>
" ,s sort
vnoremap <Leader>s :sort<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Quoting in visuel mode
vnoremap <Leader>" c"<C-R>""<ESC>
vnoremap <Leader>' c'<C-R>"'<ESC>

" Quoting in non visuel mode
nnoremap <Leader>" ciw"<C-R>""<ESC>
nnoremap <Leader>' ciw'<C-R>"'<ESC>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Select all
map <Leader>a ggVG

map <Leader>l :redraw!<CR>
map <Leader>x :set tabstop=4 shiftwidth=4 expandtab
map <Leader>p :set paste<CR> i
" Remove highlight after search
map <Leader>C :let @/=""<CR>

" Count selection
map <Leader>g <C-g>

" Tab to complete (http://www.vimbits.com)
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>
"  Toogle spell language
"  (http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys)
let b:myLang=0
let g:myLangList=["nospell","en_us","da"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction
map <Leader>s :call ToggleSpell()<CR>
" ---}}}

" vim-go ---{{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_bin_path = expand("~/GOPATH/bin")
"---}}}

" Typeos
iabbr ture true
iabbr flase false

" Run make and if we get errors show them in a 3 line window
command -nargs=* Make make <args> | copen
map <Leader>m :Make<CR><CR><CR>

" Resizing
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>
nnoremap <silent> <Leader>% :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>& :exe "vertical resize -5"<CR>

" Files ---{{{
" Mail
autocmd FileType mail set tw=72 fo+=taw spell

" GO
autocmd FileType go set nolist

set rtp+=~/.vim/plugin/lint.vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" C/C++
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType asm setlocal tabstop=4 shiftwidth=4 expandtab

" json
"autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.json.disabled set ft=json
autocmd BufNewFile,BufRead *.jsondisabled set ft=json
autocmd FileType json setlocal tabstop=4 shiftwidth=4 expandtab

autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"let g:vim_markdown_folding_disabled=1
"autocmd FileType markdown setlocal tw=80
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
"autocmd BufNewFile,BufRead *.md set syntax=off
autocmd FileType markdown setlocal noexpandtab shiftwidth=4 tabstop=4

" don't show whitespace in help files
autocmd FileType help set nolist

autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType text setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby setlocal tabstop=4 shiftwidth=4 expandtab

" Yaml
autocmd BufRead,BufNewFile *.yml setfiletype yaml
"autocmd BufRead,BufNewFile *.yml syntax clear
autocmd FileType yaml setlocal expandtab ts=2 sw=2

" Make
autocmd FileType make setlocal noexpandtab

" Eruby
autocmd BufRead,BufNewFile *.erb setfiletype eruby

" Ruby
autocmd BufRead,BufNewFile *.rb setfiletype ruby

" Git
autocmd FileType gitcommit setlocal spell

autocmd BufEnter * :syn sync maxlines=200
" ---}}}


" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3

"autocmd VimEnter * :call AfterOpen()

" auto save and restore foldings
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview



