-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open netrw to current directory
vim.keymap.set('n', '<leader>sv', vim.cmd.Ex)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Evaluate expression on current line
vim.keymap.set('n', '<leader>=', ':s/.*/\\=eval(submatch(0))')

-- Replace variable
vim.keymap.set('n', '<leader><leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle Copilot
vim.keymap.set('n', '<leader>ai', [[:SupermavenToggle<CR>]])
-- vim.keymap.set('n', '<leader>ai', [[:Copilot suggestion<CR>]])

-- Restart LSP (mostly use after updating .venv for python)
vim.keymap.set('n', '<leader>rr', [[:LspRestart<CR>]])

vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv")

vim.keymap.set('n', '<leader>gn', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local window = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(window)
  params.context = { includeDeclaration = true }
  vim.lsp.buf_request(bufnr, 'textDocument/references', params, function(err, result, ctx, _)
    local locations = {}
    if result then
      local results = vim.lsp.util.locations_to_items(result, vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
      locations = vim.F.if_nil(results, {})
    end
    if vim.tbl_isempty(locations) then
      return
    end
    vim.fn.setqflist(locations, 'r')
    -- vim.cmd.cnext()
  end)
end)

vim.keymap.set('n', '<C-n>', vim.cmd.cnext)
vim.keymap.set('n', '<C-p>', vim.cmd.cprev)

-- Neovim terminal
-- vim.keymap.set("", "<C-\\>", function ()
--   local buftype = vim.bo.buftype
--   local buffers = vim.api.nvim_list_buffers()
--   if buftype ~= "terminal" then
--     vim.cmd.terminal()
--   end
-- end)

-- vim: ts=2 sts=2 sw=2 et
