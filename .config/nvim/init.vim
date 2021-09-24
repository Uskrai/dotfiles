
set number relativenumber

set signcolumn=number
"set signcolumn=yes

set linebreak

set hlsearch
set smartcase
set ignorecase
set incsearch

set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

set mouse=a
set clipboard=unnamedplus


lua require('plugins')


"colorscheme github_dark
"au ColorScheme * hi Normal ctermbg=none guibg=none
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"


"let delimitMate_expand_cr = 1

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<cr>"
"ino <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
          "\: "\<C-R>=delimitMate#ExpandReturn()\<CR>"

"vim-fswitch
autocmd BufEnter *fmr/src/*.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = 'reg:|src|include/fmr|'
autocmd BufEnter *fmr/include/fmr/*.h let b:fswitchdst = 'cpp,c' | let b:fswitchlocs = 'reg:|include/fmr|src|'

nmap <S-o> :FSHere<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

let g:rainbow_active = 1

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType java autocmd BufLeave * :FormatCode

  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END


