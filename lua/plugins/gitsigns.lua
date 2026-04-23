return {
	'lewis6991/gitsigns.nvim',
	event = "VeryLazy",
	opts = {
		-- signs = {
		-- 	add = {text = "▎"},
		-- 	change = {text = "▎"},
		-- 	delete = {text = "_"},
		-- 	topdelete = {text = "_"},
		-- 	changedelete = {text = "▎"},
		-- },
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true
		},
		attach_to_untracked = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 1,
			ignore_whitespace = false,
		},
		trouble = true,
	},
	keys = {
		{ "gk", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
		{ "gK", "<cmd>Gitsigns blame_line<cr>" },
		{ "<leader>gb", "<cmd>Gitsigns blame<cr>" },
		{ "gh", "<cmd>Gitsigns stage_hunk<cr>" },
		{ "gH", "<cmd>Gitsigns undo_stage_hunk<cr>" },
	}
}
