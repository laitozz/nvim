-- TODO: add keybinds
return {
	"xeluxee/competitest.nvim",
	dependencies = "muniftanjim/nui.nvim",
	cmd = "CompetiTest",
	keys = "<leader>c",
	opts = {
		testcases_use_single_file = true,
		received_contests_directory = "$(HOME)/projects/$(JUDGE)/$(CONTEST)",
		received_problems_path = "$(HOME)/projects/$(JUDGE)/$(PROBLEM)/main.$(FEXT)",
		evaluate_template_modifiers = true,
		template_file = "~/projects/CSES/template.cpp"
	},
}
