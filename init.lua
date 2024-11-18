-- bootstrap lazy.nvim, LazyVim and your plugins
require("_personal/editor")

-- se nao tiver o gerenciador de plugins lazyvim ele vai baixar
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Buscar todos arquivos da minha pasta personal para o lazyvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "_personal/plugins"}
  },
  checker = { enable = true }
})




-- arquivos de configuracoes personais - chamando apartir do agrupador
-- require("personal_configs_nvim._initPersonal")
