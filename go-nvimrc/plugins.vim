call plug#begin('$HOME/.config/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': 'v1.19' }
Plug 'uarun/vim-protobuf'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'valloric/youcompleteme'
Plug 'nightsense/cosmic_latte'
Plug 'SirVer/ultisnips'
Plug 'wakatime/vim-wakatime'
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
Plug 'ryanoasis/vim-devicons'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'preservim/nerdcommenter'
"Plug 'neomake/neomake'

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
let g:go_def_mode='guru'
let g:go_info_mode='gopls'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Commenter
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1

" Colorscheme
set background=dark
colorscheme cosmic_latte
