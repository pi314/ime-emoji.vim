let s:table = {}
let s:prefixes = []


function! ime_emoji#handler (matchobj, trigger)
    if s:table == {}
        let s:table = ime_emoji_table#table()
        let l:tmp_dict = {}
        for l:alpha_code in keys(s:table)
            let l:tmp_dict[(l:alpha_code[:1])] = ''
        endfor

        let s:prefixes = sort(keys(l:tmp_dict))
        call map(s:prefixes, '{"word": v:val, "menu": "..."}')
        let s:prefixes = [': '] + s:prefixes
    endif

    let l:emoji_str = a:matchobj[0]
    if l:emoji_str == ':'
        " Only a comma?
        return s:prefixes

    elseif l:emoji_str[0] ==# ':' && l:emoji_str[-1:] ==# ':'
        " A completed emoji alpha code
        if has_key(s:table, l:emoji_str)
            return [s:table[(l:emoji_str)]]
        endif

    else
        " An incomplete emoju alpha code
        let l:candidates = []
        for [l:alpha_code, l:emoji] in items(s:table)
            if strpart(l:alpha_code, 0, strlen(l:emoji_str)) ==# l:emoji_str
                call add(l:candidates, {'word': l:alpha_code, 'menu': l:emoji})
            endif
        endfor
        if len(l:candidates)
            call sort(l:candidates)
            return l:candidates
        endif

    endif

    return []
endfunction


function! ime_emoji#info ()
    return {
    \ 'type': 'embedded',
    \ 'pattern': '\v:([0-9a-z_+-]+:?)?$',
    \ 'handler': function('ime_emoji#handler'),
    \ 'trigger': [' '],
    \ }
endfunction
