scriptencoding utf-8
if exists('g:logipair')
    finish
endif
let g:logipair = 1

if (exists('g:logipair_matches') && type(g:logipair_matches) == v:t_dict)
    let s:pair_match = g:logipair_matches
else
    let s:pair_match = {
        \ '{': '}',
        \ '[': ']',
        \ '(': ')'
    \}
endif

function! HandlePairExpansion(leftPair)
    let l:el = getline('.')[col('.')-1:]
    if (match(l:el, '^\s*\('.join(extend(values(s:pair_match), [',']), '\|').'\)') != -1)
        return a:leftPair."\<cr>".s:pair_match[a:leftPair]."\<esc>O"
    else
        return a:leftPair."\<cr>\<esc>o".s:pair_match[a:leftPair]."\<esc>-:call feedkeys('\<c-r>=col('$')==1?'cc':'i'\<cr>')\<cr>"
    endif
endfunction

for leftPair in keys(s:pair_match)
    exe "inoremap <silent> ".leftPair."<cr> <c-r>=HandlePairExpansion('".leftPair."')<cr>"
endfor
