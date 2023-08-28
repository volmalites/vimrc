set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require("plugins")

if&ft=='rs'
  lua require'lspconfig'.rust_analyzer.setup({})
else
  lua require("web")
endif

lua require("mason").setup()

set mouse =
augroup CustomVisualHighlight
  autocmd!
  autocmd ColorScheme * highlight Visual ctermfg=grey ctermbg=black
  autocmd ColorScheme * highlight search ctermfg=81 ctermbg=black
  autocmd VimEnter,ColorScheme * highlight IncSearch ctermfg=81 ctermbg=black
augroup END
highlight Visual ctermfg=grey ctermbg=black
hi search ctermfg=81 ctermbg=black
set tabline=%!v:lua.MyTabLine()
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " Get the buffer name of the tab
        let buflist = tabpagebuflist(i+1)
        let bufnr = buflist[tabpagewinnr(i+1) - 1]
        let bufname = bufname(bufnr)

        " Extract only the file name from the buffer name
        let filename = fnamemodify(bufname, ':t')

        " Build the tabline entry
        let s .= '%' . (i+1) . 'T'
        let s .= (i+1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let s .= ' ' . filename . ' '
    endfor
    return s
endfunction
