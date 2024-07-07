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
  },
}
