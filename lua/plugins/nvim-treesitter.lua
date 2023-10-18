local ok, tsitter = pcall(require, "nvim-treesitter.configs")

if not ok then 
    return
end

tsitter.setup({
    ensure_installed = { 
        "c",
        "cpp",
        "lua",
        "go",
        "rust",
        "bash",
        "query",
        "vim",
        "markdown",
        "toml",
        "json",
        "yaml",
        "javascript",
        "typescript",
        "java",
    },
    sync_install = false,
    auto_install = true,
    -- ignore_install = { "javascript" },

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    }
})
