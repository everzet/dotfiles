-- Plugins extending default vim movements
return {
    -- Movements around comma-separated lists
    'austintaylor/vim-commaobject',
    -- Movements around html/xml tags
    { 'whatyouhide/vim-textobj-xmlattr',
        dependencies = { 'kana/vim-textobj-user' } }
}
