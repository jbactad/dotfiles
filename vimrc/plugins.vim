call plug#begin('$HOME/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
Plug 'wakatime/vim-wakatime'

call plug#end()

" Mappings
map <C-n> :NERDTreeToggle<CR>

" Options
let NERDTreeShowHidden=1

" Colorscheme
set background=dark
colorscheme cosmic_latte
