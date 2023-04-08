local b = require"null-ls".builtins;
local ca = b.code_actions;
local cmp = b.completion;
local f = b.formatting;

require"null-ls".setup {
  sources = {
    -- ca.gitsigns,
    ca.refactoring,
    cmp.tags,
    -- diag.phpcs,
    -- f.astyle,
    f.beautysh,
    f.blade_formatter,
    -- f.clang_format,
    -- f.jq,
    f.prettier,
    b.diagnostics.mypy,
    f.black,
    f.fish_indent,
    f.fish,
    -- f.phpcbf,
    -- f.phpcsfixer,
  }
}
