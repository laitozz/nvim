local M = {}

-- FzfLua
M.directories = function()
	local excludes = ".git node_module .cache .npm .mozilla .meteor .nv"
	local cmd = "fd --type d --hidden "
	for _, e in ipairs(vim.split(excludes, " ")) do
		cmd = cmd .. "--exclude " .. e .. " "
	end
	require('fzf-lua').files({
		cmd = cmd,
		winopts = {
			preview = {
				hidden = true,
			},
			height = 0.45,
			width = 0.45
		},
		actions = {
			["default"] = function(selected)
				require("oil").open(selected[0])
			end
		}
	})
end


-- Telescope
local is_inside_work_tree = {}
M.project_files = function(opts)
	-- local opts = { compact_dropdown }
	local builtin = require('telescope.builtin')
	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end
	if is_inside_work_tree[cwd] then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end

M.grep = function()
	local themes = require('telescope.themes')
	local compact_dropdown = themes.get_dropdown { previewer = false, hidden = true }
	local extensions = require('telescope').extensions
	local builtin = require('telescope.builtin')
	builtin.live_grep(themes.get_ivy())
end

M.hgrep = function()
	local themes = require('telescope.themes')
	local compact_dropdown = themes.get_dropdown { previewer = false, hidden = true }
	local extensions = require('telescope').extensions
	require("telescope-helpgrep").grep_string(themes.get_ivy())
end

M.my_find_files = function(opts, no_ignore)
  opts = opts or {}
  no_ignore = vim.F.if_nil(no_ignore, false)
  opts.attach_mappings = function(_, map)
    map({ "n", "i" }, "<C-h>", function(prompt_bufnr) -- <C-h> to toggle modes
      local prompt = require("telescope.actions.state").get_current_line()
      require("telescope.actions").close(prompt_bufnr)
      no_ignore = not no_ignore
      M.my_find_files({ default_text = prompt }, no_ignore)
    end)
    return true
  end

  if no_ignore then
    opts.no_ignore = true
    opts.hidden = true
    opts.prompt_title = "Find Files <ALL>"
    -- require("telescope.builtin").find_files(opts)
	M.project_files(opts)
  else
    opts.prompt_title = "Find Files"
    -- require("telescope.builtin").find_files(opts)
	M.project_files(opts)
  end
end

return M
