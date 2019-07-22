let s:dict =  {'n' : "%#PmenuSel# NORMAL ",
            \ 'i' : "%#StatusLineTerm# INSERT ",
            \ 'v' : "%#Error# VISUAL ", "R" : "%#PmenuSel# REPLACE "}

function! GetMode()
    return get(s:dict, mode(), "")
endfunction

function! JoinNames(dict)
    let s = ""
    for l in items(a:dict)
        let s .= (s == "") ? l[0] : "|" . l[0]
    endfor
    return s
endfunction

function! StatuslineString()
    let s =  ""
    let s .= GetMode()
    let s .=  "%#Conceal#"
    let s .= " %f "
    let s .= "%#PmenuThumb#"
    let s .= "%="               " switch to right
    let s .= "%y "              " type of file
    let s .= "%m"               " modified
    let s .= "%4l,%-4c"         " line,column
    let s .= "%3p%% "           " percentage
    let s .= "%#Error#%r"       " read only
    return s
endfunction

function! TablineString()
    let s = ""
    for i in range(tabpagenr('$'))
        let page_number = i + 1
        let s .= (page_number == tabpagenr()) ? "%#Conceal#" : "%#PmenuThumb#"
        let s .= " " . page_number
        let namedict = {}
        for b in tabpagebuflist(page_number)
            if getbufvar(b, "&buftype") == "" && getbufvar(b, "&modifiable")
                let tmpname = bufname(b)
                if getbufvar(b, "&modified")
                    let tmpname .= "[+]"
                endif
                let namedict[tmpname] = 1
            elseif getbufvar(b, "&buftype") == "help"
                let tmpname = "[Help] " . fnamemodify(bufname(b), ':t:s/.txt$//')
                let namedict[tmpname] = 1
            endif
        endfor
        let name = empty(namedict) ? helpname : JoinNames(namedict)
        let s .= (name == '') ? " [No Name]" : " " . name
        let s .= ' '
    endfor
    let s .=  "%#PmenuThumb#%T"
    return s
endfunction

set laststatus=2
set statusline=%!StatuslineString()
set tabline=%!TablineString()

augroup monoline
    autocmd!
    autocmd VimEnter * :echom "monoline loaded"
augroup END
