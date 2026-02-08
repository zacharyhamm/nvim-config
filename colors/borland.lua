-- Borland Turbo C++ DOS colorscheme for Neovim
-- Inspired by the classic Borland IDE with CGA 16-color palette

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "borland"
vim.o.termguicolors = true
vim.o.background = "dark"

-- CGA-inspired palette
local c = {
  bg        = "#0000AA", -- Blue (main background)
  bg_dark   = "#000080", -- Navy (cursorline, sidebars)
  bg_sel    = "#000055", -- Dark navy (visual selection)
  statusbar = "#00AAAA", -- Dark Cyan (status bar, Borland menu bar)
  fg        = "#FFFF55", -- Yellow (default text)
  keyword   = "#FFFFFF", -- White (keywords)
  func      = "#FF8800", -- Orange (functions)
  string    = "#55FFFF", -- Light Cyan (strings)
  comment   = "#AAAAAA", -- Light Gray (comments)
  number    = "#FF55FF", -- Light Magenta (numbers, booleans)
  operator  = "#AA5500", -- Brown (operators)
  preproc   = "#00AAAA", -- Dark Cyan (preprocessor, imports)
  escape    = "#00AAAA", -- Dark Cyan (string escapes)
  error     = "#FF5555", -- Light Red (errors)
  warning   = "#FF8800", -- Orange (warnings)
  muted     = "#AAAAAA", -- Light Gray (delimiters, inlay hints)
  very_muted = "#555555", -- Dark Gray (line numbers, indent guides)
  black     = "#000000", -- Black
  red       = "#AA0000", -- Dark Red
  green     = "#00AA00", -- Dark Green
  magenta   = "#AA00AA", -- Dark Magenta
}

-- Terminal colors (16-color mapping)
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.operator
vim.g.terminal_color_4  = c.bg
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.preproc
vim.g.terminal_color_7  = c.muted
vim.g.terminal_color_8  = c.very_muted
vim.g.terminal_color_9  = c.error
vim.g.terminal_color_10 = c.escape
vim.g.terminal_color_11 = c.fg
vim.g.terminal_color_12 = c.func
vim.g.terminal_color_13 = c.number
vim.g.terminal_color_14 = c.string
vim.g.terminal_color_15 = c.keyword

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ============================================================================
-- Core Editor
-- ============================================================================
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg_dark })
hi("FloatBorder",  { fg = c.muted, bg = c.bg_dark })
hi("FloatTitle",   { fg = c.keyword, bg = c.bg_dark, bold = true })
hi("Cursor",       { fg = c.bg, bg = c.fg })
hi("CursorLine",   { bg = c.bg_dark })
hi("CursorColumn", { bg = c.bg_dark })
hi("ColorColumn",  { bg = c.bg_dark })
hi("LineNr",       { fg = c.very_muted })
hi("CursorLineNr", { fg = c.fg, bold = true })
hi("SignColumn",   { fg = c.muted, bg = c.bg })
hi("VertSplit",    { fg = c.very_muted, bg = c.bg })
hi("WinSeparator", { fg = c.very_muted, bg = c.bg })
hi("Folded",       { fg = c.muted, bg = c.bg_dark })
hi("FoldColumn",   { fg = c.very_muted, bg = c.bg })
hi("NonText",      { fg = c.very_muted })
hi("SpecialKey",   { fg = c.very_muted })
hi("Whitespace",   { fg = c.very_muted })
hi("EndOfBuffer",  { fg = c.bg })

-- Search / selection
hi("Visual",       { bg = c.bg_sel })
hi("VisualNOS",    { bg = c.bg_sel })
hi("Search",       { fg = c.black, bg = c.fg })
hi("IncSearch",    { fg = c.black, bg = c.string })
hi("CurSearch",    { fg = c.black, bg = c.escape })
hi("Substitute",   { fg = c.black, bg = c.error })

-- Statusline / tabline
hi("StatusLine",   { fg = c.black, bg = c.statusbar })
hi("StatusLineNC", { fg = c.very_muted, bg = c.bg_dark })
hi("TabLine",      { fg = c.muted, bg = c.bg_dark })
hi("TabLineSel",   { fg = c.black, bg = c.statusbar, bold = true })
hi("TabLineFill",  { bg = c.bg_dark })
hi("WinBar",       { fg = c.fg, bg = c.bg, bold = true })
hi("WinBarNC",     { fg = c.muted, bg = c.bg })

