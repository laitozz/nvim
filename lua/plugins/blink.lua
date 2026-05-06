return {
	'saghen/blink.cmp',
	lazy = false, -- Very fast
	version = '1.*', -- pinned to v1
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		{
			"saghen/blink.compat",
			opts = {
				impersonate_nvim_cmp = true,
			},
			version = "*",
		},
		{
			'Kaiser-Yang/blink-cmp-dictionary',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
	},
	opts = {
		snippets = { preset = "luasnip" },
		sources = {
			-- compat = {},
			default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
			per_filetype = {
				org = { 'orgmode' },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				},
				orgmode = {
					name = "Orgmode",
					module = "orgmode.org.autocompletion.blink",
					fallbacks = { "buffer" },
				},
				-- Doesn't work without spell file
				dictionary = {
					name = "Dict",
					module = "blink-cmp-dictionary",
					min_keyword_length = 3
				}
			}
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},
			accept = {
				auto_brackets = {
					enabled = true
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 10

			}
		},
		signature = {
			enabled = true
		},
		keymap = {
			preset = "default",
			['<Tab>'] = { 'select_and_accept', 'fallback' },
			['<C-j>'] = { function(cmp) require('luasnip').expand() end },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<Cr>'] = { 'accept', 'fallback' },
			['<C-n>'] = { 'select_next', 'fallback' },
			['<C-p>'] = { 'select_prev', 'fallback' },
			['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end }
		},
		cmdline = {
			enabled = true,
			-- wanted behaviour: do not select initially, tab cycles through
			keymap = {
				-- These need a function that returns false, so fallback is also activated
				['<C-p>'] = { function(cmp) cmp.hide() end, 'fallback' },
				['<C-n>'] = { function(cmp) cmp.hide() end, 'fallback' },
				['<cr>'] = { 'accept_and_enter', 'fallback' },
			},
			completion = {
				list = {
					selection = {
						preselect = false,
						-- auto_insert = false,
					},
				},
				menu = { auto_show = function() return vim.fn.getcmdtype() == ':' end }
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = {
		"sources.default",
		"sources.compat",
	}
}
