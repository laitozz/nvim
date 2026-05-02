return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"elanmed/fzf-lua-frecency.nvim",
			opts = true
		}
	},
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	opts = {
		winopts = {
			preview = {
				horizontal = "right:60%"
			}
		},
	},
	cmd = "FzfLua",
	keys = {
		{ "<leader>fd", require("util.find").directories, desc = "fzf directories" },
		{ "<leader>ff", "<cmd>FzfLua files<CR>",          desc = "Find files" },
		{ "<leader>fg", "<cmd>FzfLua grep_visual<CR>",    desc = "Live grep" },
		{ "<leader>fb", "<cmd>FzfLua buffers<CR>",        desc = "Find buffers" },
		{ "<leader>fa", "<cmd>FzfLua builtin<CR>",        desc = "Find buffers" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<CR>",      desc = "Find help" },
		{ "<leader>fc", "<cmd>FzfLua commands<CR>",       desc = "Find commands" },
		{ "<leader>fo", "<cmd>FzfLua oldfiles<CR>",       desc = "Find recent files" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<CR>",        desc = "Find keymaps" },
		{ "<leader>ft", "<cmd>FzfLua tags<CR>",           desc = "Find tags" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<CR>",     desc = "Grep current word" },
		{ "<leader>fl", "<cmd>FzfLua lines<CR>",          desc = "Find lines" },
		{ "<leader>fM", "<cmd>FzfLua marks<CR>",          desc = "Find marks" },
		{ "<leader>fm", "<cmd>FzfLua manpages<CR>",       desc = "Find marks" },
		{ "<leader>fj", "<cmd>FzfLua jumps<CR>",          desc = "Find jumps" },
		{ "<leader>fs", "<cmd>FzfLua git_status<CR>",     desc = "Find git status" },
		{ "<leader>fp", "<cmd>FzfLua git_files<CR>",      desc = "Find git files" },
	},
}