-- Popup menu
hi("Pmenu",        { fg = c.fg, bg = c.bg_dark })
hi("PmenuSel",     { fg = c.black, bg = c.statusbar })
hi("PmenuSbar",    { bg = c.bg_dark })
hi("PmenuThumb",   { bg = c.very_muted })

-- Messages
hi("MsgArea",      { fg = c.fg })
hi("ModeMsg",      { fg = c.keyword, bold = true })
hi("MoreMsg",      { fg = c.escape })
hi("Question",     { fg = c.escape })
hi("ErrorMsg",     { fg = c.error, bold = true })
hi("WarningMsg",   { fg = c.warning, bold = true })

-- Diff
hi("DiffAdd",      { fg = c.escape, bg = "#002233" })
hi("DiffChange",   { fg = c.string, bg = "#000044" })
hi("DiffDelete",   { fg = c.error, bg = "#330000" })
hi("DiffText",     { fg = c.keyword, bg = "#000066", bold = true })

-- Spell
hi("SpellBad",     { sp = c.error, undercurl = true })
hi("SpellCap",     { sp = c.warning, undercurl = true })
hi("SpellRare",    { sp = c.number, undercurl = true })
hi("SpellLocal",   { sp = c.string, undercurl = true })

-- Misc
hi("Directory",    { fg = c.func, bold = true })
hi("Title",        { fg = c.keyword, bold = true })
hi("Conceal",      { fg = c.very_muted })
hi("MatchParen",   { fg = c.keyword, bg = c.bg_sel, bold = true })
hi("WildMenu",     { fg = c.black, bg = c.fg })

-- ============================================================================
-- Standard Syntax (`:h group-name`)
-- ============================================================================
hi("Comment",        { fg = c.comment, italic = true })

hi("Constant",       { fg = c.number })
hi("String",         { fg = c.string })
hi("Character",      { fg = c.string })
hi("Number",         { fg = c.number })
hi("Boolean",        { fg = c.number })
hi("Float",          { fg = c.number })

hi("Identifier",     { fg = c.fg })
hi("Function",       { fg = c.func, bold = true })

hi("Statement",      { fg = c.keyword, bold = true })
hi("Conditional",    { fg = c.keyword, bold = true })
hi("Repeat",         { fg = c.keyword, bold = true })
hi("Label",          { fg = c.keyword, bold = true })
hi("Operator",       { fg = c.operator })
hi("Keyword",        { fg = c.keyword, bold = true })
hi("Exception",      { fg = c.keyword, bold = true })

hi("PreProc",        { fg = c.preproc })
hi("Include",        { fg = c.preproc })
hi("Define",         { fg = c.preproc })
hi("Macro",          { fg = c.preproc })
hi("PreCondit",      { fg = c.preproc })

hi("Type",           { fg = c.fg })
hi("StorageClass",   { fg = c.keyword, bold = true })
hi("Structure",      { fg = c.fg })
hi("Typedef",        { fg = c.fg })

hi("Special",        { fg = c.escape })
hi("SpecialChar",    { fg = c.escape })
hi("Tag",            { fg = c.func })
hi("Delimiter",      { fg = c.muted })
hi("SpecialComment", { fg = c.comment, bold = true, italic = true })
hi("Debug",          { fg = c.error })

hi("Underlined",     { fg = c.func, underline = true })
hi("Ignore",         { fg = c.very_muted })
hi("Error",          { fg = c.error, bold = true })
hi("Todo",           { fg = c.black, bg = c.fg, bold = true })

-- ============================================================================
-- Treesitter Highlight Groups
-- ============================================================================

-- Identifiers
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.number })
hi("@variable.parameter",    { fg = c.fg, italic = true })
hi("@variable.member",       { fg = c.fg })

hi("@constant",              { fg = c.number })
hi("@constant.builtin",      { fg = c.number, bold = true })
hi("@constant.macro",        { fg = c.preproc })

