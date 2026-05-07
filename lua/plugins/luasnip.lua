local config = function ()
	require('luasnip').config.set_config({
		history = true,
		updateevents = "TextChanged, TextChangedI",
		region_check_events = 'InsertEnter',
		delete_check_events = 'InsertLeave'
	})

	-- NOTE: relative to vim.fn.stdpath('config')
	-- And not current file
	require('luasnip.loaders.from_vscode').lazy_load({
		paths = "./lua/util/snip/scissors"
	})
	-- For friendly-snippets
	require('luasnip.loaders.from_vscode').lazy_load()

	require('luasnip.loaders.from_lua').lazy_load {
		paths = "./lua/util/snip/snippets"
	}

	-- Open luasnip log with a command
	vim.api.nvim_create_user_command("LuasnipLog", function() require('luasnip').log.open() end, {})
end

return {
	"L3MON4D3/LuaSnip",
	version = 'v2.*',
	config = config,
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"chrisgrieser/nvim-scissors",
			opts = {
				snippetDir = vim.fn.stdpath('config') .. "/lua/util/snip/scissors"
			},
			keys = {
				{"<M-s>", "<cmd>ScissorsAddNewSnippet<cr>", mode = { 'n', 'v' }, desc = "Scissors new snippet"},
				{"<M-e>", "<cmd>ScissorsEditSnippet<cr>",  	mode = { 'n', 'v' }, desc = "Scissors edit snippet"},
			}
		}
	},
}
