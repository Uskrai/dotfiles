
local function lsp()
  local status = require"lsp-status".status_progress();
  return status;
end
require("lualine").setup {
  options = {theme = "ayu"},
  sections = {
      lualine_c = {
          {
              'filename',
              path = 1
              
          },
          lsp
      }
  }
}