hi("@module",                { fg = c.preproc })
hi("@label",                 { fg = c.keyword })

-- Literals
hi("@string",                { fg = c.string })
hi("@string.escape",         { fg = c.escape })
hi("@string.special",        { fg = c.escape })
hi("@string.regex",          { fg = c.escape })
hi("@string.documentation",  { fg = c.comment, italic = true })

hi("@character",             { fg = c.string })
hi("@character.special",     { fg = c.escape })

hi("@number",                { fg = c.number })
hi("@number.float",          { fg = c.number })
hi("@boolean",               { fg = c.number, bold = true })

-- Types
hi("@type",                  { fg = c.fg })
hi("@type.builtin",          { fg = c.fg, bold = true })
hi("@type.definition",       { fg = c.fg })
hi("@type.qualifier",        { fg = c.keyword, bold = true })

hi("@attribute",             { fg = c.preproc })
hi("@property",              { fg = c.fg })

-- Functions
hi("@function",              { fg = c.func, bold = true })
hi("@function.builtin",      { fg = c.func, bold = true })
hi("@function.call",         { fg = c.func })
hi("@function.macro",        { fg = c.preproc })
hi("@function.method",       { fg = c.func, bold = true })
hi("@function.method.call",  { fg = c.func })

hi("@constructor",           { fg = c.func, bold = true })

-- Keywords
hi("@keyword",               { fg = c.keyword, bold = true })
hi("@keyword.function",      { fg = c.keyword, bold = true })
hi("@keyword.operator",      { fg = c.keyword, bold = true })
hi("@keyword.return",        { fg = c.keyword, bold = true })
hi("@keyword.import",        { fg = c.preproc })
hi("@keyword.repeat",        { fg = c.keyword, bold = true })
hi("@keyword.conditional",   { fg = c.keyword, bold = true })
hi("@keyword.exception",     { fg = c.keyword, bold = true })
hi("@keyword.directive",     { fg = c.preproc })

-- Punctuation
hi("@punctuation.bracket",   { fg = c.muted })
hi("@punctuation.delimiter", { fg = c.muted })
hi("@punctuation.special",   { fg = c.escape })

-- Comments
hi("@comment",               { fg = c.comment, italic = true })
hi("@comment.documentation", { fg = c.comment, italic = true })
hi("@comment.todo",          { fg = c.black, bg = c.fg, bold = true })
hi("@comment.note",          { fg = c.black, bg = c.string, bold = true })
hi("@comment.warning",       { fg = c.black, bg = c.warning, bold = true })
hi("@comment.error",         { fg = c.black, bg = c.error, bold = true })

-- Markup
hi("@markup.heading",        { fg = c.keyword, bold = true })
hi("@markup.strong",         { bold = true })
hi("@markup.italic",         { italic = true })
hi("@markup.strikethrough",  { strikethrough = true })
hi("@markup.underline",      { underline = true })
hi("@markup.raw",            { fg = c.escape })
hi("@markup.link",           { fg = c.func, underline = true })
hi("@markup.link.url",       { fg = c.string, underline = true })
hi("@markup.list",           { fg = c.operator })

-- Tags (HTML/JSX)
hi("@tag",                   { fg = c.keyword, bold = true })
hi("@tag.attribute",         { fg = c.fg, italic = true })
hi("@tag.delimiter",         { fg = c.muted })

-- Operators
hi("@operator",              { fg = c.operator })

-- ============================================================================
-- LSP Semantic Tokens
-- ============================================================================
hi("@lsp.type.namespace",    { link = "@module" })
hi("@lsp.type.type",         { link = "@type" })
hi("@lsp.type.class",        { link = "@type" })
hi("@lsp.type.enum",         { link = "@type" })
hi("@lsp.type.interface",    { link = "@type" })
hi("@lsp.type.struct",       { link = "@type" })
hi("@lsp.type.parameter",    { link = "@variable.parameter" })
hi("@lsp.type.variable",     { link = "@variable" })
hi("@lsp.type.property",     { link = "@property" })
hi("@lsp.type.enumMember",   { link = "@constant" })
hi("@lsp.type.function",     { link = "@function" })
hi("@lsp.type.method",       { link = "@function.method" })
hi("@lsp.type.macro",        { link = "@function.macro" })
hi("@lsp.type.decorator",    { link = "@attribute" })

