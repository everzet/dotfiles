vim_colors "mustango" do
    author "Konstantin Kudryashov (ever.zet@gmail.com)"
    notes  "256 colors version of mustang"

    reset      true
    background :dark

    CursorLine   "NONE",   "262626"
    CursorColumn "NONE",   "2d2d2d"
    ColorColumn  "NONE",   "262626"
    MatchParen   "000000", "ffffff"
    Pmenu        "ffffff", "444444"
    PmenuSel     "000000", "b1d631"

    Normal       "e2e2e5", "202020"
    Cursor       "000000", "b1d631"
    SpecialKey   "444444", "303030"
    NonText      "444444", "303030"
    LineNr       "444444", "262626"
    SignColumn   "444444", "262626"
    StatusLine   "d3d3d5", "444444"
    StatusLineNC "939393", "444444"
    VertSplit    "444444", "444444"
    Folded       "a0a8b0", "384048"
    Title        "f6f3e8", "NONE"
    Visual       "faf4c6", "3c414c"
    Search       "000000", "ff9800"

    Comment      "808080", "NONE",   :gui => "italic"
    Todo         "000000", "e6ea50", :gui => "italic"
    Boolean      "ff9800", "NONE"
    String       "b1d631", "NONE",   :gui => "italic"
    Identifier   "b1d631", "NONE"
    Function     "faf4c6", "NONE",   :gui => "bold"
    Type         "7e8aa2", "NONE"
    Statement    "7e8aa2", "NONE"
    Keyword      "ff9800", "NONE"
    Constant     "ff9800", "NONE"
    Number       "ff9800", "NONE"
    Special      "ff9800", "NONE"
    PreProc      "faf4c6", "NONE"

    pythonOperator   "7e8aa2", "NONE"
    EasyMotionTarget "b1d631", "202020"
    EasyMotionShade  "444444", "202020"
    LustySelected    "ff9800", "NONE"
    LustyDir         "b1d631", "NONE"
    Question         "ff9800", "NONE"
end
