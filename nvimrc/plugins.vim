"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
call plug#begin()

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'

" Appearance
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'nightsense/cosmic_latte'
Plug 'ryanoasis/vim-devicons'
"Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'NLKNguyen/papercolor-theme'

" Editor
Plug 'neoclide/coc.nvim', {
    \'branch': 'release',
    \'do': ':CocInstall coc-rust-analyzer coc-json coc-lists coc-snippets coc-git coc-go coc-yaml coc-tsserver coc-yank coc-db coc-highlight coc-eslint coc-pairs coc-prettier coc-vimlsp'
\}
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'


" Session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'mbbill/undotree'

" Misc
Plug 'wakatime/vim-wakatime'

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

"------------------------------------------------------------------------------
" NerdTree
"------------------------------------------------------------------------------
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


"------------------------------------------------------------------------------
" Tagbar
"------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>


"------------------------------------------------------------------------------
" coc.vim
"------------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" Use tab and shift-tab to navigate placeholder.
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-

" Use tab to expand, <C-n> next suggestion, <C-p> previous suggestion. 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <CR> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Navigate diagnostics
nmap <silent> <leader>n <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>p <Plug>(coc-diagnostic-next)

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>F :Format<CR>
xnoremap <leader>F :Format<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

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
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Search for files in project directory.
nnoremap <silent> <space>f  :<C-u>CocList files<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"------------------------------------------------------------------------------
" lightline
"------------------------------------------------------------------------------
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'diagnostic', 'cocstatus', 'filename', 'method', 'modified' ],
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'sw', 'percent', ],
  \     [ 'blame' ],
  \   ],
  \ },
  \ 'component_expand': {
  \    'noet': 'LightlineNoexpandtab',
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \   'cocstatus': 'coc#status',
  \   'sw': 'LightlineShiftwidth',
  \ },
  \ 'component_type': {
  \   },
\ }
function! LightlineShiftwidth() abort
    return &expandtab?'Space:'.&shiftwidth:'Tab:'.&tabstop
endfunction
function! LightlineGitBlame() abort
    let blame = get(b:, 'coc_git_blame', '')
    return winwidth(0) > 120 ? blame : ''
endfunction
function! LightlineCocStatus()
  return &tabstop
endfunction
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

"------------------------------------------------------------------------------
" undotree 
"------------------------------------------------------------------------------
nnoremap <leader>ut :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME.'/.vim/undodir' 
endif


"------------------------------------------------------------------------------
" coc-go 
"------------------------------------------------------------------------------
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
