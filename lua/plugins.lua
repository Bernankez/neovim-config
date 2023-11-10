-- 自动安装lazy.nvim
-- 插件安装目录
-- ~/.local/share/nvim/lazy/
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.notify("Installing lazy.nvim, please wait...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.notify("lazy.nvim installed successfully.")
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("lazy.nvim not installed, quit.")
  return
end

local config = {
  checker = {
    -- automatically check for plugin updates
    enabled = true
  }
}
lazy.setup({
  "folke/lazy.nvim",
  ----------------- colorschemes -----------------
  {
    "mhartington/oceanic-next",
  },
  {
    "Th3Whit3Wolf/onebuddy",
    dependencies = {
      "tjdevries/colorbuddy.vim"
    }
  },
  {
    "savq/melange-nvim"
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "dark"
      })
    end
  },
  ------------------- plugins -------------------
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  }
}, config)

pcall(
  vim.cmd,
  [[
    augroup lazy_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | Lazy sync
    augroup end
  ]]
)
