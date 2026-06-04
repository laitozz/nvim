-- TODO: enable lazyloading and make all of this more sensible
return {
	{ -- TODO: replace this with pure treesitter textobjects
		'nvim-mini/mini.ai',
		version = false,
		lazy    = false,
		config  = true,
	},
	{
		'nvim-mini/mini.align',
		version = false,
		lazy    = false,
		config  = true
	}
	-- {
	-- 	'nvim-mini/mini.surround',
	-- 	version = false,
	-- 	lazy    = false,
	-- 	config  = true
	-- },
	-- { -- Using treesj instead
	-- 	'nvim-mini/mini.splitjoin',
	-- 	version = false,
	-- 	lazy    = false,
	-- 	config  = true
	-- },
}
