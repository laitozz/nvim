-- filtype settings
-- https://neovim.io/doc/user/lua.html#lua-filetype
vim.filetype.add({
	pattern = {
		["hypr.*%.conf"] = "hyprlang",
	}
})

vim.api.nvim_create_autocmd('BufWinEnter', {
	desc = 'Open :help in a full-height vertical split on the right',
	callback = function(ev)
		if vim.bo[ev.buf].buftype == 'help' then
			vim.cmd.wincmd('L')
			-- Increase window size if focus.nvim is installed
			pcall(vim.cmd, "FocusEnableWindow")
		end
	end,
})
