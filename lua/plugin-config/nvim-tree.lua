local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify("nvim-tree not found!")
  return
end

local list_keys = require("keybindings").nvimTreeList
nvim_tree.setup({
  -- 显示git状态图标
  git = {
    enable = true,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏 . 文件 和 node_modules
  filters = {
    dotfiles = true,
    custom = { "node_modules" }
  },
  view = {
    -- 宽度
    width = 40,
    side = "right",
    -- 隐藏根目录
    hide_root_folder = true,
    mappings = {
      custom_only = false,
      -- list = list_keys,
    },
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
  actions = {
    -- 首次打开大小适配
    resize_window = true,
    -- 打开文件时关闭
    quit_on_open = true,
  },
  -- windows下: wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open
  system_open = {
    cmd = "open" -- windows下: wsl-open
  },
})

