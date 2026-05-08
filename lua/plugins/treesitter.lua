local config = function()
	require("tree-sitter-manager").setup({
		-- Default Options
		ensure_installed = {}, -- list of parsers to install at the start of a neovim session
		border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
		auto_install = true, -- if enabled, install missing parsers when editing a new file
		highlight = false, -- treesitter highlighting is enabled by default
	})
	-- NOTE: workaround for
	-- https://github.com/romus204/tree-sitter-manager.nvim/issues/54
	vim.api.nvim_create_autocmd('FileType', {
		callback = function()
			pcall(vim.treesitter.start)
		end,
	})
end

return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	lazy = false,
	keys = {{ "<leader>it", "<cmd>TSManager<cr>", desc = "Tree Sitter TUI"}},
	cmd = { "TSManager" },
	config = config,
}
