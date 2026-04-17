local config = function()
	local ts = require("nvim-treesitter.configs")

	ts.setup({
		auto_install = true,
		ensure_installed = { "rust", "lua", "help", "c", "cpp" }, -- one of "all" or a list of languages
		ignore_install = { "help", "org" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "markdown", "org" }, -- list of language that will be disabled
			-- additional_vim_regex_highlighting = {'org'},
		},
		indent = {
			enable = true,
			disable = { "css" }
		},
		endwise = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "outer function" },
					["if"] = { query = "@function.inner", desc = "inner function" },
					["aa"] = { query = "@parameter.outer", desc = "outer argument/parameter" },
					["ia"] = { query = "@parameter.inner", desc = "inner argument/parameter" },
					["ac"] = { query = "@class.outer", desc = "outer class" },
					["ic"] = { query = "@class.inner", desc = "inner class" },
				},
			},
		},
		sync_install = false,
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	event = 'VeryLazy',
	branch = 'master',
	config = config,
	dependencies = {
		{
			"nvim-orgmode/orgmode",
			"RRethy/nvim-treesitter-endwise",
			"nvim-treesitter/nvim-treesitter-textobjects",
		}
	}
}
