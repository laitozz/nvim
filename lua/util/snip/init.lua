local ls = require('luasnip')

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	region_check_events = 'InsertEnter',
	delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_lua').lazy_load {
	paths = "./lua/util/snip/snippets"
}

-- Open luasnip log with a command
vim.api.nvim_create_user_command("LuasnipLog", "lua require('luasnip').log.open()", {})
