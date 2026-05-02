local orgmode_config = function()
	require('orgmode').setup({
		org_agenda_files = { '~/org/*' },
		org_default_notes_file = '~/org/refile.org',
		org_todo_keywords = { 'TODO(t)', '[ ](c)', '|', '[X](x)', 'DONE(d)' },
		win_split_mode = 'float',
		org_archive_location = '~/org/archive.org',
		org_hide_leading_stars = true,
		org_hide_emphasis_markers = true,
		org_startup_indented = true,
		org_highlight_latex_and_related = 'entities',
	})
end

return {
	'nvim-orgmode/orgmode',
	event = 'VeryLazy',
	ft = { 'org' },
	config = orgmode_config,
	dependencies = {
		{
			'chipsenkbeil/org-roam.nvim',
			opts = {
				directory = "~/notes"
			}
		},
		{
			'nvim-orgmode/org-bullets.nvim',
			opts = {
				list = false
			}
		},
		'nvim-orgmode/org-bullets.nvim',
		-- TODO: add org-roam
		-- https://github.com/chipsenkbeil/org-roam.nvim
	},
 }
