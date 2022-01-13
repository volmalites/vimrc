cnoremap w!! call SudoSaveFile()

function! SudoSaveFile() abort
    execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee sudo -e % >/dev/null'
    let &modified = v:shell_error
endfunction

command W w !sudo tee % > /dev/null

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch
set incsearch
set showmatch
set cursorline

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

syntax enable

set showtabline=1
set tabline=%!MyTabLine()
function! MyTabLine()
    let s = ''
    for t in range(tabpagenr('$'))
        " set highlight
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        let s .= t + 1 . ' '
        let n = ''
        let m = 0
        let bc = len(tabpagebuflist(t + 1))
        for b in tabpagebuflist(t + 1)
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        if m > 0
            let s .= '[' . m . '+]'
        endif
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " add buffer names
        if n == ''
            let s.= '[New]'
        else
            let s .= n
        endif
        let s .= ' '
    endfor
    let s .= '%#TabLineFill#%T'
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#%999Xclose'
    endif
    return s
endfunction

:set laststatus=2
:set statusline=[%n]\ %<%f%h%m

set background=dark
colorscheme delek
