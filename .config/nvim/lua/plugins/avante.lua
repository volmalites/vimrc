return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
        provider = "ollama",
        ollama = {
            endpoint = "http://192.168.1.125:11434", -- Direct Ollama endpoint
            model = "llama3:latest", -- Exact model name
        },
        behaviour = {
            auto_suggestions = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = true,
        },
        mappings = {
            ask = "<leader>aa",
            edit = "<leader>ae",
            refresh = "<leader>ar",
        },
        rag = {
            enabled = true,
            host_mount = vim.fn.expand("~"),
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            opts = { file_types = { "markdown", "Avante" } },
            ft = { "markdown", "Avante" },
        },
    },
}
