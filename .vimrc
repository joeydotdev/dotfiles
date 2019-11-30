syntax enable
set backspace=indent,eol,start
let mapleader = ','
set number

" ------ Visuals ------ "
colorscheme monochrome
set guifont=Fira_Code_Retina:h14
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set linespace=15

" ------ Search ------ "
set hlsearch
set incsearch

" ------ Mappings ------ "
" Open .vimrc file with `,ev` "
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Simple highlight removal "
nmap <Leader><space> :nohlsearch<cr>

" ------ Tab Width ------ "
set ts=2 sw=2

" ------ Auto Commands ------ "
" Automatically source .vimrc file on save. "
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
