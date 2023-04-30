local dashboard = {}

dashboard.settings = {
    shortcuts = {
        {
            icon = "󰴠 ",
            desc = "Project structure      ",
            key = ", + e",
            action = "NvimTreeToggle",
        },
        {
            icon = "🔍 ",
            desc = "Find Files             ",
            key = ", + f",
            action = "Telescope find_files hidden=true",
        },
        {
            icon = "𝐓 ",
            desc = "Search Text            ",
            key = ", + s",
            action = "Telescope live_grep_args",
        },
        {
            icon = "✖ ",
            desc = "Exit               ",
            key = "Ctrl + q",
            action = "q",
        },
    },
    header = {
        "                                                                             ",
        "                                          ,.7ÑÑÑ@7.,,                        ",
        "                                       ,ÑÑÑÑÑÑ@@ÑÑÑÑÑÑ.,                     ",
        "                                ,,,,,,ÑÑÑ+++++++++++~ÑÑÑ.,                   ",
        "                            ,.ÑÑÑÑÑÑÑÑÑ7+++++++++++++++ÑÑÑ,                  ",
        "                          ,$ÑÑÑ~++++#Ñ++++++++++++++++++#ÑÑ,                 ",
        "                         ,ÑÑÑ+++++++ÑÑ+++++++++@Ñ~+++++++ÑÑ7,,.              ",
        "                        ,ÑÑ~++++++++ÑÑ~++++++++~ÑÑ+++++++~ÑÑÑÑÑÑ,,           ",
        "                        ,ÑÑ++++++++++ÑÑ++++++++~ÑÑ++++++++++++~ÑÑÑ.,         ",
        "                    ,,..$Ñ9++++++++++@ÑÑ~++++++ÑÑ=+++++++++++++++ÑÑÑ,        ",
        "                 ,,ÑÑÑÑÑÑÑ#+++++++++++~ÑÑÑÑÑÑÑÑÑ++++++++++++++++++ÑÑÑ,       ",
        "      ,ÑÑW,,    ,ÑÑÑ~++++++++++++++++++++++98~+++++++++++++++++++++ÑÑ,       ",
        "      ,ÑÑÑÑÑÑÑÑÑÑÑ~+++++++++++++++++++++++++++++++++++++++++++++++++ÑÑ,      ",
        "      ,ÑÑ+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ÑÑ,      ",
        "       ,ÑW++++++++++++++++++++++++++++++++++++++++++7ÑÑÑÑÑÑ+++++++++ÑÑ,      ",
        "       ,ÑÑ~++++++++++++++ÑÑÑ=++++++++++++++++++++++ÑÑÑ~++~++++++++++ÑÑ,      ",
        "        ,ÑÑ+++++++++++ÑÑÑÑÑÑÑÑÑ7++++++++++++++++++ÑÑÑ++++++++++++++~ÑÑ,      ",
        "         ,ÑÑ~+++++++~ÑÑ=++++++ÑÑ=+++++++++++++++++ÑÑ+++++++++++++++ÑÑ,       ",
        "          ,ÑÑÑ++++++ÑÑ~+++++++@ÑÑ+++++++++++++++++ÑÑ~+++++++++++++ÑÑ=        ",
        "           ..ÑÑÑÑÑÑÑÑÑ+++++++++~++++++++++++++++++WÑÑ+++++++++++7ÑÑ+         ",
        "              ,,~@ÑÑÑÑ+++++++++++++++++++++++++++++9ÑÑÑ~+++++~ÑÑÑÑ,          ",
        "                    .ÑÑ++++++++++++++7+++++++++++++++7ÑÑÑÑÑÑÑÑÑ,,            ",
        "                     -ÑÑ~+++++++++++ÑÑ~+++++++++++++~ÑÑ,.,,,.                ",
        "                      ,ÑÑÑÑW+~~+ÑÑÑÑÑÑÑÑ~+++++++++~ÑÑÑ,                      ",
        "                        ,,9ÑÑÑÑÑÑ7,,  ,ÑÑÑÑÑÑÑÑÑÑÑÑÑ,                        ",
        "                                        ,,.9ÑÑÑ7.,,                          ",
        "                                                                             ",
    },      
    footer  = { 
        "", 
        "",
        "\"Clean code always looks like it was written by someone who cares.\"", 
        "",
        "                                                - Robert C. Martin" 
    },
 }
 
require('dashboard').setup({
    theme = 'doom',
    config = {
        header = dashboard.settings.header,
        center = dashboard.settings.shortcuts,
        footer = dashboard.settings.footer,
    },
    hide = {},
    preview = {},
})
-- db.hide_statusline = true
-- db.hide_tabline = true
-- db.hide_winbar = true
-- db.custom_header = dashboard.settings.header
-- db.custom_center = dashboard.settings.shortcuts
-- db.custom_footer = dashboard.settings.footer
