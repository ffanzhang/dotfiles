let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20

function! MonoTree()
    execute "Vex"
    execute "wincmd l"
endfunction

if !&diff
    augroup monotree
        autocmd!
        autocmd VimEnter * call MonoTree() 
    augroup END
endif
