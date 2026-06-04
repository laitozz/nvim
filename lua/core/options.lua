local opts = {
	backup = false,                          -- creates a backup file
	-- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 2,                        -- so that `` is visible in markdown files
	fileencoding = "utf-8",                  -- the encoding written to a file
	hlsearch = false,                        -- highlight all matches on previous search pattern
	incsearch = true,						 -- help with searches
	ignorecase = true,                       -- ignore case in search patterns
	mouse = "a",                             -- allow the mouse to be used in neovim
	pumheight = 10,                          -- pop up menu height
	showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	smartcase = true,                        -- smart case
	smartindent = true,                      -- TODO: use treesitter indent instead

	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                         -- enable persistent undo
	updatetime = 50,                         -- faster completion (4000ms default)
	makeprg="make -s",
	autochdir = false,
	linebreak = true,
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                       -- convert tabs to spaces (disable)
	shiftwidth = 4,                          -- the number of spaces inserted for each indentation
	tabstop = 4,                             -- insert 2 spaces for a tab
	cursorline = true,                       -- highlight the current line
	cursorlineopt = "number",
	number = true,                           -- set numbered lines
	relativenumber = true,                   -- set relative numbered lines
	numberwidth = 2,                         -- set number column width to 2 {default 4}

	signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
	wrap = false,                            -- display lines as one long line
	scrolloff = 8,                           -- is one of my fav
	sidescrolloff = 8,
	-- guifont = "monospace:h17",               -- the font used in graphical neovim applications
	shortmess = "filnxtToOF", 				 --Remove C to show amount of search results 
	foldlevelstart = 99,
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

-- check if running on linux
vim.g.os = vim.loop.os_uname().sysname

-- check if running nixos
if vim.g.os == 'Linux' then
	local file = io.open('/etc/os-release', 'r')
	if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end


vim.env.NOTES = "$HOME/Documents/Notes"
