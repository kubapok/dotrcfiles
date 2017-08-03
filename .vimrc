" wtyczki ##########################################################################################
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 0                                    
let g:syntastic_auto_loc_list = 0 
let g:syntastic_enable_perl_checker = 1
let g:syntastic_mode_map = { 'mode': 'passive'}

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


" command T tabclose








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

set clipboard=unnamedplus

set wildignore=*.png,*.PNG,*.svg,*xcf,*.jpg,*.JPG



set cursorline
highlight CursorLine ctermbg=Black cterm=NONE
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight LineNr ctermfg=darkgrey 





" SKRÓTY KLAWISZOWE ##################################################################################

vnoremap // y/<C-R>"<CR>
" nmap <leader>d 3dw7x
nnoremap <space> :
nnoremap :tabclose <CR>
" nnoremap : <nop>
nnoremap gp `[v`]

vnoremap <c-h> <gv
vnoremap <c-l> >gv


" nnoremap <ENTER> o<esc>

nnoremap Q @q

noremap <S-l> gt
noremap <S-h> gT
noremap <S-k> :tabclose<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <c-n> :NERDTreeToggle <CR>
nnoremap <c-m> :TagbarToggle <CR>

nnoremap <CR> o <esc>
 


154 " remove autocompletion preview
155 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
156 autocmd InsertLeave * if pumvisible() == 0|pclose|endif



156 " remove autocompletion preview
157 autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
158 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
159            
160 command Def execute ":YcmCompleter GoToDefinition"                                                                                                                                 
161 command Dec execute ":YcmCompleter GoToDeclaration"
