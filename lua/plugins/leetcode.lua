local leetArg = "lc"
return {
    "kawre/leetcode.nvim",
	lazy = leetArg ~= vim.fn.argv()[1],
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "muniftanjim/nui.nvim",

        -- optional
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
		arg = leetArg,
		injector = {
			["cpp"] = {
				before = {
					"#include <bits/stdc++.h>",
					"using namespace std;"
				},
				after = "int main() {}"
			}
		}
    },
	keys = {
		vim.keymap.set("n", "<leader>dr", "<cmd>Leet run<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dd", "<cmd>Leet desc<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>ds", "<cmd>Leet submit<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>di", "<cmd>Leet info<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dl", "<cmd>Leet lang<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dq", "<cmd>Leet exit<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>do", "<cmd>Leet list<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dh", "<cmd>Leet hints<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dR", "<cmd>Leet reset<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dI", "<cmd>Leet inject<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dc", "<cmd>Leet console<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dS", "<cmd>Leet session<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>da", "<cmd>Leet last_submit<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dt", "<cmd>Leet tabs<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dD", "<cmd>Leet daily<cr>", {noremap = true}),
		vim.keymap.set("n", "<leader>dA", "<cmd>Leet random<cr>", {noremap = true}),
	},
	hooks = {
		["question_enter"] = {
			function()
				os.execute "sleep 1"
				local file_extension = vim.fn.expand "%:e"
				if file_extension == "rs" then
					local bash_script = tostring(vim.fn.stdpath("data") .. "/leetcode/rust_init.sh")
					local success, error_message = os.execute(bash_script)
					if success then
						print "Successfully updated rust-project.json"
						vim.cmd "LspRestart rust_analyzer"
					else
						print("Failed update rust-project.json. Error: " .. error_message)
					end
				end
			end,
		},
	},
}
