
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

-- wrap the PackerSync command to warn people before using it in NvChadSnapshots
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('plugins') require('nvchad-core.utils').packer_sync(<f-args>)"
  end,
})

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  vim.cmd "packadd packer.nvim"
  require "plugins"
  vim.cmd "PackerSync"
else
  require "plugins"
end

-- require("plugins")
-- require("comment")
-- require("completion")
-- require("picker")
-- require("lsp")
-- require("status")
