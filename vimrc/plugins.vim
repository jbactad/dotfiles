call plug#begin('$HOME/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
"Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
Plug 'wakatime/vim-wakatime'
Plug 'ryanoasis/vim-devicons'
"Plug 'neomake/neomake'
Plug 'preservim/nerdcommenter'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

"------------------------------------------------------------------------------
" Colorscheme
"------------------------------------------------------------------------------
set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
try
    colorscheme PaperColor
catch
endtry
highlight Normal guifg=grey guibg=#282A36


"------------------------------------------------------------------------------
" NerdTree
"------------------------------------------------------------------------------
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
