return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', ':tab G<CR>:Git<CR>')
  end,
}
