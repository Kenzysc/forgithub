call plug#begin('~/.local/share/nvim/plugged')
 Plug 'scrooloose/nerdTree'
 Plug 'mattn/emmet-vim'
 Plug 'bling/vim-airline'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'itchyny/lightline.vim'
 Plug 'ap/vim-buftabline'
 Plug 'tomasr/molokai'
 Plug 'dunstontc/vim-vscode-theme'
 Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
 Plug 'janko-m/vim-test'
 Plug 'scrooloose/nerdcommenter'
 Plug 'editorconfig/editorconfig-vim'                    
 Plug 'herringtondarkholme/yats.vim'
 Plug 'posva/vim-vue'
 Plug 'maxmellon/vim-jsx-pretty'
 Plug 'prettier/vim-prettier'
 Plug 'othree/xml.vim'        
 Plug 'othree/html5.vim'
 Plug 'cakebaker/scss-syntax.vim'
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-surround'
call plug#end()

nmap <C-n> :NERDTreeToggle<CR>
let g:user_emmet_leader_key=','

set number
set numberwidth=1


" ======================================================================================
" Config
" ======================================================================================
set termguicolors
set foldmethod=marker
set mouse=a
"set nowrap
set number
set enc=utf-8	" utf-8 by default in files
set ls=2	" show status bar always
set hlsearch	" highlight search
set showtabline=0
highlight LineNr ctermfg=gray
highlight Pmenu ctermbg=gray guibg=gray " popup autocomplete menu color

set t_Co=256
highlight Normal guibg=black guifg=white
set background=dark

colo molokai

" FZF {{{
nnoremap <A-f> :Ag<CR>
nnoremap <C-p> :Files<CR>

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}

"  buffers to tabs workaround {{{
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
"nmap <leader>l :bnext<CR>
"nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bd :bp <BAR> bd #<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \[ \] \= : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>= :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P<Paste>

" }}}

" NERT Tree {{{
map <F3> :NERDTreeToggle<CR>
" }}}

" Prettier {{{
let g:prettier#autoformat = 0
autocmd BufWritePre *​.​js​,​*​.jsx,​*​.mjs,​*​.​ts​,​*​.tsx,​*​.css,​*​.less,​*​.scss,​*​.json,​*​.graphql,​*​.md,​*​.vue PrettierAsync
" }}}

autocmd FileType vue syntax sync fromstart	" fix sync in vue files

" CoC conf {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>​check_back_space​() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>​(coc​-​diagnostic​-​prev​)
nmap <silent> ]c <Plug>​(coc​-​diagnostic​-​next​)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>​(coc​-​type​-​definition)
nmap <silent> gi <Plug>​(coc​-​implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>​show_documentation​()​<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CocAction('doHover') * silent call CocActionAsync​(​'​highlight​'​)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>​(coc​-​format​-​selected)
nmap <leader>f  <Plug>​(coc​-​format​-​selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr​=​CocAction​(​'​formatSelected​'​)
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync​(​'​showSignatureHelp​'​)
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>​(coc​-​codeaction​-​selected)
nmap <leader>a  <Plug>​(coc​-​codeaction​-​selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :​<C-u>​CocListResume​<CR>

" coc-jest
" -----------
" Run jest for current project
command! -nargs=0 Jest :call  CocAction​(​'​runCommand​'​, 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction​(​'​runCommand​'​, 'jest.fileTest', ['%'])
" Run jest for current test
nnoremap <leader>te :call CocAction​(​'​runCommand​'​, 'jest.singleTest')<CR>
" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction​(​'​runCommand​'​, 'jest.init')

" Coc-snippets
" ---------------
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>​(coc​-​snippets​-​expand​)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>​(coc​-​snippets​-​select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>​(coc​-​snippets​-​expand​-​jump)
" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable​() ? "​\<​C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])​\<​CR>​" :
      \ <SID>​check_back_space​() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
" }}}

" vim-test {{{
let test#strategy = "neovim"

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" }}}
" 


"-- AUTOCLOSE --
"autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"autoclose with ; and position cursor to write text inside (using fullstop instead of semicolon to initiate command)
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
"autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
"autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
"autoclose with ; and position cursor after (no way to slow down process b4 i can type in my ; so i resort to using .fullstop instead of semicolon)
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};
"autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},
"autoclose 2 lines below and position cursor in the middle 
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
"autoclose 2 lines below adding ; and position cursor in the middle (I use fullstop instead of semicolon for the mapping command)
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"autoclose 2 lines below adding , and position cursor in the middle 
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O

"(I use comma ',' as Leader key since it feels close to my fingers)
let mapleader = "\,"
"-- QUICK MOVEMENTS ON INSERT MODE --
"single movements h j k l
noremap! <Leader>h <left>
noremap! <Leader>j <down>
noremap! <Leader>k <up>
noremap! <Leader>l <right>
"append shortcuts
noremap! <Leader>A <esc>A
noremap! <Leader>a <esc>a
"new line and insert shortcuts
noremap! <Leader>O <esc>O
noremap! <Leader>o <esc>o
