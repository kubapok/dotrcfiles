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


command SC SyntasticCheck
command SU SyntasticToggleMode
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" włącza NERDTree jeśli nie podam nazwypliku

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" żeby po instalacji fugigitve belka sie odpaliła trzeba zrobić:
" :PowerlineClearCache i zrestartować VIMa

syntax on

set backspace=indent,eol,start




" NIE WYCZKI############################################################################################
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




" SKRÓTY KLAWISZOWE ##################################################################################

vnoremap // y/<C-R>"<CR>
" nmap <leader>d 3dw7x
nnoremap gp `[v`]

vnoremap <S-h> <gv
vnoremap <S-l> >gv
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv


nnoremap Q @q

nnoremap <S-l> gt
nnoremap <S-h> gT
nnoremap <S-k> :tabclose<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <c-n> :NERDTreeToggle <CR>


" ---------------------------------------------------------------------------------------------------
" remove autocompletion preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
j


command Def execute ":YcmCompleter GoToDefinition"
command Dec execute ":YcmCompleter GoToDeclaration"





let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

command Nazwa execute ":!echo $(pwd -P)/%"

nnoremap <leader>t :TagbarToggle <CR>
nnoremap <leader>u :UndotreeToggle <CR>
nnoremap <leader>f :YcmCompleter FixIt<CR>
vnoremap <leader>f :YcmCompleter FixIt<CR>

set clipboard=unnamedplus
au Filetype python nnoremap <leader>g oimport pdb; pdb.set_trace()<esc>


" CamelCaseSerNik

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

map <space>l <Plug>(easymotion-lineforward)
map <space>h <Plug>(easymotion-linebackward)



map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" zrobić że na enter otwiera się markdow


" pozwala się ruszać sensownie w command line
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap ^     <home>
cnoremap $     <end>