-- ============================================================================
-- LSP Diagnostics
-- ============================================================================
hi("DiagnosticError",            { fg = c.error })
hi("DiagnosticWarn",             { fg = c.warning })
hi("DiagnosticInfo",             { fg = c.string })
hi("DiagnosticHint",             { fg = c.muted })
hi("DiagnosticOk",               { fg = c.escape })

hi("DiagnosticUnderlineError",   { sp = c.error, undercurl = true })
hi("DiagnosticUnderlineWarn",    { sp = c.warning, undercurl = true })
hi("DiagnosticUnderlineInfo",    { sp = c.string, undercurl = true })
hi("DiagnosticUnderlineHint",    { sp = c.muted, undercurl = true })
hi("DiagnosticUnderlineOk",      { sp = c.escape, undercurl = true })

hi("DiagnosticVirtualTextError", { fg = c.error, bg = "#330000" })
hi("DiagnosticVirtualTextWarn",  { fg = c.warning, bg = "#332200" })
hi("DiagnosticVirtualTextInfo",  { fg = c.string, bg = "#002233" })
hi("DiagnosticVirtualTextHint",  { fg = c.muted, bg = c.bg_dark })
hi("DiagnosticVirtualTextOk",    { fg = c.escape, bg = "#002233" })

hi("DiagnosticSignError",        { fg = c.error })
hi("DiagnosticSignWarn",         { fg = c.warning })
hi("DiagnosticSignInfo",         { fg = c.string })
hi("DiagnosticSignHint",         { fg = c.muted })
hi("DiagnosticSignOk",           { fg = c.escape })

hi("LspReferenceText",          { bg = c.bg_sel })
hi("LspReferenceRead",          { bg = c.bg_sel })
hi("LspReferenceWrite",         { bg = c.bg_sel, bold = true })
hi("LspInlayHint",              { fg = c.muted, bg = c.bg_dark, italic = true })
hi("LspCodeLens",               { fg = c.very_muted })

-- ============================================================================
-- Plugin: GitSigns
-- ============================================================================
hi("GitSignsAdd",          { fg = c.escape })
hi("GitSignsChange",       { fg = c.string })
hi("GitSignsDelete",       { fg = c.error })
hi("GitSignsAddNr",        { fg = c.escape })
hi("GitSignsChangeNr",     { fg = c.string })
hi("GitSignsDeleteNr",     { fg = c.error })
hi("GitSignsAddLn",        { bg = "#002233" })
hi("GitSignsChangeLn",     { bg = "#000044" })
hi("GitSignsDeleteLn",     { bg = "#330000" })

-- ============================================================================
-- Plugin: Neo-tree
-- ============================================================================
hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeNormalNC",      { fg = c.fg, bg = c.bg_dark })
hi("NeoTreeDirectoryIcon", { fg = c.func })
hi("NeoTreeDirectoryName", { fg = c.func, bold = true })
hi("NeoTreeFileName",      { fg = c.fg })
hi("NeoTreeFileIcon",      { fg = c.muted })
hi("NeoTreeRootName",      { fg = c.keyword, bold = true })
hi("NeoTreeGitAdded",      { fg = c.escape })
hi("NeoTreeGitModified",   { fg = c.string })
hi("NeoTreeGitDeleted",    { fg = c.error })
hi("NeoTreeGitUntracked",  { fg = c.warning })
hi("NeoTreeIndentMarker",  { fg = c.very_muted })
hi("NeoTreeWinSeparator",  { fg = c.very_muted, bg = c.bg_dark })
hi("NeoTreeEndOfBuffer",   { fg = c.bg_dark })
hi("NeoTreeCursorLine",    { bg = c.bg })

