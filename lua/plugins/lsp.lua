local config = function()
	-- TODO: setup mason for non-nixos machines
	local ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd", "glsl_analyzer", "nixd", "nil_ls", "csharp_ls" }
	require('mason').setup()
	-- require("mason-lspconfig").setup {
	-- 	ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" },
	-- }

	-- TODO: lspconfig
	vim.lsp.enable({
		"lua_ls",
		"nil_ls",
		"nixd",
		"bashls",
		-- TODO: find a way to setup following non-lsp tools
		-- "clang-tools",
		-- "gdb",
		-- "alejandra"
	})

	-- DIAGNOSTICS -- 

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = false,
		virtual_lines = false,
		underline = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

return {
	'neovim/nvim-lspconfig',
	lazy = false,
	config = config,
	dependencies = {
		{ 'williamboman/mason.nvim', },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'simrat39/rust-tools.nvim' },
		{
			"folke/lazydev.nvim",
			enabled = true,
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					{ path = "snacks.nvim" , words = { "Snacks" } }
				},
			},
		},

		{
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
			enabled = false, -- Blink.cmp does the same thing now
			opts = {
				bind = true,
				floating_window = true,
				handler_opts = {
					border = "rounded"
				}
			},
		}
	},
	keys = {
		vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>', {silent = true})
	}
}
