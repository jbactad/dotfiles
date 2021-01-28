" {{{1 Plugins
call plug#begin()
" {{{2 Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
" }}}
" {{{2 Appearance
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'nightsense/cosmic_latte'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'
" }}}
" {{{2 Editor
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {
    \'branch': 'release'
\}
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" }}}
" {{{2 Session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
"Plug 'thaerkh/vim-workspace'
Plug 'mbbill/undotree'
" }}}
" {{{2 Misc
Plug 'wakatime/vim-wakatime'
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-go'}
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
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
" }}}
" {{{1 Tagbar
nmap <leader>tb :TagbarToggle<CR>
" }}}
" {{{1 coc.vim
" Plugins
let g:coc_global_extensions=['coc-rust-analyzer', 'coc-json', 'coc-lists', 'coc-snippets', 'coc-git',
    \ 'coc-go', 'coc-yaml', 'coc-tsserver', 'coc-yank', 'coc-db', 'coc-eslint', 'coc-pairs', 'coc-prettier',
    \ 'coc-vimlsp', 'coc-actions', 'coc-github', 'coc-omnisharp', 'coc-xml']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" Use tab to expand, <C-n> next suggestion, <C-p> previous suggestion.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

" Use tab and shift-tab to navigate placeholder.
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <CR> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <CR>
        \ complete_info()["selected"] != "-1" ?
        \ "\<C-y>" :
        \ "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Navigate diagnostics
nmap <silent> <leader>ne <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>pe <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>F :Format<CR>
xnoremap <leader>F :Format<CR>

" Applying codeAction to the selected region.
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of selected region to coc-actins
" Example:
"<leader>a for the current selected range
"<leader>aw for the current word
"<leader>aas for the current sentence
"<leader>aap for the current paragraph
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList -A diagnostics<CR>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Search buffers.
nnoremap <silent> <space>b  :<C-u>CocList buffers<CR>
" Search for files in project directory.
nnoremap <silent> <expr> <space>f  (expand('%') =~# 'NERD_tree' ? "\<c-w>\<c-w>" : '').":<C-u>CocList files<CR>"
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Enable/Disable if you want to debug using chrome/chromium DevTools.
nnoremap <leader>ect :call ChromeDevTools(1)<CR>
nnoremap <leader>dct :call ChromeDevTools(0)<CR>

" }}}
" {{{1 lightline
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitstatus', ],
  \     [ 'diagnostics2', 'filename', ],
  \     [ 'modified', ],
  \   ],
  \   'right':[
  \     [ 'lineinfo', 'percent'],
  \     [ 'obsession', 'filetype', 'fileencoding', 'shiftwidth', ],
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
  \   'obsession': 'ObsessionStatus',
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
" {{{1 vim-prosession
let g:prosession_dir = $HOME . '/.nvim/session'
" }}}
" {{{1 vim-workspace
nnoremap <leader>s :ToggleWorkspace<CR>
" enabled = 1 (default), disabled = 0
let g:workspace_create_new_tabs = 1
" default session name
let g:workspace_session_name = 'Session.nvim'
" session storage location
let g:workspace_session_directory = $HOME . '/.nvim/sessions/'
" disable workspace session if opening a file, i.e. nvim file.type
let g:workspace_session_disable_on_args = 1
" enabled = 1 (default), disabled = 0
let g:workspace_persist_undo_history = 1
" undodir location. These will be deleted on restart.
let g:workspace_undodir='/tmp/.nvim-undo-dir'
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
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"let g:go_gopls_enabled=0
" }}}
" {{{1 vimspector
let g:vimspector_enable_mappings = 'HUMAN'
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

function! ChromeDevTools(enabled) abort
    if a:enabled
        let g:coc_node_args = ['--nolazy', '--inspect=6045']
    else
        let g:coc_node_args = []
    endif

    execute "CocRestart"
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
" }}}
