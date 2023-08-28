require'lspconfig'.pyright.setup{}
require('web.lspconfig')
require('web.ts')
require('web.rust')
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.o.tabline = [[%!v:lua.MyTabLine()]]
function MyTabLine()
    local s = ''
    for i=1,vim.fn.tabpagenr('$') do
        -- Get the buffer name of the tab
        local buflist = vim.fn.tabpagebuflist(i)
        local bufnr = buflist[vim.fn.tabpagewinnr(i)]
        local bufname = vim.fn.bufname(bufnr)

        -- Extract only the file name from the buffer name
        local filename = vim.fn.fnamemodify(bufname, ':t')

        -- Build the tabline entry
        s = s .. '%' .. i .. 'T'
        s = s .. (i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#')
        s = s .. ' ' .. filename .. ' '
    end
    return s
end
