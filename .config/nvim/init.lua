vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()
vim.cmd('source ~/.vimrc')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
vim.keymap.set("n", "<leader>a", ":AvanteToggle<CR>", { desc = "Toggle Avante" })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require('autocommands')

vim.api.nvim_set_hl(0, 'TabLineSel', { fg = 'white', bg = 'black', bold = true })
vim.api.nvim_create_autocmd({"ColorScheme", "VimEnter"}, {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, 'Visual', { ctermfg = 81, ctermbg = 235, fg = '#00D7FF', bg = '#262626', bold = true })
        vim.api.nvim_set_hl(0, 'search', { ctermfg = 81, ctermbg = 236, fg = '#00D7FF', bg = '#303030' })
        vim.api.nvim_set_hl(0, 'IncSearch', { ctermfg = 81, ctermbg = 236, fg = '#00D7FF', bg = '#303030', underline = true })
        vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'DarkGrey', fg = '#585858', bold = true })
        vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 235, bg = '#262626' })
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'black' })
        vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'white', bg = 'black', bold = true })
    end,
})
vim.api.nvim_set_hl(0, 'Visual', { ctermfg = 81, ctermbg = 235, fg = '#00D7FF', bg = '#262626', bold = true })
vim.api.nvim_set_hl(0, 'search', { ctermfg = 81, ctermbg = 236, fg = '#00D7FF', bg = '#303030' })
vim.api.nvim_set_hl(0, 'IncSearch', { ctermfg = 81, ctermbg = 236, fg = '#00D7FF', bg = '#303030', underline = true })
vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'DarkGrey', fg = '#585858', bold = true })
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 235, bg = '#262626' })
vim.api.nvim_set_hl(0, 'Normal', { bg = 'black' })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'white', bg = 'black', bold = true })

vim.o.mouse = ''
