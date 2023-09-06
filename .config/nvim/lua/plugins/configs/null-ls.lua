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
    -- f.beautysh,
    f.shfmt.with({
      filetypes = {"bash", "sh"}
    }),
    f.blade_formatter,
    -- f.clang_format,
    -- f.jq,
    f.prettier,
    b.diagnostics.mypy,
    f.black,
    f.fish_indent,
    b.diagnostics.fish,
    b.diagnostics.eslint.with({
      condition = function(utils)
        return utils.root_has_file({".eslintrc.*"})
      end
    }),
    -- f.phpcbf,
    -- f.phpcsfixer,
  }
}
