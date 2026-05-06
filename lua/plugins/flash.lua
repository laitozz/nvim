local search_mode_opts = {
	search = {
		mode = "search",
		incremental = true,
	},
	jump = {
		nohlsearch = true
	},
	highlight = {
		backdrop = false,
		matches = true,
		groups = {
			current = "IncSearch",
		}
	}
}

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		autohide = false,
		modes = {
			search = {
				enabled = false, -- use \ key instead
			},
			char = {
				enabled = false,
			}
		}
	},
	keys = {
		{ "s",  mode = { "n", "x", "o" }, function() require("flash").jump() end,                 desc = "Flash" },
		{ "\\", mode = { "n", "x", "o" }, function() require("flash").jump(search_mode_opts) end, desc = "Flash" },
		{ "S",  mode = { "n", "x", "o" }, function() require("flash").treesitter_search() end,           desc = "Flash Treesitter" },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
}
