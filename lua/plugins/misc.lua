return {
	{
		'numToStr/Comment.nvim',
		enabled = false, -- upstreamed to core
		event = 'VeryLazy',
		config = true,
	},
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = true,
	},
	{
		'Wansmer/treesj',
		keys = {
			{ "gS", "<cmd>TSJSplit<cr>" },
			{ "gJ", "<cmd>TSJJoin<cr>" },
		},
		cmd = { "TSJToggle", "TSJJoin", "TSJSplit" },
		opts = {
			use_default_keymaps = false
		}
	},
	{
		'abecodes/tabout.nvim',
		lazy = false,
		event = "InsertEnter",
		-- dependencies = { 'nvim-treesitter/nvim-treesitter' },
		keys = {
			{ "<C-j>", "<plug>(TaboutMulti)", mode = { 'i', 'n' } }
		},
		opts = {
			tabkey = "",
			act_as_tab = false,
		}
	},
	{
		'hiphish/rainbow-delimiters.nvim',
		event = "VeryLazy",
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			{ 'muniftanjim/nui.nvim' },
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", silent = true, noremap = true}
		}
	},
	{
		'theprimeagen/vim-be-good',
		cmd = "VimBeGood",
	},
	{
		'nicwest/vim-workman',
		cmd = 'Workman'
	},
	{
		'dstein64/vim-startuptime',
		cmd = "StartupTime"
	},
	{
		'akinsho/toggleterm.nvim',
		config = true,
		cmd = "ToggleTerm"
	},
	{
		'christoomey/vim-tmux-navigator',
		event = "VeryLazy"
	},
	{
		'j-hui/fidget.nvim',
		event = "VeryLazy",
		opts = {}
	},
	{
		'chrisgrieser/nvim-spider',
		enabled = false, -- TODO: figure out how to disable for cw, de, etc.
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},
	{
		"m4xshen/hardtime.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {}
	},
}
