-- TODO: enable lazyloading and make all of this more sensible
return {
	{ -- TODO: replace this with pure treesitter textobjects
		'echasnovski/mini.ai',
		version = false,
		lazy = false,
		config = true,
	},
	-- {
	-- 	'echasnovski/mini.surround',
	-- 	version = false,
	-- 	lazy = false,
	-- 	config = true
	-- },
	-- { -- Using treesj instead
	-- 	'echasnovski/mini.splitjoin',
	-- 	version = false,
	-- 	lazy = false,
	-- 	config = true
	-- },
}
