local opts = { noremap = true, silent = true }
local remap = { silent = true }

local map = vim.keymap.set
local desc = function (str)
	return vim.tbl_deep_extend("force", opts, { desc = str })
end

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--plugin specific
map('n', '<leader>l', '<cmd>Lazy<cr>', opts)

map('i', '<C-BS>', '<C-w>', opts)

--Buffer navigation
map('n', '<M-l>', '<C-^>', opts)

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

-- TODO: convert to neovim upstream equivalents

-- Luasnip select
map({ "i", "s" }, "<M-n>", "<Plug>luasnip-next-choice", opts)
map({ "i", "s" }, "<M-p>", "<Plug>luasnip-prev-choice", opts)
map({ "i", "s" }, '<M-j>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
map({ "i", "s" }, '<M-k>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)

-- -- Dap keymaps
-- map('n', '<leader>B', ':lua require("dap").toggle_breakpoint()<cr>', opts)
-- map('n', '<F5>', ':lua require("dap").continue()<cr>', opts)
-- map('n', '<F10>', ':lua require("dap").step_over()<cr>', opts)
-- map('n', '<F11>', ':lua require("dap").step_into()<cr>', opts)
-- map('n', '<F12>', ':lua require("dap").step_out()<cr>', opts)
-- map('n', '<leader>rp', ':lua require("dap").repl.open()<cr>', opts)
-- map('n', '<leader>re', ':lua require("dap").terminate()<cr>', opts)
-- map('n', '<leader>rl', ':lua require("dap").run_last()<cr>', opts)
-- map('n', '<leader>rn', ':RustRunnables<cr>', opts)
-- map('n', '<leader>rd', ':RustDebuggables<cr>', opts)
-- map('n', '<leader>rr', '<cmd>vs | term cargo run<cr>i', opts)

map('n', '<leader>qq', '<cmd>quit<cr>', opts)

--Format on keymap
map('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<cr>', desc("Format buffer"))

-- Delete other buffers
map( 'n', '<leader>D', ':mark t | w | %bd | e# | bd# <cr> `t', desc("Delete other buffers"))

--Unbind visual K and J
map('v', 'K', '', opts)
map('v', 'J', '', opts)

--Terminal window, visual glitches
map('n', '<leader>T', ':vs<cr>:terminal<cr>i', opts)

map('n', '+', '<cmd>make<cr>', opts)
map('n', '<leader><cr>', '<cmd>make<cr>', opts)

-- Hot reload config 
-- TODO: can this be done with persistance?
map('n', '<leader>qr', function()
  local session = vim.fn.stdpath('state') .. '/restart_session.vim'
  vim.cmd('mksession! ' .. vim.fn.fnameescape(session))
  vim.cmd('restart source ' .. vim.fn.fnameescape(session))
end, { desc = 'Restart Neovim' })

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
