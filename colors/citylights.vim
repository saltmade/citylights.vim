" Name:     Citylights vim colorscheme
" Author:   Jeff Heaton <jeff@jgheaton.com>
            (adapted from Yummygum's citylights <citylights.xyz>)
" URL:      http://github.com/jefheaton/citylights.vim
" License:  OSI approved MIT license (see end of this file)
" Created:  In neon dreams
" Modified: 2019 Jan 05
"
" TODO add citylights icon support via https://github.com/ryanoasis/vim-devicons

" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" Download palettes and files from: http://ethanschoonover.com/solarized
"
" Hex values are canonical at the moment (because it's what's provided by YG)
" TODO change canonical values to L\*a\*b (White D65, Reference 50)
" Colors are appended lt for light and dk for dark. See readme for visuals.
"
" CITYLIGHTS HEX      XTERM/HEX   HSB         NAME*
" ---------- -------  ----------- ----------- ----------
" base03     #1D252C  235 #262626 208  34  17 black
" base02     #333F4A  237 #3a3a3a 201  21  29 brblack
" base01     #41505E  239 #4e4e4e 209  31  37
" base00     #B7C5D3  251 #c6c6c6 210  13  83 brwhite
" base0      #718CA1   67 #808080 206  30  63 white
" cyanlt     #70E1E8   80 #5fd7d7 184  52  91 brcyan
" cyan       #33CED8   37 #00afaf 184  76  85
" cyandk     #008B94   30 #008787 184 100  58 cyan
" bluelt     #5EC4FF   81 #0087ff 202  63 100 brblue
" blue       #68A1F0   75 #0087ff 215  57  94
" bluedk     #539AFC   69 #0087ff 215  67  99 blue
" redlt      #E27E8D  174 #af005f 331  44  89
" red        #D95468  167 #af005f 351  61  85 red
" reddk      #B62D65  125 #af005f 335  75  71
" orangelt   #EBBF83  216 #d75f00  35  44  92 brcyan
" orangedk   #D98E48  173 #d75f00  29  67  85 yellow
" green      #8BD49C  115 #5f8700 134  34  83 green

" *these are the names of the first 16 ANSI colors terminals allow you to change

" Colorscheme initialization
" " ---------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "citylights"

" GUI & CSApprox hexadecimal palettes
" ---------------------------------------------------------------------
"
" Set both gui and terminal color values in separate conditional statements
" Due to possibility that CSApprox is running
let s:none = "NONE"

" Prefer neovim termguicolors, but support gui_running
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let s:vmode = "gui"
  let s:base03    = "#1D252C"
  let s:base02    = "#333F4A"
  let s:base01    = "#41505E"
  let s:base00    = "#B7C5D3"
  let s:base0     = "#718CA1"
  let s:cyanlt    = "#70E1E8"
  let s:cyan      = "#33CED8"
  let s:cyandk    = "#008B94"
  let s:bluelt    = "#5EC4FF"
  let s:blue      = "#68A1F0"
  let s:bluedk    = "#539AFC"
  let s:redlt     = "#E27E8D"
  let s:red       = "#D95468"
  let s:reddk     = "#B62D65"
  let s:orangelt  = "#EBBF83"
  let s:orangedk  = "#D98E48"
  let s:green     = "#8BD49C"
else " 256 xterm colors as backup
  let s:vmode     = "cterm"
  let s:base03    = "235"
  let s:base02    = "237"
  let s:base01    = "239"
  let s:base00    = "251"
  let s:base0     = "67"
  let s:cyanlt    = "80"
  let s:cyan      = "37"
  let s:cyandk    = "30"
  let s:bluelt    = "81"
  let s:blue      = "75"
  let s:bluedk    = "69"
  let s:redlt     = "174"
  let s:red       = "167"
  let s:reddk     = "125"
  let s:orangelt  = "216"
  let s:orangedk  = "173"
  let s:green     = "115"
endif

" Neovim terminal colours
if has("nvim")
  let g:terminal_color_0 =  "#1D252C" " black
  let g:terminal_color_1 =  "#D95468" " red
  let g:terminal_color_2 =  "#8BD49C" " green
  let g:terminal_color_3 =  "#D98E48" " yellow
  let g:terminal_color_4 =  "#539AFC" " blue
  let g:terminal_color_5 =  "#B62D65" " magenta
  let g:terminal_color_6 =  "#008B94" " cyan
  let g:terminal_color_7 =  "#718CA1" " white
  let g:terminal_color_8 =  "#333F4A" " brblack
  let g:terminal_color_9 =  "#D95468" " brred
  let g:terminal_color_10 = "#8BD49C" " brgreen
  let g:terminal_color_11 = "#EBBF83" " bryellow
  let g:terminal_color_12 = "#5EC4FF" " brblue
  let g:terminal_color_13 = "#B62D65" " brmagenta
  let g:terminal_color_14 = "#70E1E8" " brcyan
  let g:terminal_color_15 = "#B7C5D3" " brwhite
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_15
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_15
    let g:terminal_color_foreground = g:terminal_color_8
  endif
elseif has('terminal')
  let g:terminal_ansi_colors = [
        \"#1D252C",
        \"#D95468",
        \"#8BD49C",
        \"#D98E48",
        \"#539AFC",
        \"#B62D65",
        \"#008B94",
        \"#718CA1",
        \"#333F4A",
        \"#D95468",
        \"#8BD49C",
        \"#EBBF83",
        \"#5EC4FF",
        \"#B62D65",
        \"#70E1E8",
        \"#B7C5D3",
        \ ]
endif

" Formatting options and null values for passthrough effect "
" ---------------------------------------------------------------------
    let s:none            = "NONE"
    let s:t_none          = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"

" Highlighting primitives"
" TODO convert primitives to color
" You'll note the use of exe in this section to use all the variables
" we've developed
" ---------------------------------------------------------------------
exe "let s:bg_none      = ' ".s:vmode."bg=".s:none    ."'"
exe "let s:bg_back      = ' ".s:vmode."bg=".s:back    ."'"
exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base03  ."'"
exe "let s:bg_base02    = ' ".s:vmode."bg=".s:base02  ."'"
exe "let s:bg_base01    = ' ".s:vmode."bg=".s:base01  ."'"
exe "let s:bg_base00    = ' ".s:vmode."bg=".s:base00  ."'"
exe "let s:bg_base0     = ' ".s:vmode."bg=".s:base0   ."'"
exe "let s:bg_cyanlt    = ' ".s:vmode."bg=".s:cyanlt  ."'"
exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:cyan    ."'"
exe "let s:bg_cyandk    = ' ".s:vmode."bg=".s:cyandk  ."'"
exe "let s:bg_bluelt    = ' ".s:vmode."bg=".s:bluelt  ."'"
exe "let s:bg_blue      = ' ".s:vmode."bg=".s:blue    ."'"
exe "let s:bg_bluedk    = ' ".s:vmode."bg=".s:bluedk  ."'"
exe "let s:bg_redlt     = ' ".s:vmode."bg=".s:redlt   ."'"
exe "let s:bg_red       = ' ".s:vmode."bg=".s:red     ."'"
exe "let s:bg_reddk     = ' ".s:vmode."bg=".s:reddk   ."'"
exe "let s:bg_orangelt  = ' ".s:vmode."bg=".s:orangelt."'"
exe "let s:bg_orangedk  = ' ".s:vmode."bg=".s:orangedk."'"
exe "let s:bg_green     = ' ".s:vmode."bg=".s:green   ."'"

exe "let s:fg_none      = ' ".s:vmode."fg=".s:none    ."'"
exe "let s:fg_back      = ' ".s:vmode."fg=".s:back    ."'"
exe "let s:fg_base03    = ' ".s:vmode."fg=".s:base03  ."'"
exe "let s:fg_base02    = ' ".s:vmode."fg=".s:base02  ."'"
exe "let s:fg_base01    = ' ".s:vmode."fg=".s:base01  ."'"
exe "let s:fg_base00    = ' ".s:vmode."fg=".s:base00  ."'"
exe "let s:fg_base0     = ' ".s:vmode."fg=".s:base0   ."'"
exe "let s:fg_cyanlt    = ' ".s:vmode."fg=".s:cyanlt  ."'"
exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:cyan    ."'"
exe "let s:fg_cyandk    = ' ".s:vmode."fg=".s:cyandk  ."'"
exe "let s:fg_bluelt    = ' ".s:vmode."fg=".s:bluelt  ."'"
exe "let s:fg_blue      = ' ".s:vmode."fg=".s:blue    ."'"
exe "let s:fg_bluedk    = ' ".s:vmode."fg=".s:bluedk  ."'"
exe "let s:fg_redlt     = ' ".s:vmode."fg=".s:redlt   ."'"
exe "let s:fg_red       = ' ".s:vmode."fg=".s:red     ."'"
exe "let s:fg_reddk     = ' ".s:vmode."fg=".s:reddk   ."'"
exe "let s:fg_orangelt  = ' ".s:vmode."fg=".s:orangelt."'"
exe "let s:fg_orangedk  = ' ".s:vmode."fg=".s:orangedk."'"
exe "let s:fg_green     = ' ".s:vmode."fg=".s:green   ."'"

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.s:i.  " term=NONE".s:b.s:i."'"
exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.s:i.  " term=NONE".s:u.s:i."'"
exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
exe "let s:fmt_ital     = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i."'"
exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"
exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
exe "let s:fmt_revb     = ' ".s:vmode."=NONE".s:r.s:b. " term=NONE".s:r.s:b."'"

if has("gui_running")
  exe "let s:sp_none      = ' guisp=".s:none     ."'"
  exe "let s:sp_back      = ' guisp=".s:back     ."'"
  exe "let s:sp_base03    = ' guisp=".s:base03   ."'"
  exe "let s:sp_base02    = ' guisp=".s:base02   ."'"
  exe "let s:sp_base01    = ' guisp=".s:base01   ."'"
  exe "let s:sp_base00    = ' guisp=".s:base00   ."'"
  exe "let s:sp_base0     = ' guisp=".s:base0    ."'"
  exe "let s:sp_cyanlt    = ' guisp=".s:cyanlt   ."'"
  exe "let s:sp_cyan      = ' guisp=".s:cyan     ."'"
  exe "let s:sp_cyandk    = ' guisp=".s:cyandk   ."'"
  exe "let s:sp_bluelt    = ' guisp=".s:bluelt   ."'"
  exe "let s:sp_blue      = ' guisp=".s:blue     ."'"
  exe "let s:sp_bluedk    = ' guisp=".s:bluedk   ."'"
  exe "let s:sp_redlt     = ' guisp=".s:redlt    ."'"
  exe "let s:sp_red       = ' guisp=".s:red      ."'"
  exe "let s:sp_reddk     = ' guisp=".s:reddk    ."'"
  exe "let s:sp_orangelt  = ' guisp=".s:orangelt ."'"
  exe "let s:sp_orangedk  = ' guisp=".s:orangedk ."'"
  exe "let s:sp_green     = ' guisp=".s:green    ."'"
else
  let s:sp_none      = ""
  let s:sp_back      = ""
  let s:sp_base03    = ""
  let s:sp_base02    = ""
  let s:sp_base01    = ""
  let s:sp_base00    = ""
  let s:sp_base0     = ""
  let s:sp_cyanlt    = ""
  let s:sp_cyan      = ""
  let s:sp_cyandk    = ""
  let s:sp_bluelt    = ""
  let s:sp_blue      = ""
  let s:sp_bluedk    = ""
  let s:sp_redlt     = ""
  let s:sp_red       = ""
  let s:sp_reddk     = ""
  let s:sp_orangelt  = ""
  let s:sp_orangedk  = ""
  let s:sp_green     = ""
endif

" Basic highlighting"{{{
" TODO match highlighting to Agreco's conversion
" ---------------------------------------------------------------------
" note that link syntax, to avoid duplicate configuration, doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none   .s:fg_none   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none   .s:fg_cyandk   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none   .s:fg_bluelt  .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_bluelt .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_none .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_base0    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_undr   .s:fg_none .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_curl   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_revb   .s:fg_base_01 .s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}

" Extended highlighting "{{{
" ---------------------------------------------------------------------
"  TODO Missing or Noncanonical: SpecialKey, Nontext, Statusline, ErrorMsg, MoreMsg, Modemsg, LineNr, Question, VertSplit, VerticalNOS, WarningMsg, WildMenu, FoldColumn, SignColumn, Conceal, Spell*, PmenuSel, PmenuSBar, PmenuThumb, Tab*, Cursor*, ColorColumn,
exe "hi! SpecialKey"     .s:fmt_none   .s:fg_base01 .s:bg_none
exe "hi! NonText"        .s:fmt_none   .s:fg_base01 .s:bg_none
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base0  .s:bg_base02 .s:fmt_revbb
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base0 .s:bg_base02 .s:fmt_none
exe "hi! Visual"         .s:fmt_none   .s:fg_none   .s:bg_base02 .s:fmt_none
exe "hi! Directory"      .s:fmt_none   .s:fg_green  .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_redlt  .s:bg_red
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_base03 .s:bg_bluedk
exe "hi! Search"         .s:fmt_undr   .s:fg_none .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
if ( has("gui_running") || &t_Co > 8 )
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_base00
else
    exe "hi! VertSplit"  .s:fmt_revbb  .s:fg_base00 .s:bg_base02
endif
exe "hi! Title"          .s:fmt_bold   .s:fg_base0 .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revbb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revbb
exe "hi! Folded"         .s:fmt_undb   .s:fg_base01  .s:bg_base02  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_base01  .s:bg_none
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_reddk   .s:bg_none
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_base01  .s:bg_none
exe "hi! DiffText"       .s:fmt_bold   .s:fg_base01  .s:bg_none
exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_none   .s:bg_none
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_none   .s:bg_base2   .s:fmt_revbb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revbb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revbb
exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_base01 .s:bg_base2   .s:sp_base0  .s:fmt_revbbu
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_bluedk
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_undr   .s:fg_bluelt    .s:bg_none

"}}}
" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
"exe "hi! vimLineComment" . s:fg_base01 .s:bg_none   .s:fmt_ital
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe "hi! vimCommentString"  .s:fmt_none    .s:fg_violet .s:bg_none
exe "hi! vimCommand"        .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimCmdSep"         .s:fmt_bold    .s:fg_blue   .s:bg_none
exe "hi! helpExample"       .s:fmt_none    .s:fg_base1  .s:bg_none
exe "hi! helpOption"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! helpNote"          .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpVim"           .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpHyperTextJump" .s:fmt_undr    .s:fg_blue   .s:bg_none
exe "hi! helpHyperTextEntry".s:fmt_none    .s:fg_green  .s:bg_none
exe "hi! vimIsCommand"      .s:fmt_none    .s:fg_base00 .s:bg_none
exe "hi! vimSynMtchOpt"     .s:fmt_none    .s:fg_yellow .s:bg_none
exe "hi! vimSynType"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! vimHiLink"         .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimHiGroup"        .s:fmt_none    .s:fg_blue   .s:bg_none
exe "hi! vimGroup"          .s:fmt_undb    .s:fg_blue   .s:bg_none
"}}}
" diff highlighting "{{{
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Identifier
"}}}
" git & gitcommit highlighting "{{{
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"      
exe "hi! gitcommitComment"      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"     .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitOnBranch"     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe "hi! gitcommitBranch"       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:fmt_none     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedType" .s:fmt_none     .s:fg_green     .s:bg_none
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"       .s:fmt_none     .s:fg_base01    .s:bg_none
exe "hi! gitcommitUntrackedFile".s:fmt_bold     .s:fg_cyan      .s:bg_none
exe "hi! gitcommitDiscardedFile".s:fmt_bold     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedFile" .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitUnmergedFile" .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe "hi! gitcommitFile"         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
" html highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! htmlTag"           .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlEndTag"        .s:fmt_none .s:fg_base01 .s:bg_none
exe "hi! htmlTagN"          .s:fmt_bold .s:fg_base1  .s:bg_none
exe "hi! htmlTagName"       .s:fmt_bold .s:fg_blue   .s:bg_none
exe "hi! htmlSpecialTagName".s:fmt_ital .s:fg_blue   .s:bg_none
exe "hi! htmlArg"           .s:fmt_none .s:fg_base00 .s:bg_none
exe "hi! javaScript"        .s:fmt_none .s:fg_yellow .s:bg_none
"}}}
" TODO Python
" TODO HBS for ember
" TODO CSS
" TODO Sass
" TODO Yaml
" TODO Helm Charts
" TODO ZSH/bash

" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
exe "hi! pandocTitleBlock"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocTitleBlockTitle"          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocTitleComment"             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocComment"                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe "hi! pandocVerbatimBlock"            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe "hi! pandocBlockQuote"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader1"        .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader2"        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader3"        .s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader4"        .s:fg_red    .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader5"        .s:fg_base0  .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader6"        .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocListMarker"               .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocListReference"            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe "hi! pandocDefinitionBlock"              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocDefinitionTerm"               .s:fg_pdef  .s:bg_none  .s:fmt_stnd
exe "hi! pandocDefinitionIndctr"             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocEmphasisDefinition"           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptDefinition"        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe "hi! pandocTable"                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocTableStructure"               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe "hi! pandocTableZebraLight"              .s:fg_ptable.s:bg_base03.s:fmt_none
exe "hi! pandocTableZebraDark"               .s:fg_ptable.s:bg_base02.s:fmt_none
exe "hi! pandocEmphasisTable"                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedTable"          .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisTable"          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedTable"    .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisTable"  .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeoutTable"               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineTable"          .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptTable"             .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptTable"               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe "hi! pandocHeading"                      .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocHeadingMarker"                .s:fg_yellow.s:bg_none.s:fmt_bold
exe "hi! pandocEmphasisHeading"              .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocEmphasisNestedHeading"        .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocStrongEmphasisNestedHeading"  .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisHeading".s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutHeading"             .s:fg_phead .s:bg_none.s:fmt_revr
exe "hi! pandocVerbatimInlineHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSuperscriptHeading"           .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSubscriptHeading"             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe "hi! pandocLinkDelim"                .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocLinkLabel"                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkText"                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe "hi! pandocLinkURL"                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkTitle"                .s:fg_base00 .s:bg_none   .s:fmt_undi
exe "hi! pandocLinkTitleDelim"           .s:fg_base01 .s:bg_none   .s:fmt_undi   .s:sp_base00
exe "hi! pandocLinkDefinition"           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe "hi! pandocLinkDefinitionID"         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocImageCaption"             .s:fg_violet .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnoteLink"             .s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! pandocFootnoteDefLink"          .s:fg_green  .s:bg_none   .s:fmt_bold
exe "hi! pandocFootnoteInline"           .s:fg_green  .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnote"                 .s:fg_green  .s:bg_none   .s:fmt_none
exe "hi! pandocCitationDelim"            .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitation"                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitationID"               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe "hi! pandocStyleDelim"               .s:fg_base01 .s:bg_none  .s:fmt_none
exe "hi! pandocEmphasis"                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNested"           .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasis"           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNested"     .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasis"   .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeout"                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInline"           .s:fg_yellow .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscript"              .s:fg_violet .s:bg_none  .s:fmt_none
exe "hi! pandocSubscript"                .s:fg_violet .s:bg_none  .s:fmt_none

exe "hi! pandocRule"                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocRuleLine"                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocEscapePair"               .s:fg_red    .s:bg_none  .s:fmt_bold
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocNonBreakingSpace"         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe "hi! pandocMetadataDelim"            .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadataKey"              .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

"}}}
