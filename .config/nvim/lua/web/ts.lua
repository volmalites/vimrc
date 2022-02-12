require('nvim-treesitter.configs').setup({
  ensure_installed = "all",

  highlight = {
    enable = true,
    custom_captures = {
      -- ["<capture group>"] = "<highlight group>",
      -- ["keyword"] = "TSString",
    },
  },

  incremantal_selection = {
    enable = true,
    keymap = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },
})

vim.api.nvim_exec([[
  set foldmethod=expr
  set foldexpr=nvim-treesitter#foldexpr()
]], true)
