" {{{1 Common
augroup all
    autocmd!
    autocmd User CocJumpPlaceholder if exists ("*CocActionAsync") | call CocActionAsync('showSignatureHelp')
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * if exists("*CocActionAsync") | call CocActionAsync('highlight')
augroup END
" }}}
" {{{1 Vim
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWrite *.vim call DeleteTrailingWS()
augroup END
" }}}
" {{{1 Golang
augroup golang
    autocmd!
    autocmd BufWritePre *.go if exists ("*CocAction") | call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufWrite *.go call DeleteTrailingWS()
    autocmd FileType go setlocal noexpandtab
augroup END
" }}}
" {{{1 Python
augroup python
    autocmd!
    autocmd BufWrite *.py call DeleteTrailingWS()
augroup END
" }}}
" {{{1 Rust
augroup rust
    autocmd!
    autocmd BufWrite *.rs call DeleteTrailingWS()
augroup END
" }}}
" {{{1 Typescript
augroup typescript
    autocmd!
    autocmd BufWrite *.{tsx,ts} call DeleteTrailingWS()
    autocmd FileType typescript setlocal ts=2 sw=2 sts=2 et
augroup END
let g:tagbar_type_typescript = {
    \ 'ctagstype' : 'typescript',
    \ 'kinds': [
        \ 'C:constants:0:1',
        \ 'G:generators:0:1',
        \ 'I:imports:0:1',
        \ 'T:types:0:1',
        \ 'c:classes:0:1',
        \ 'f:functions:0:',
        \ 'g:enums:0:1',
        \ 'i:interfaces:0:1',
        \ 'm:methods:0:1',
        \ 'n:modules:0:1',
        \ 'p:properties:0:1',
        \ 'v:variable:0:1',
    \ ],
    \ 'sort' : 0
\ }
" }}}
" {{{1 Javascript
augroup javascript
    autocmd!
    autocmd BufWrite *.{js,jsx} call DeleteTrailingWS()
    autocmd FileType javascript setlocal ts=2 sw=2 sts=2 et
augroup END
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'javascript',
    \ 'kinds': [
        \ 'C:constants:0:1',
        \ 'G:getters:0:1',
        \ 'S:setters:0:1',
        \ 'c:classes:0:1',
        \ 'f:functions:0:',
        \ 'g:generators:0:1',
        \ 'm:methods:0:1',
        \ 'p:properties:0:1',
        \ 'v:variable:0:1',
    \ ],
    \ 'sort' : 0
\ }
" }}}
" {{{1 JSON
augroup json
    autocmd!
    autocmd FileType json setlocal ts=2 sw=2 sts=2 et
augroup END
let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
        \ 'o:objects',
        \ 'a:arrays',
        \ 'n:numbers',
        \ 's:strings',
        \ 'b:booleans',
        \ 'z:nulls'
    \ ],
    \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
        \ 'array': 'a',
        \ 'number': 'n',
        \ 'string': 's',
        \ 'boolean': 'b',
        \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
        \ 'a': 'array',
        \ 'n': 'number',
        \ 's': 'string',
        \ 'b': 'boolean',
        \ 'z': 'null'
    \ },
    \ 'sort' : 0
\ }
" }}}
" {{{1 Utility Functions.
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
" }}}
