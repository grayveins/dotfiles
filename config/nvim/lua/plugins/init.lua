return {

	-- Dashboard configuration
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('configs.dashboard')
		end,
	},

	-- **Conform.nvim**: Format code on save
--	{
--		"stevearc/conform.nvim",
--		event = 'BufWritePre',
--		opts = require "configs.conform",
--	},

	-- **nvim-treesitter**: Enhanced syntax highlighting and parsing
	{
		"nvim-treesitter/nvim-treesitter",
		build = ':TSUpdate',
		opts = {
			ensure_installed = { "c", "cpp", "lua", "vim", "html", "css", "markdown" },
			highlight = { enable = true },
		},
	},

	-- **nvim-cmp**: Autocompletion plugin with snippet support
	  {
	    "hrsh7th/nvim-cmp",
	    dependencies = {
	      'hrsh7th/cmp-nvim-lsp',
	      'hrsh7th/cmp-buffer',
	      'hrsh7th/cmp-path',
	      'saadparwaiz1/cmp_luasnip',
	      'L3MON4D3/LuaSnip',
	      'rafamadriz/friendly-snippets',
	      'hrsh7th/cmp-nvim-lua',           -- Added for Neovim Lua API completions
	      'lukas-reineke/cmp-under-comparator', -- Added for enhanced sorting
	    },
	    config = function()
	      require "configs.cmpconfig"
	    end,
	  },

	-- **nvim-tree**: File explorer
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require 'nvim-tree'.setup {
				git = { enable = true, ignore = false, timeout = 500 },
				view = { width = 30, side = "left" },
				renderer = {
					highlight_git = true,
					icons = { show = { git = true } },
				},
			}
		end,
	},

	-- **Telescope**: Fuzzy finder and picker
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { 'nvim-lua/plenary.nvim' } },
	},

	-- **lsp_signature.nvim**: Display function signatures
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require 'lsp_signature'.setup()
		end,
	},

	-- **lspkind-nvim**: Adds icons to completion items
	{
		"onsails/lspkind-nvim",
		config = function()
			require('lspkind').init()
		end,
	},

	-- **gitsigns.nvim**: Git integration for buffers
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup()
		end,
	},

	-- Which-key plugin for displaying keymaps
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.whichkey")
		end,
	},

	-- Bufferline plugin for tabbar
--	{
--		'akinsho/bufferline.nvim',
--		dependencies = 'nvim-tree/nvim-web-devicons',
--		config = function()
--			require('configs.bufferline')
--		end,
--	},

	-- **nvim-web-devicons**: Icons for files and more
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require 'nvim-web-devicons'.setup { default = true, }
		end,
	},

	-- **Project management**: Automatically manage project settings
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {}
		end,
	},

	-- **Status line**: Configure Lualine as a status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.lualine")
		end,
	},

	-- **Auto session management**: Save and restore sessions automatically
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			auto_session_enable_last_session = false,
			auto_restore_enabled = false,
			suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		},
	},

	-- **nvim-autopairs**: Automatically close brackets, quotes, etc.
	{
		'windwp/nvim-autopairs',
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- **Mason.nvim**: LSP and more installation manager
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	-- **mason-lspconfig.nvim**: Bridges Mason with lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls" },
				automatic_installation = true,
			})
		end,
	},

	-- **nvim-lspconfig**: Quickstart configurations for LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("configs.lsp")
		end,
	},

	-- **lsp_lines.nvim**: Inline diagnostics
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	}
	,{
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Notes/",
      },
      --{
      --  name = "work",
      --  path = "~/vaults/work",
      --},
    },

    -- see below for full list of options 👇
  },
},


	unpack(require("themes")),

}
