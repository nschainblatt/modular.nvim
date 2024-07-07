-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end,
  },
  'nvim-java/nvim-java',
  {
    'brymer-meneses/grammar-guard.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
    },
    config = function()
      require('grammar-guard').init()
    end,
    'ThePrimeagen/vim-be-good',
    {
      'sindrets/diffview.nvim',
      depencencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('diffview').setup {
          enhanced_diff_hl = true,
          vim.api.nvim_set_keymap('n', '<leader>gh', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true }),
          vim.api.nvim_set_keymap('n', '<leader>gc', ':DiffviewOpen<CR>', { noremap = true, silent = true }),
        }
      end,
    },
    {
      'mbbill/undotree',
      config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
      end,
    },
  },
}
