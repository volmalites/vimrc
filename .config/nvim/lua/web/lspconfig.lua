local nvim_lsp = require('lspconfig')
local servers = { 'eslint', 'html', 'jsonls', 'cssls', 'tsserver' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {}
end
