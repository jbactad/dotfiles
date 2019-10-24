call plug#begin('$HOME/.config/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.19' }
Plug 'uarun/vim-protobuf'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
Plug 'SirVer/ultisnips'
Plug 'wakatime/vim-wakatime'
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
call plug#end()

" Mappings
map <C-n> :NERDTreeToggle<CR>
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>f <Plug>(go-fmt)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Options
let NERDTreeShowHidden=1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_autosave = 1
let g:ale_linters = {
\   'proto': ['buf-check-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Colorscheme
set background=dark
colorscheme cosmic_latte
