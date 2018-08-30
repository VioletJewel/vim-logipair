scriptencoding utf-8
if exists('g:logipair')
    finish
endif
let g:logipair = 1

function! LogiPairCr()
    let l:cline = getline('.')
    let l:ccol = col('.')
    " char before cursor (maybe a left pair)
    let l:left_pair = l:cline[l:ccol-2]
    " pair matches based on &matchpairs
    let l:pair_matches = {}
    let l:mps = split(&matchpairs, ',')
    " sort &matchpairs into a dict in l:pair_matches
    for l:mp in l:mps
        let l:smp = split(l:mp, ':')
        let l:pair_matches[l:smp[0]] = l:smp[1]
    endfor
    " return <cr> if a left-pair not to left of cursor
    if !has_key(l:pair_matches, l:left_pair)
        return "\<cr>"
    endif
    let l:inside_pair = 0
    let l:line = l:cline[: l:ccol]
    let l:i = 0
    while (l:i < len(l:line))
        let l:ch = l:line[l:i]
        if has_key(l:pair_matches, l:ch)
            let l:inside_pair += 1
        elseif (index(values(l:pair_matches), l:ch) > -1)
            let l:inside_pair -= 1
        endif
        let l:i += 1
    endwhile
    if l:inside_pair
        return "\<cr>".l:pair_matches[l:left_pair]."\<esc>O"
    else
        return "\<cr>\<esc>o".l:pair_matches[l:left_pair]."\<esc>-:call feedkeys('\<c-r>=col('$')==1?'cc':'i'\<cr>')\<cr>"
    endif
endfunction

function! LogiPairTab()
    let l:cline = getline('.')
    let l:ccol = col('.')
    " char before cursor (maybe a left pair)
    let l:left_pair = l:cline[l:ccol-2]
    " pair matches based on &matchpairs
    let l:pair_matches = {}
    let l:mps = split(&matchpairs, ',')
    " sort &matchpairs into a dict in l:pair_matches
    for l:mp in l:mps
        let l:smp = split(l:mp, ':')
        let l:pair_matches[l:smp[0]] = l:smp[1]
    endfor
    " return <tab> if a left-pair not to left of cursor
    " otherwise, return the closing pair
    if has_key(l:pair_matches, l:left_pair)
        " if current char under cursor is closing pair, pad spaces
        " otherwise, add closing pair
        if (l:cline[l:ccol-1:] =~ '\s*'.l:pair_matches[l:left_pair])
            return "  \<left>"
        else
            return l:pair_matches[l:left_pair] . "\<left>"
        endif
    else
        return " "
    endif
endfunction

inoremap <expr> <silent> <cr> LogiPairCr()
inoremap <expr> <silent> <space> LogiPairTab()
