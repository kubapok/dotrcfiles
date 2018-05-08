" wtyczki ##########################################################################################
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_python_binary_path = '/usr/bin/python3'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ 'perl' ]


command SC SyntasticCheck
command SU SyntasticToggleMode
"


" włącza NERDTree jeśli nie podam nazwypliku

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" żeby po instalacji fugigitve belka sie odpaliła trzeba zrobić:
" :PowerlineClearCache i zrestartować VIMa

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



" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" u
"
"
"
"
" CamelCaseSerNik

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge



set clipboard=unnamedplus


" au Filetype markdown nnoremap <CR> :w<CR>:! pandoc --toc -V lang=pl % -o  %:r.pdf <CR> <CR>
au Filetype markdown nnoremap <CR> :w<CR>:! make  <CR> <CR>
au Filetype markdown setlocal spell spelllang=pl,en_us
au Filetype latex setlocal spell spelllang=pl,en_us

map <space> <Plug>(easymotion-prefix)
map <space>l <Plug>(easymotion-lineforward)
map <space>h <Plug>(easymotion-linebackward)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map  <Leader>f <Plug>(easymotion-bd-f)
" SKRÓTY KLAWISZOWE ##################################################################################


" LEADER
au Filetype python nnoremap <leader>g ofrom IPython import embed; embed()<esc>


"SKAKANIE MIEDZY OKNAMI I TABAMI
nnoremap <S-l> gt
nnoremap <S-h> gT
nnoremap <S-k> :tabclose<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" pozwala się ruszać sensownie w command line
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>


"PRZEMIESZCZANIE ZAZNACZONEGO TEKSTU
vnoremap <S-h> <gv
vnoremap <S-l> >gv
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

nnoremap <Up> :res +1<CR>
nnoremap <Down> :res -1<CR>




vnoremap // y/<C-R>"<CR>

nnoremap Q @q


nnoremap <c-n> :NERDTreeToggle <CR>
command Def execute ":YcmCompleter GoToDefinition"
command Dec execute ":YcmCompleter GoToDeclaration"
command Ref execute ":YcmCompleter GoToReferences"

command Pokaz execute ":!echo %:p"







map <space> <Plug>(easymotion-s)



map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


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


nnoremap <leader>p `[v`]
nnoremap <leader>a :Autoformat <CR>
nnoremap <leader>t :TagbarToggle <CR>
nnoremap <leader>u :UndotreeToggle <CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
" nnoremap <leader>p gp<ESC>


command JSON execute ":%!python -m json.tool"
set scrolloff=2
nnoremap <Up> :res +1<CR>
nnoremap <Down> :res -1<CR>
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <leader>r :reg<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>b :buffers<CR>
nnoremap <Tab> :bnext<CR>
command ReloadMYVIMRC execute ":so $MYVIMRC"
set nobackup
set noswapfile
