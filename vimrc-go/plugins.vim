" {{{1 Plugins
call plug#begin("$HOME/.vim-go/plugged")
" {{{2 Navigation
Plug 'preservim/nerdtree', { 'tag': '*' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
" }}}
" {{{2 Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
" }}}
" {{{2 Editor
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'tag': '*' }
Plug 'jiangmiao/auto-pairs'
" Plug 'AndrewRadev/splitjoin.vim'
"}}}
"{{{1 Intelisense
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer' }
" {{{2 Session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
"Plug 'thaerkh/vim-workspace'
Plug 'mbbill/undotree'
" }}}
" {{{2 Misc
Plug 'wakatime/vim-wakatime'
" Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-go'}
" }}}
call plug#end()
" }}}
" {{{1 Colorscheme
set background=dark
let g:PaperColor_Theme_Options = {
  \  'theme': {
  \    'default': {
  \       'transparent_background': 1,
  \    },
  \  },
  \ }
try
    colorscheme PaperColor
catch
endtry
highlight CocHighlightText ctermbg=6 guibg=#008080
" }}}
" {{{1 NerdTree
let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" let NERDTreeMinimalUI=1
" }}}
" {{{1 Tagbar
nmap <F8> :TagbarToggle<CR>
" }}}
" {{{1 lightline
set noshowmode
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitstatus', ],
  \     [ 'filename', ],
  \     [ 'modified', ],
  \   ],
  \   'right':[
  \     [ 'lineinfo', 'percent'],
  \     [ 'filetype', 'fileencoding', 'shiftwidth', ],
  \     [ 'blame', ],
  \   ],
  \ },
  \ 'inactive': {
  \   'left': [
  \     [ 'filename' ]
  \   ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \   'cocstatus': 'coc#status',
  \   'diagnostics': 'LightlineDiagnostics',
  \   'shiftwidth': 'LightlineShiftwidth',
  \   'gitstatus': 'LightlineGitStatus',
  \   'diagnostics2': 'LightlineDiagnostics2',
  \ },
  \ 'component':{
  \ },
  \ 'component_expand': {
  \   'errors': 'LightlineErrors',
  \   'warnings': 'LightlineWarnings',
  \   'informations': 'LightlineInformations',
  \ },
  \ 'component_type': {
  \   'errors': 'error',
  \   'warnings': 'warning',
  \   'informations': 'tabsel',
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ 'relativepath', 'close' ] ],
  \ },
\ }

autocmd User CocDiagnosticChange call lightline#update()
autocmd User CocStatusChange call lightline#update()
" }}}
" {{{1 vim-workspace
nnoremap <leader>s :ToggleWorkspace<CR>
" enabled = 1 (default), disabled = 0
let g:workspace_create_new_tabs = 1
" default session name
let g:workspace_session_name = 'Session.nvim'
" session storage location
let g:workspace_session_directory = $HOME . '/.vim-go/sessions/'
" disable workspace session if opening a file, i.e. nvim file.type
let g:workspace_session_disable_on_args = 1
" enabled = 1 (default), disabled = 0
let g:workspace_persist_undo_history = 1
" always autosave workspace.
let g:workspace_autosave_always = 1
" autoremove trailing spaces on files
let g:workspace_autosave_untrailspaces = 0
" ignore gitcommit file from workspace
let g:workspace_autosave_ignore = ['gitcommit']
" }}}
" {{{1 undotree
nnoremap <leader>ut :UndotreeToggle<CR>
" }}}
" {{{1 vim-go
set autowrite
set updatetime=100
map <leader>ne :cnext<CR>
map <leader>np :cprevious<CR>
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
" }}}
" {{{1 vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" }}}
" {{{1 youcompleteme
" }}}
"{{{1 ultisnips
"let g:UltiSnipsExpandTrigger="<TAB>"
"let g:UltiSnipsJumpForwardTrigger="<TAB>"
"let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
"}}}
" {{{1 auto-pairs
" prevents autopair from deleting lines
let g:AutoPairsMultilineClose = 0
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
" }}}
" {{{1 Utility Functions
function! LightlineGitStatus() abort
    return get(g:, 'coc_git_status', '')
endfunction

function! LightlineShiftwidth() abort
    return &expandtab?'S:'.&shiftwidth:'T:'.&tabstop
endfunction

function! LightlineGitBlame() abort
    let blame = get(b:, 'coc_git_blame', '')
    return winwidth(0) > 120 ? blame : ''
endfunction

function! LightlineInformations() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    return ':' . get(info, 'information', 0)
endfunction

function! LightlineWarnings() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    return ':' . get(info, 'warning', 0)
endfunction

function! LightlineErrors() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    return ':' . get(info, 'error', 0)
endfunction

function! LightlineDiagnostics() abort
    let info = get(b:, 'coc_diagnostic_info', {})

    if empty(info) | return '' | endif

    let msgs = []

    if get(info, 'error', 0)
        call add(msgs, ':' . info['error'])
    endif

    if get(info, 'warning', 0)
        call add(msgs, ':' . info['warning'])
    endif

    if get(info, 'information', 0)
        call add(msgs, ':' . info['information'])
    endif

    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

function! LightlineDiagnostics2() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = []
    call add(msgs, ':' . get(info, 'error', 0))
    call add(msgs, ':' . get(info, 'warning', 0))
    call add(msgs, ':' . get(info, 'information', 0))
    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
