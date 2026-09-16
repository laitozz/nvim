local opts = { noremap = true, silent = true }
local remap = { silent = true }

local map = vim.keymap.set
local desc = function (str)
	return vim.tbl_deep_extend("force", opts, { desc = str })
end

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--plugin specific
map('n', '<leader>il', '<cmd>Lazy<cr>', opts)
map('n', '<leader>im', '<cmd>Mason<cr>', opts)

-- Delete words with backspace
map('i', '<C-BS>', '<C-w>', opts)
map('i', '<M-BS>', '<C-w>', opts)

--Buffer navigation
map('n', '<M-a>', '<C-^>', opts)

--Emacs-like insert navigation
map('i', '<C-b>', '<left>', opts)
map('i', '<C-f>', '<right>', opts)
map('i', '<M-b>', '<C-left>', opts)
map('i', '<M-f>', '<C-right>', opts)

--Cmdline navigation
map('c', '<M-b>', '<S-Left>', {})
map('c', '<M-f>', '<S-Right>', {})
map('c', '<C-b>', '<Left>', {})
map('c', '<C-f>', '<Right>', {})
map('c', '<C-a>', '<Home>', {})

--Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- Tab navigation
map('n', ']<tab>', 			'<cmd>tabn<cr>', { desc = "next tab" })
map('n', '[<tab>', 			'<cmd>tabp<cr>', { desc = "previous tab" })
map('n', '<leader><tab>c', 	'<cmd>tabc<cr>', { desc = "close tab" })
map('n', '<leader><tab>n', 	'<cmd>tabe<cr>', { desc = "new tab" })

-- map ö to ;
map('n', 'ö', ';', opts)
map('n', 'Ö', ':', {})
map('n', '¤', '$', opts)

map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)

-- Better indent, stay in visual
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

--Switch ` and '
map('n', '\'', '`', opts)

--Better C-u and C-d
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Luasnip select
map({ "i", "s" }, "<M-n>", "<Plug>luasnip-next-choice", opts)
map({ "i", "s" }, "<M-p>", "<Plug>luasnip-prev-choice", opts)
map({ "i", "s" }, '<M-j>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
map({ "i", "s" }, '<M-k>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)

--Format on keymap
map('n', 'grf', '<cmd>lua vim.lsp.buf.format()<cr>', desc("Format buffer"))

--Unbind visual K and J
map('v', 'K', '', opts)
map('v', 'J', '', opts)

-- Yank to system clipboard
map('v', 'Y', '"+y', opts)

--Terminal window, visual glitches
map('n', '<leader>T', ':vs<cr>:terminal<cr>i', opts)

map('n', '+', '<cmd>make<cr>', opts)
map('n', '<leader><cr>', '<cmd>make<cr>', opts)

-- Builtin undotree
local function undotree()
	vim.cmd.packadd('nvim.undotree')
	require("undotree").open({
		title = "undotree",
		command = "40vnew",
	})
end
vim.keymap.set("n", "<leader>u", undotree)

-- Clear multicursor
vim.keymap.set("n", [[q\]], function()
	local mc_ns = vim.api.nvim_create_namespace('nvim.multicursor')
	vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
end, opts)

-- 
local toggle_virtual_lines = function()
	_G.virtual_lines_enabled = not _G.virtual_lines_enabled
	vim.diagnostic.config({virtual_lines = _G.virtual_lines_enabled})
end
local opts = { remap = true, silent = true, buffer = bufnr }
-- TODO: figure out a better way to do this
-- or only show diagnostics on the current line
vim.keymap.set('n', '[ov', '<cmd>lua vim.diagnostic.config{virtual_text=false}<cr>', opts)
vim.keymap.set('n', ']ov', '<cmd>lua vim.diagnostic.config{virtual_text=true}<cr>', opts)
vim.keymap.set('n', '[v', '<cmd>lua vim.diagnostic.config{virtual_lines=false}<cr>', opts)
vim.keymap.set('n', ']v', '<cmd>lua vim.diagnostic.config{virtual_lines=true}<cr>', opts)
-- TODO: figure out a better bind for this
vim.keymap.set('n', '<leader>v', function() toggle_virtual_lines() end, opts)
vim.keymap.set('n', 'grd', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
vim.keymap.set('n', 'gK', '<cmd>help!<cr>')
