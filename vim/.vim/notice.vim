" ============================================================
" notice.vim
"
" Mirror Vim messages into popup notifications.
"
" Put this file at:
"   ~/.vim/notice.vim
"
" Then add this to ~/.vimrc:
"   source ~/.vim/notice.vim
" ============================================================


" ------------------------------------------------------------
" Guard
" ------------------------------------------------------------

if exists('g:loaded_notice')
    finish
endif

let g:loaded_notice = 1


" ------------------------------------------------------------
" Requirements
" ------------------------------------------------------------

if !exists('*popup_notification')
    echohl ErrorMsg
    echomsg 'notice.vim requires popup_notification()'
    echohl None
    finish
endif

if !exists('*timer_start')
    echohl ErrorMsg
    echomsg 'notice.vim requires timer_start()'
    echohl None
    finish
endif


" ------------------------------------------------------------
" Configuration
" ------------------------------------------------------------

" Enable / disable notice.vim
if !exists('g:notice_enabled')
    let g:notice_enabled = 1
endif

" How often to check :messages, in milliseconds
if !exists('g:notice_interval')
    let g:notice_interval = 120
endif

" Normal notification timeout
if !exists('g:notice_timeout')
    let g:notice_timeout = 2200
endif

" Warning timeout
if !exists('g:notice_warn_timeout')
    let g:notice_warn_timeout = 3000
endif

" Error timeout
if !exists('g:notice_error_timeout')
    let g:notice_error_timeout = 4000
endif

" Popup width
if !exists('g:notice_minwidth')
    let g:notice_minwidth = 20
endif

if !exists('g:notice_maxwidth')
    let g:notice_maxwidth = 60
endif

" Prefix
if !exists('g:notice_info_prefix')
    let g:notice_info_prefix = ''
endif

if !exists('g:notice_warn_prefix')
    let g:notice_warn_prefix = '⚠ '
endif

if !exists('g:notice_error_prefix')
    let g:notice_error_prefix = '✗ '
endif


" ------------------------------------------------------------
" State
" ------------------------------------------------------------

let s:timer = -1
let s:last_messages = []


" ------------------------------------------------------------
" Message history
" ------------------------------------------------------------

function! s:GetMessages() abort
    try
        let l:output = execute('messages')
    catch
        return []
    endtry

    if empty(l:output)
        return []
    endif

    return split(l:output, "\n")
endfunction


" ------------------------------------------------------------
" Find newly-added messages
"
" Vim's message history has a maximum size.  Therefore simply
" comparing len(old) and len(new) is not sufficient.
"
" We search for the longest suffix of the previous history that
" matches the prefix of the current history.
" ------------------------------------------------------------

function! s:GetNewMessages(old, new) abort
    if empty(a:new)
        return []
    endif

    if empty(a:old)
        return []
    endif

    " Normal case: old history is an exact prefix of new history.
    if len(a:new) >= len(a:old)
        if a:new[0 : len(a:old) - 1] ==# a:old
            return a:new[len(a:old) :]
        endif
    endif

    " Message history may have dropped entries from the beginning.
    let l:max_overlap = min([len(a:old), len(a:new)])

    while l:max_overlap > 0
        let l:old_start = len(a:old) - l:max_overlap

        let l:old_tail = a:old[l:old_start :]
        let l:new_head = a:new[0 : l:max_overlap - 1]

        if l:old_tail ==# l:new_head
            return a:new[l:max_overlap :]
        endif

        let l:max_overlap -= 1
    endwhile

    " Could not determine a reliable overlap.
    "
    " Do not replay the whole :messages history.
    return []
endfunction


" ------------------------------------------------------------
" Message classification
" ------------------------------------------------------------

