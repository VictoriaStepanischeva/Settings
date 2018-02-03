execute pathogen#infect()
" set tab size
set tabstop=4
set shiftwidth=4
" set row number
set number
" enable whitespace displaying
set list
set listchars=tab:`.,trail:~,extends:>,precedes:<
" enable utf8 encoding
set encoding=utf-8
" enable syntax highlighting
syntax on
" enable search highlighting
set hlsearch
" transform tabs to spaces in python scripts
autocmd FileType python setlocal expandtab softtabstop=4

" Color column on 81 position
"if version > 703
"	set colorcolumn=81
"	highlight ColorColumn ctermbg=4
"endif

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
	filetype plugin indent on
endif

" tab navigation binds
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" comment bindings
autocmd FileType perl,python,bash let b:comment_leader = '# '
autocmd FileType lua,sql          let b:comment_leader = '-- '
autocmd FileType tex              let b:comment_leader = '% '
noremap <silent> #c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> #u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" quotation bindings
nnoremap "" ciw"<C-r>""<Esc>
nnoremap '' ciw'<C-r>"'<Esc>
nnoremap `` ciw`<C-r>"`<Esc>
vnoremap "" <Esc>>a"<Esc><i"<Esc>
vnoremap '' <Esc>>a'<Esc><i'<Esc>
vnoremap `` <Esc>>a`<Esc><i`<Esc>

" status line
set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=%{fugitive#statusline()}(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
