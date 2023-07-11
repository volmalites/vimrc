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
