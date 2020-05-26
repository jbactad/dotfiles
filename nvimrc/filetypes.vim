" ============================================================================
" Vim
" ============================================================================
autocmd BufWrite *.vim :call DeleteTrailingWS() |


" ============================================================================
" Go
" ============================================================================
augroup golang |
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport') |
autocmd BufWrite *.go :call DeleteTrailingWS() |
autocmd FileType go setlocal noexpandtab |
augroup END

" ============================================================================
" Python
" ============================================================================
autocmd BufWrite *.py :call DeleteTrailingWS()


" ============================================================================
" Rust
" ============================================================================
autocmd BufWrite *.rs :call DeleteTrailingWS()


" ============================================================================
" Typescript
" ============================================================================
augroup typescript |
autocmd BufWrite *.{tsx,ts} :call DeleteTrailingWS() |
autocmd BufRead,FileType typescript setlocal ts=2 sw=2 sts=2 et |
augroup END
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }


" ============================================================================
" Javascript
" ============================================================================
augroup javascript |
autocmd BufWrite *.{js,jsx} :call DeleteTrailingWS() |
autocmd BufRead,FileType javascript setlocal ts=2 sw=2 sts=2 et |
augroup END


" ============================================================================
" JSON
" ============================================================================
autocmd FileType json setlocal ts=2 sw=2 sts=2 et
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


" ============================================================================
" Utility Functions.
" ============================================================================
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
