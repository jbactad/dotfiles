call plug#begin('$HOME/.vim/vim-go-plugins')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.19' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
call plug#end()

" Mappings
map <C-n> :NERDTreeToggle<CR>

" Options
let NERDTreeShowHidden=1

" Colorscheme
set background=dark
colorscheme cosmic_latte
