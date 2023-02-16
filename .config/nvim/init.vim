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
