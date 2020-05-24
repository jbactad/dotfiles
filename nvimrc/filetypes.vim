" ============================================================================
" Go
" ============================================================================
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWrite *.go :call DeleteTrailingWS()
" autocmd BufNewFile,BufRead *.go setlocal filetype=go
autocmd FileType go setlocal noexpandtab

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
autocmd BufWrite *.ts :call DeleteTrailingWS()
autocmd BufWrite *.tsx :call DeleteTrailingWS()
autocmd FileType typescript setlocal ts=2 sw=2 sts=2 et

" ============================================================================
" Javascript 
" ============================================================================
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.jsx :call DeleteTrailingWS()
autocmd FileType javascript setlocal ts=2 sw=2 sts=2 et


" ============================================================================
" Utility Functions. 
" ============================================================================
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
