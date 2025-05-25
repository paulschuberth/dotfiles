local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",
    "tpope/vim-fugitive",
    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    "cormacrelf/dark-notify",
    {
        'MeanderingProgrammer/markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
        config = function()
            require('render-markdown').setup({})
        end,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    }
})

-- Setup automatic LSP servers
require("mason").setup()

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Indentation
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting


local dn = require('dark_notify')
-- Configure
dn.run({
    schemes = {
      dark  = {
          colorscheme = "github_dark"
      },
      light = {
          colorscheme = "github_light"
      }
    }
})
-- vim.cmd [[colorscheme github_dark]]

require("fzf-lua").setup("fzf-tmux")
-- Fzf Lua key mappings
vim.keymap.set('n', '<leader>ff', function() vim.cmd.FzfLua("files") end , opt)

vim.keymap.set('n', '<leader>gc', function() vim.cmd.FzfLua("git_commits") end , opt)
vim.keymap.set('n', '<leader>gb', function() vim.cmd.FzfLua("git_branches") end , opt)
vim.keymap.set('n', '<leader>gb', function() vim.cmd.FzfLua("git_branches") end , opt)
vim.keymap.set('n', '<leader>gd', function() vim.cmd.FzfLua("git_diff") end , opt)

vim.keymap.set('n', '<leader>gf', function() vim.cmd.FzfLua("live_grep") end , opt)

