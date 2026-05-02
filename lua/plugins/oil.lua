return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		view_options = {
			show_hidden = false,
		},
		keymaps = {
			["<C-p>"] = false,
			["<M-p>"] = "actions.preview",
			["q"] = "actions.close",
			["gp"] = function()
				require("oil").set_columns({ "permissions", "size", "icon" })
			end,
			["gP"] = function()
				require("oil").set_columns({ "icon" })
			end,
		}
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-",         "<cmd>Oil<cr>",                               desc = "open Oil" },
		{ "<leader>-", function() require("oil").toggle_float() end, desc = "open Oil" }
	},
}
