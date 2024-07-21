-- vim option
local set = vim.opt
-- line
set.number = true
-- tab
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    -- FileExplorer
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
      keys = {
          {mode = "n", "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree with Ctrl+n"},
      },
    },
    -- CodeCompletion
    { 
      'neoclide/coc.nvim',
      branch = "release",
      keys = {
        -- Use `[g` and `]g` to navigate diagnostics
        -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
        {mode = "n", "[g", "<Plug>(coc-diagnostic-prev)", desc = "Go to diagnostic prev"},
        {mode = "n", "]g", "<Plug>(coc-diagnostic-next)", desc = "Go to diagnostic next"},
        -- GoTo code navigation
        {mode = "n", "gd", "<Plug>(coc-definition)", desc = "Go to definition"},
        {mode = "n", "gy", "<Plug>(coc-type-definition)", desc = "Go to type definition"},
        {mode = "n", "gi", "<Plug>(coc-implementation)", desc = "Go to implementation"},
        {mode = "n", "gr", "<Plug>(coc-references)", desc = "Go to references"},
      },
    },
    -- ColorScheme
    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme('gruvbox-material')
      end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