-- ============================================================================
-- Plugin: nvim-cmp
-- ============================================================================
hi("CmpItemAbbr",              { fg = c.fg })
hi("CmpItemAbbrDeprecated",    { fg = c.very_muted, strikethrough = true })
hi("CmpItemAbbrMatch",         { fg = c.keyword, bold = true })
hi("CmpItemAbbrMatchFuzzy",    { fg = c.keyword, bold = true })
hi("CmpItemMenu",              { fg = c.muted })
hi("CmpItemKindDefault",       { fg = c.muted })
hi("CmpItemKindKeyword",       { fg = c.keyword })
hi("CmpItemKindVariable",      { fg = c.fg })
hi("CmpItemKindConstant",      { fg = c.number })
hi("CmpItemKindFunction",      { fg = c.func })
hi("CmpItemKindMethod",        { fg = c.func })
hi("CmpItemKindField",         { fg = c.fg })
hi("CmpItemKindProperty",      { fg = c.fg })
hi("CmpItemKindClass",         { fg = c.fg })
hi("CmpItemKindInterface",     { fg = c.fg })
hi("CmpItemKindStruct",        { fg = c.fg })
hi("CmpItemKindModule",        { fg = c.preproc })
hi("CmpItemKindSnippet",       { fg = c.escape })
hi("CmpItemKindText",          { fg = c.muted })
hi("CmpItemKindEnum",          { fg = c.fg })
hi("CmpItemKindEnumMember",    { fg = c.number })
hi("CmpItemKindOperator",      { fg = c.operator })
hi("CmpItemKindValue",         { fg = c.number })

-- ============================================================================
-- Plugin: indent-blankline
-- ============================================================================
hi("IblIndent",     { fg = c.very_muted })
hi("IblScope",      { fg = c.muted })
hi("IndentBlanklineChar",            { fg = c.very_muted })
hi("IndentBlanklineContextChar",     { fg = c.muted })
hi("IndentBlanklineSpaceChar",       { fg = c.very_muted })

-- ============================================================================
-- Plugin: which-key
-- ============================================================================
hi("WhichKey",          { fg = c.keyword, bold = true })
hi("WhichKeyGroup",     { fg = c.func })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeperator", { fg = c.muted })
hi("WhichKeySeparator", { fg = c.muted })
hi("WhichKeyFloat",     { bg = c.bg_dark })
hi("WhichKeyBorder",    { fg = c.muted, bg = c.bg_dark })
hi("WhichKeyValue",     { fg = c.muted })

-- ============================================================================
-- Plugin: mason
-- ============================================================================
hi("MasonNormal",             { fg = c.fg, bg = c.bg_dark })
hi("MasonHeader",             { fg = c.black, bg = c.statusbar, bold = true })
hi("MasonHeaderSecondary",    { fg = c.black, bg = c.fg, bold = true })
hi("MasonHighlight",          { fg = c.string })
hi("MasonHighlightBlock",     { fg = c.black, bg = c.string })
hi("MasonHighlightBlockBold", { fg = c.black, bg = c.string, bold = true })
hi("MasonMuted",              { fg = c.muted })
hi("MasonMutedBlock",         { fg = c.black, bg = c.very_muted })

-- ============================================================================
-- Plugin: Telescope
-- ============================================================================
hi("TelescopeNormal",         { fg = c.fg, bg = c.bg_dark })
hi("TelescopeBorder",         { fg = c.muted, bg = c.bg_dark })
hi("TelescopeTitle",          { fg = c.keyword, bg = c.bg_dark, bold = true })
hi("TelescopePromptNormal",   { fg = c.fg, bg = c.bg })
hi("TelescopePromptBorder",   { fg = c.muted, bg = c.bg })
hi("TelescopePromptTitle",    { fg = c.keyword, bg = c.bg, bold = true })
hi("TelescopePromptPrefix",   { fg = c.keyword })
hi("TelescopeSelection",      { bg = c.bg_sel })
hi("TelescopeSelectionCaret", { fg = c.keyword })
hi("TelescopeMatching",       { fg = c.keyword, bold = true })

-- ============================================================================
-- Lazy.nvim
-- ============================================================================
hi("LazyNormal",    { fg = c.fg, bg = c.bg_dark })
hi("LazyButton",    { fg = c.fg, bg = c.bg })
hi("LazyButtonActive", { fg = c.black, bg = c.statusbar, bold = true })
hi("LazyH1",        { fg = c.black, bg = c.statusbar, bold = true })
