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
    -- f.phpcbf,
    -- f.phpcsfixer,
  }
}
