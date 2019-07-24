let s:dict =  {'n' : "%#ToolbarButton# NORMAL ",
            \ 'i' : "%#StatusLineTerm# INSERT ",
            \ 'v' : "%#Error# VISUAL ", "R" : "%#ToolbarButton# REPLACE "}

function! GetMode()
    return get(s:dict, mode(), "")
endfunction

function! RefreshStatus(timer)
    :redraws!
endfunction

function! GetTime()
    return strftime("%m/%d/%H:%M")
endfunction

function! JoinNames(dict)
    let s = ""
    for l in items(a:dict)
        let s .= (s == "") ? l[0] : "|" . l[0]
    endfor
    return s
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
function! StatuslineString()
    let s =  ""
    let s .= GetMode()
    let s .= "%#Conceal#"
    let s .= " %f "
    let s .= "%#PmenuSel#"
    let s .= "%="               " switch to right
    let s .= "%y "              " type of file
    let s .= "%m"               " modified
    let s .= " %4l,%-4c "       " line,column
    let s .= "%3p%% "           " percentage
    let s .= "%#Conceal# "      "  
    let s .= GetTime()          " time 
    let s .= " %#ToobarButton#  "
    let s .= GetStopwatchTime() " stopwatch 
    let s .= " "                " 
    let s .= "%#Error#%r"       " read only
    return s
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabline
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
                let tmpname = (tmpname == "") ? ("[No Name]") : (tmpname)
                if getbufvar(b, "&modified")
                    let tmpname .= "[+]"
                endif
                let namedict[tmpname] = 1
            elseif getbufvar(b, "&buftype") == "help"
                let tmpname = "[Help] " . fnamemodify(bufname(b), ':t:s/.txt$//')
                let namedict[tmpname] = 1
            endif
        endfor
        let s .= ' ' . JoinNames(namedict) . ' '
    endfor
    let s .=  "%#PmenuThumb#%T"
    return s
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stopwatch
let g:running = 0
let g:elapsed_time = 0
let g:saved_time = 0
let g:start_time = reltime()
function! NewStopwatchTimer()
    return timer_start(
                \ 50,
                \ 'RefreshStatus',{'repeat':-1})
endfunction

function! GetStopwatchTime()
    if g:running
        let g:elapsed_time =
                    \ g:saved_time +
                    \ reltimefloat(reltime(g:start_time))
    endif
    return printf("%.2f", g:elapsed_time)
endfunction

function! RunStopwatch()
    if g:running == 0
        let g:start_time = reltime()
        let g:running = 1
        let g:stopwatch_timer = NewStopwatchTimer()
    endif
endfunction

function! SplitStopwatch()
    echom GetStopwatchTime()
endfunction

function! StopStopwatch()
    if g:running == 1
        let g:running = 0
        let g:saved_time = g:elapsed_time
    endif
    if exists("g:stopwatch_timer")
        call timer_stop(g:stopwatch_timer)
    endif
endfunction

function! ResetStopwatch()
    let g:running = 0
    let g:elapsed_time = 0
    let g:saved_time = 0
    let g:start_time = reltime()
    if exists("g:stopwatch_timer")
        call timer_stop(g:stopwatch_timer)
    endif
endfunction

map tr :call RunStopwatch()<CR>
map tp :call SplitStopwatch()<CR>
map ts :call StopStopwatch()<CR>
map tt :call ResetStopwatch()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%!StatuslineString()
set tabline=%!TablineString()
let monoline_timer = timer_start(500, 'RefreshStatus', {'repeat': -1})
augroup monoline
    autocmd!
    autocmd VimEnter * :echom "monoline loaded"
augroup END
