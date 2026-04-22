return {
	'nvim-orgmode/orgmode',
	event = 'VeryLazy',
	ft = { 'org' },
	dependencies = {
		'nvim-orgmode/org-bullets.nvim',
	},
	config = function()
		-- Setup orgmode
		require('orgmode').setup({
			org_agenda_files = { '~/org/*' },
			org_default_notes_file = '~/org/refile.org',
			org_todo_keywords = { 'TODO(t)', '[ ](c)', '|', '[X](D)', 'DONE(d)' },
			win_split_mode = 'float',
			org_hide_leading_stars = true,
			org_hide_emphasis_markers = true,
			org_startup_indented = true,
		})
		require('org-bullets').setup({})
	 end,
 }
