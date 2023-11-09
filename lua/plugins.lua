local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.vim"
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

lazy.setup()
