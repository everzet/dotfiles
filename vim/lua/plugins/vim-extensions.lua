-- Plugins extanding default vim actions
return {

    -- Manipulate quotes and parens
    "tpope/vim-surround",

    -- Exchange two blocks of text
    "tommcdo/vim-exchange",

    -- Movements around comma-separated lists
    "austintaylor/vim-commaobject",

    -- Movements around html/xml tags
    { "whatyouhide/vim-textobj-xmlattr", dependencies = { "kana/vim-textobj-user" } },
}
