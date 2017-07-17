set number
colo elflord
execute pathogen#infect()


set cursorline


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_perl_checker = 1

let g:syntastic_mode_map = { 'mode': 'passive'}

command SC SyntasticCheck 
command SU SyntasticToggleMode


set hlsearch


let g:syntastic_always_populate_loc_list = 0                                    
let g:syntastic_auto_loc_list = 0 

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


au Filetype python setl et ts=4 sw=4
" syntax on
filetype indent plugin on

" włącza NERDTree jeśli nie podam nazwypliku

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" żeby sensownie dało się korzystać z airline i odświeżanie
set laststatus=2
set ttimeoutlen=50

" żeby po instalacji fugigitve belka sie odpaliła trzeba zrobić:
" :PowerlineClearCache i zrestartować VIMa

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


:highlight LineNr ctermfg=darkgrey
:highlight CursorLineNr ctermfg=white

vnoremap // y/<C-R>"<CR>

" ustawia we wpisywaniu komend normalnego taba
set wildmode=list:longest


				
set updatetime=250



set nowrap

function! s:Gowno()
	set nonu
endfunction
com! Gowno call s:Gowno()




highlight CursorLine ctermbg=Black cterm=NONE

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000


set clipboard=unnamedplus



set wildignore=*.png,*.PNG,*.svg,*xcf,*.jpg,*.JPG

nmap <leader>d 3dw7x
nnoremap <space> :
nnoremap : <nop>
nnoremap gp `[v`]

vmap <c-h> <gv
vmap <c-l> >gv

vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" nmap <ENTER> o<esc>
nmap <backspace> dd

nnoremap Q @q


noremap <S-l> gt
noremap <S-h> gT


map <c-n> :NERDTreeToggle<CR>
map <c-m> :TagbarToggle<CR>
