" wtyczki ##########################################################################################
set nocp
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_python_binary_path = '/usr/bin/python3'

" włącza NERDTree jeśli nie podam nazwypliku

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on

set backspace=indent,eol,start

" remove autocompletion preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


set number
colo elflord
set hlsearch
au Filetype python setl et ts=4 sw=4
" syntax on
filetype indent plugin on
" żeby sensownie dało się korzystać z airline i odświeżanie
set laststatus=2
set ttimeoutlen=50

" :DiffSaved sprawdza co sie zmieniło przed zapisem
" :diffoff to wyłącza
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


" ustawia we wpisywaniu komend normalnego taba
set wildmode=list:longest

set updatetime=250
set nowrap


set wildignore=*.png,*.PNG,*.svg,*xcf,*.jpg,*.JPG

set cursorline
highlight CursorLine ctermbg=Black cterm=NONE
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight LineNr ctermfg=darkgrey

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1


set clipboard=unnamedplus

" au Filetype markdown nnoremap <CR> :w<CR>:! pandoc --toc -V lang=pl % -o  %:r.pdf <CR> <CR>
au Filetype markdown nnoremap <CR> :w<CR>:! make  <CR> <CR>
au Filetype markdown setlocal spell spelllang=pl,en_us
au Filetype latex setlocal spell spelllang=pl,en_us

" SKRÓTY KLAWISZOWE ##################################################################################


nnoremap <C-h> gT
nnoremap <C-l> gt
" nnoremap <C-k> :tabclose <CR>
" nnoremap <C-j> :tabnew <CR>

" pozwala się ruszać sensownie w command line vimowym
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

nnoremap Q @q

nnoremap <c-n> :NERDTreeToggle <CR>

command Pokaz execute ":!echo %:p"

let g:vim_markdown_folding_style_pythonic = 1

command Test split %:p:h/test_%:t

" Code from:
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
" then https://coderwall.com/p/if9mda
" and then https://github.com/aaronjensen/vimfiles/blob/59a7019b1f2d08c70c28a41ef4e2612470ea0549/plugin/terminaltweaks.vim
" to fix the escape time problem with insert mode.
"
" Docs on bracketed paste mode:
" http://www.xfree86.org/current/ctlseqs.html
" Docs on mapping fast escape codes in vim
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim

if exists("g:loaded_bracketed_paste")
	finish
endif
let g:loaded_bracketed_paste = 1

let &t_ti .= "\<Esc>[?2004h"
let &t_te .= "\<Esc>[?2004l"

function! XTermPasteBegin(ret)
	set pastetoggle=<f29>
	set paste
	return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>
" END OF PLUGIN


au Filetype python nnoremap <leader>g ofrom IPython import embed; embed()<esc>
" nnoremap <leader>p `[v`]
nnoremap <leader>r :Autoformat <CR>
" nnoremap <leader>a :ALEFix <CR>
nnoremap <leader>t :TagbarToggle <CR>
nnoremap <leader>u :UndotreeToggle <CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>

let g:ale_fixers = ['autopep8']

command JSON execute ":%!python -m json.tool"
set scrolloff=2

set nobackup
set noswapfile

let NERDTreeIgnore = ['\.pyc$', '\.class$']

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

nnoremap <C-a> :tabclose<CR>


command PrettyJson execute ":%!python -m json.tool"


let g:ale_echo_msg_format = '%linter% says %s'