function! s:GetLevel(lines) abort
    for l:line in a:lines
        " Vim error messages:
        " E117: Unknown function...
        " E492: Not an editor command...
        if l:line =~# '^\s*E\d\+:'
            return 'error'
        endif

        if l:line =~# '^Error detected '
            return 'error'
        endif

        if !empty(v:errmsg) && stridx(l:line, v:errmsg) >= 0
            return 'error'
        endif
    endfor

    for l:line in a:lines
        if l:line =~# '^\s*W\d\+:'
            return 'warn'
        endif

        if !empty(v:warningmsg) && stridx(l:line, v:warningmsg) >= 0
            return 'warn'
        endif
    endfor

    return 'info'
endfunction


" ------------------------------------------------------------
" Popup
" ------------------------------------------------------------

function! s:Show(lines, level) abort
    if empty(a:lines)
        return
    endif

    let l:message = join(a:lines, "\n")

    if a:level ==# 'error'
        let l:prefix = g:notice_error_prefix
        let l:highlight = 'ErrorMsg'
        let l:timeout = g:notice_error_timeout

    elseif a:level ==# 'warn'
        let l:prefix = g:notice_warn_prefix
        let l:highlight = 'WarningMsg'
        let l:timeout = g:notice_warn_timeout

    else
        let l:prefix = g:notice_info_prefix
        let l:highlight = 'Pmenu'
        let l:timeout = g:notice_timeout
    endif

    " Prefix only the first line.
    let l:message = l:prefix . l:message

    let l:id = popup_create(
    \ l:message,
    \ #{
        \ pos: 'topleft',
        \ line: 1,
        \ col: max([1, &columns - g:notice_maxwidth - 2]),
        \ time: l:timeout,
        \ minwidth: g:notice_minwidth,
        \ maxwidth: g:notice_maxwidth,
        \ highlight: l:highlight,
        \ padding: [0, 1, 0, 1],
        \ border: [1, 1, 1, 1],
        \ borderhighlight: ['NoticeBorder'],
        \ scrollbar: 0,
        \ wrap: 1,
        \ zindex: 300,
        \ }
    \ )   


endfunction


" ------------------------------------------------------------
" Poll :messages
" ------------------------------------------------------------

function! s:Poll(timer) abort
    if !g:notice_enabled
        return
    endif

    let l:messages = s:GetMessages()

    if empty(s:last_messages)
        let s:last_messages = l:messages
        return
    endif

    let l:new_messages =
        \ s:GetNewMessages(s:last_messages, l:messages)

    let s:last_messages = l:messages

    if empty(l:new_messages)
        return
    endif

    let l:level = s:GetLevel(l:new_messages)

    call s:Show(l:new_messages, l:level)
endfunction


" ------------------------------------------------------------
" Public functions
" ------------------------------------------------------------

function! NoticeShow(message) abort
    call s:Show([a:message], 'info')
endfunction


function! NoticeWarn(message) abort
    call s:Show([a:message], 'warn')
endfunction


function! NoticeError(message) abort
    call s:Show([a:message], 'error')
endfunction


function! NoticeEnable() abort
    let g:notice_enabled = 1

    " Re-sync so old messages are not replayed.
    let s:last_messages = s:GetMessages()
endfunction


function! NoticeDisable() abort
    let g:notice_enabled = 0
endfunction


function! NoticeToggle() abort
    if g:notice_enabled
        call NoticeDisable()
    else
        call NoticeEnable()
    endif
endfunction


" ------------------------------------------------------------
" Commands
" ------------------------------------------------------------

command! -nargs=+ Notice
    \ call NoticeShow(<q-args>)

command! -nargs=+ NoticeWarn
    \ call NoticeWarn(<q-args>)

command! -nargs=+ NoticeError
    \ call NoticeError(<q-args>)

command! NoticeEnable
    \ call NoticeEnable()

command! NoticeDisable
    \ call NoticeDisable()

command! NoticeToggle
    \ call NoticeToggle()


" ------------------------------------------------------------
" Start
" ------------------------------------------------------------

" Don't replay messages that existed before notice.vim loaded.
let s:last_messages = s:GetMessages()

let s:timer = timer_start(
    \ g:notice_interval,
    \ function('s:Poll'),
    \ #{repeat: -1}
    \ )
