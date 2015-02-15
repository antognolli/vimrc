" read modeline from files
set modeline

call pathogen#infect()

" syntax highlight on
syntax on
filetype plugin indent on

" my default indentation
set sw=4 ts=4 sts=4 et
set cino=(0W1st0
set smarttab

set guioptions-=m
set guioptions-=M

set cindent
set autoindent

set incsearch
set nohlsearch

set tags=./tags,tags,~/.vim/tmptagsfile,~/.vim/tagsfile,~/.vim/efltagsfile
set cscopetag

" allow to hide buffers with changes not written to file
set hidden

set laststatus=2

set number
set relativenumber

" highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
" match Overlength '\%>80v.\+'

highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

set listchars=tab:>-,trail:.,extends:>
set list

" Make vim work with tmux
if &term == "screen"
    set t_kN=[6;*~
    set t_kP=[5;*~
endif

" Remap Alt + Space ==> ESC
nmap <Space> <Nop>
inoremap jk <ESC>
inoremap kj <ESC>

" <Space> + shortcut
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Get efficient with shortcuts, don't need to press <shift> to enter commands
noremap ; :

" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" EasyMotion
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)

" Better navigation on long lines
nnoremap j gj
nnoremap k gk
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" quickfix window on topleft
cnoremap cw topleft cwindow

nmap <leader>cd :lcd %:p:h<CR>:pwd<CR>
nmap <leader>bd :Bclose<CR>

nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vt :tab split $MYVIMRC<CR>
nnoremap <leader>vl :source $MYVIMRC<CR>

nmap <leader>ma :make<CR>
nmap <leader>mi :make install<CR>

"nmap <leader>/ :FufLine<CR>

" FIXME: Change this to a <Leader> sequence.
nmap <F1> :bp <enter>
nmap <F2> :bn <enter>

"nmap <F3> :BufExplorer <CR>
nmap <F4> :NERDTreeToggle <CR>
"nmap <F5> :!ctags -f ~/.vim/tmptagsfile --append --tag-relative -R --c-kinds=+p --fields=+S . <CR>
"nmap <F6> :!rm ~/.vim/tmptagsfile <CR>

nmap <Leader>f :NERDTreeFind<CR>
nmap <Leader>bo :Bookmark
nmap <Leader>txt :setlocal nocindent tw=79 nolist<CR>
nmap <Leader>zodiac :set ts=8 sw=8 sts=8 nolist noet<CR>

"setting edc indent
nmap <F9> :setlocal ts=3 sw=3 sts=3 nocindent <enter>

"setting efl indent
nmap <F10> :setlocal cindent ts=8 sw=3 sts=8 expandtab cino=>5n-3f0^-2{2(0W1st0 <enter>

"setting tmp indent
nmap <F8> :set nolist ts=8 sw=8 sts=8 noet <enter>

"better shortcut for changing to previous tab (no <SHIFT> needed)
nnoremap gr gT
nnoremap gn gt
nnoremap gp gT

set tabline=%!MyTabLine()

" search files
" nnoremap <Leader>p :CtrlP

let g:ctrlp_max_height = 50
let g:ctrlp_by_filename = 1
let g:ctrlp_lazy_update = 100
let g:ctrlp_max_files = 0
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_switch_buffer = 0

" The following custom command for ctrlp is great, way faster than the builtin
" one, but unfortunately its accuracy is not so great. Try to improve it some
" day, and get a faster search.
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }
let g:ctrlp_working_path_mode = 'rw'

let g:airline_powerline_fonts = 1

let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {
    \ 'python': 'python',
    \ 'c++': 'cpp',
    \ 'c': 'c',
    \ 'bash': 'sh',
    \ }
let g:vimwiki_list = [wiki]
let g:vimwiki_hl_headers=1

let g:fugitive_repo_cwd=1

" let g:ctrlp_extensions = ['sample']
