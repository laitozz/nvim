return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {

		bigfile = { enabled = true },
		-- bufdelete = {enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		image = { enabled = true },
		-- profiler = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		-- scroll = { enabled = true },
		statuscolumn = { enabled = true },
		-- words = { enabled = true },
		-- dashboard = { enabled = true },
		picker = {
			layout = {
				preset = function()
					return vim.o.columns >= 80 and "default" or "vertical"
				end,
			}
		},
	},

	keys = {
		{ "<leader><space>", function() Snacks.picker.smart() end,                 desc = "Smart Find Files" },
		{ "<leader>sS", function() Snacks.picker() end,                       desc = "Picker picker" },
		{ "<leader>.",  function() Snacks.scratch() end,                      desc = "Toggle Scratch Buffer" },
		{ "<leader>S",  function() Snacks.scratch.select() end,               desc = "Select Scratch Buffer" },
		-- git
		{ "<leader>gc", function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
		{ "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
		{ "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
		{ "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },
		{ "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
		{ "<leader>gB", function() Snacks.gitbrowse() end,                    desc = "Git Browse",               mode = { "n", "v" } },
		-- grep
		{ "<leader>sb", function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
		{ "<leader>sB", function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
		{ "<leader>sg", function() Snacks.picker.grep() end,                  desc = "Grep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end,             desc = "Registers" },
		{ '<leader>s/', function() Snacks.picker.search_history() end,        desc = "Search History" },
		{ "<leader>sa", function() Snacks.picker.autocmds() end,              desc = "Autocmds" },
		{ "<leader>sb", function() Snacks.picker.lines() end,                 desc = "Buffer Lines" },
		{ "<leader>sc", function() Snacks.picker.command_history() end,       desc = "Command History" },
		{ "<leader>sC", function() Snacks.picker.commands() end,              desc = "Commands" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
		{ "<leader>sf", function() Snacks.picker.files() end,                 desc = "Buffer Diagnostics" },
		{ "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
		{ "<leader>sH", function() Snacks.picker.highlights() end,            desc = "Highlights" },
		{ "<leader>si", function() Snacks.picker.icons() end,                 desc = "Icons" },
		{ "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "Keymaps" },
		{ "<leader>sl", function() Snacks.picker.loclist() end,               desc = "Location List" },
		{ "<leader>sm", function() Snacks.picker.marks() end,                 desc = "Marks" },
		{ "<leader>sM", function() Snacks.picker.man() end,                   desc = "Man Pages" },
		{ "<leader>sp", function() Snacks.picker.projects() end,              desc = "Project finder" },
		{ "<leader>sq", function() Snacks.picker.qflist() end,                desc = "Quickfix List" },
		{ "<leader>sR", function() Snacks.picker.resume() end,                desc = "Resume" },
		{ "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
		{ "<leader>sC", function() Snacks.picker.colorschemes() end,          desc = "Colorschemes" },
		{ "<leader>sn", function() Snacks.notifier.show_history() end,        desc = "Colorschemes" },
		-- LSP
		{ "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
		{ "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
		{ "gs",         function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		-- Org
		{ "<leader>of", function() Snacks.picker.files({cwd = "~/org"}) end, desc = "Org agenda files"},
		-- Other
		{ "<leader>z",  function() Snacks.zen() end,                          desc = "Toggle Zen Mode" },
		{ "<leader>Z",  function() Snacks.zen.zoom() end,                     desc = "Toggle Zoom" },
		{ "<C-t>",      function() Snacks.terminal() end,                     desc = "Toggle Terminal" },

	}
}
