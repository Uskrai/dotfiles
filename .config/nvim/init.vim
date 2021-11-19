
set number relativenumber

set signcolumn=yes

set linebreak

set hlsearch
set smartcase
set ignorecase
set incsearch

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start

set mouse=a
set clipboard=unnamedplus

set sessionoptions+=resize,winpos,terminal

set foldmethod=syntax

let g:rust_recommended_style = 0


lua require('plugins')

" colorscheme github_dark

" colorscheme github_*
"au ColorScheme * hi Normal ctermbg=none guibg=none
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope frecency<cr>

inoremap <silent><expr> <C-space> coc#refresh()

"vim-fswitch
autocmd BufEnter *fmr/src/*.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = 'reg:|src|include/fmr|'
autocmd BufEnter *fmr/include/fmr/*.h let b:fswitchdst = 'cpp,c' | let b:fswitchlocs = 'reg:|include/fmr|src|'

noremap <S-o> :FSHere<cr>

noremap <Leader>dvo :DiffviewOpen<cr>
noremap <leader>dvc :DiffviewClose<cr>
noremap <leader>dvfh :DiffviewFileHistory<cr>

let g:UltiSnipsExpandTrigger = "<NUL>"

let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

let g:rainbow_active = 1

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpair = 1

let g:polyglot_disabled = [
      \ 'autoindent', 
      \ 'rust', 
  \ ]

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  "" autocmd FileType java AutoFormatBuffer google-java-format
  "" autocmd FileType java autocmd BufLeave * :FormatCode

  autocmd FileType python AutoFormatBuffer yapf
  "" Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

autocmd BufWrite *.lua call LuaFormat() 

autocmd filetype blade
  \ autocmd BufRead,BufEnter * set nowrap

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '--shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

augroup Barbar
  nnoremap <silent>   <A-,> :BufferPrevious<CR>
  nnoremap <silent>   <A-.> :BufferNext<CR>
  nnoremap <silent>   <A-q> :BufferClose<CR>

  nnoremap <silent>   <A-1> :BufferGoto 1<CR>
  nnoremap <silent>   <A-2> :BufferGoto 2<CR>
  nnoremap <silent>   <A-3> :BufferGoto 3<CR>
  nnoremap <silent>   <A-4> :BufferGoto 4<CR>
  nnoremap <silent>   <A-5> :BufferGoto 5<CR>
  nnoremap <silent>   <A-6> :BufferGoto 6<CR>
  nnoremap <silent>   <A-7> :BufferGoto 7<CR>
  nnoremap <silent>   <A-8> :BufferGoto 8<CR>
  nnoremap <silent>   <A-9> :BufferLast<CR>

  nnoremap <silent>   <A-p> :BufferPick<CR>

  nnoremap <silent>   <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>   <A->> :BufferMoveNext<CR>
augroup END

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar()
      \ ],
      \ }))

autocmd BufNewFile,BufRead *.rn 
  \ :set filetype=rune  |
  \ :set syntax=rust |
  \ :set commentstring=//%s |
  \ :set formatoptions=croqnlj |
  \ :set comments="s0:/*!,m: ,ex:*/,s1:/*,mb:*,ex:*/,:///,://!,://"

autocmd FileType rune
  \ let b:closer = 1 |
  \ let b:closer_flags = '([{' 

augroup coc
  
" GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <leader>rn <Plug>(coc-rename)
augroup END


let g:lexima_enable_basic_rules = 0
let g:lexima_enable_newline_rules = 1

colorscheme github_dark
autocmd VimEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd VimEnter * match OverLength /\%81v.\+/
