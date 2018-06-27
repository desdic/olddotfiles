set shell=bash

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
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'Shougo/denite.nvim'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'honza/vim-snippets'
NeoBundle 'neomake/neomake.git'
NeoBundle 'editorconfig/editorconfig-vim.git'
NeoBundle 'frankier/neovim-colors-solarized-truecolor-only.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'vim-airline/vim-airline.git'
NeoBundle 'vim-airline/vim-airline-themes.git'
NeoBundle 'tpope/vim-git.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-dispatch.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'fatih/vim-go.git'
NeoBundle 'vim-syntastic/syntastic.git'
NeoBundle 'bronson/vim-trailing-whitespace.git'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight.git'
NeoBundle 'Raimondi/delimitMate.git'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'ryanoasis/vim-devicons.git'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rodjek/vim-puppet.git'
call neobundle#end()
NeoBundleCheck
" --- }}


" Settings --- {{{
source ~/.config/nvim/settings.vim
" --- }}}

" Theme --- {{{
set termguicolors
set background=dark
set guicursor= "Disable cursor styling

" Solarized
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_termtrans = 0
colorscheme solarized
let g:airline_theme='solarized'


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
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''
highlight SyntasticStyleErrorSign guifg=#ff0000 guibg=#073642
highlight SyntasticStyleWarningSign  guifg=#fffc56 guibg=#073642

" Use Neomake insted (Not)
let b:syntastic_skip_checks = 0
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
" ---}}}

" Neosnippet --- {{{
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"map <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" ---}}}

" ctrlp ---{{{
let g:ctrlp_map = '<c-m>'
let g:ctrlp_cmd = 'CtrlP'
" ---}}}

" Deoplete ---{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go'

function! s:tab_complete()
  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction

imap <silent><expr><TAB> <SID>tab_complete()

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

"let g:neomake_python_enabled_makers = ['flake8', 'pylint']
let g:neomake_python_enabled_makers = ['flake8']

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

"delimate ---{{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
" ---}}}


" Mappings --- {{{
source ~/.config/nvim/mapping.vim
" --- }}}

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
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_addtags_transform = 'camelcase'

let g:go_jump_to_error = 1
let g:go_bin_path = "~/go/bin/"
"---}}}

" Typeos
iabbr ture true
iabbr flase false

" Files ---{{{
"

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

" Settings --- {{{
source ~/.config/nvim/filetypes.vim
" --- }}}

" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3
