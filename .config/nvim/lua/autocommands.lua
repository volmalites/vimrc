vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        require('lspconfig').rust_analyzer.setup({})
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "rust" then
            local ok, err = pcall(require, "web")
            if not ok then
                vim.notify("Failed to load web: " .. err, vim.log.levels.ERROR)
            end
        end
    end,
})
