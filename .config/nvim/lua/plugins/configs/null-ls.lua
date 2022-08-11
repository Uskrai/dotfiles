local b = require"null-ls".builtins;
local ca = b.code_actions;
local cmp = b.completion;

require"null-ls".setup {
  sources = {
    ca.gitsigns,
    ca.refactoring,
    cmp.tags,
    -- diag.phpcs,
  }
}
