call plug#begin('$HOME/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
"Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
Plug 'wakatime/vim-wakatime'
Plug 'ryanoasis/vim-devicons'
"Plug 'neomake/neomake'
Plug 'preservim/nerdcommenter'

call plug#end()

" Mappings
map <C-n> :NERDTreeToggle<CR>

" Options
let NERDTreeShowHidden=1

" Colorscheme
set background=dark
colorscheme cosmic_latte

" Neomake
"" When writing a buffer (no delay).
"call neomake#configure#automake('w')
"" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
"" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
"" Full config: when writing or reading a buffer, and on changes in insert and
"" normal mode (after 500ms; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
