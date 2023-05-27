require('kanagawa').setup({
    compile = false,
    undercurl = true,
    commentStyle = {
        italic = true,
    },
    functionStyle = { 
        italic = true,
        bold = true,
    },
    keywordStyle = { 
        italic = true,
    },
    statementSyle = {
        bold = true,
    },
    typeStyle = {},
    transparent = true,
    dimInactive = true,
    terminalColors = true,
    colors = {
        palette = {},
        theme = { 
            wave = {},
            lotus = {},
            dragon = {},
            all = {},
        },
    },

    theme = "wave",
    background = { 
        dark = "dragon",
        light = "lotus"
    }
})
