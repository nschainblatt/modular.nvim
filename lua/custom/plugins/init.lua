-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':tab G<CR>:Git<CR>')
    end,
  },
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      require('lspconfig').jdtls.setup {}
    end,
  },
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
    -- {
    --   'mbbill/undotree',
    --   config = function()
    --     vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    --   end,
    -- },
    {
      'akinsho/toggleterm.nvim', -- TODO: LEARN
      version = '*',
      config = function()
        require('toggleterm').setup {
          open_mapping = [[<c-\>]],
          direction = 'float',
        }
      end,
    },
    {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()
        vim.keymap.set('n', '<leader>a', function()
          harpoon:list():add()
        end)
        vim.keymap.set('n', '<leader>t', function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        vim.keymap.set('n', '<leader>q', function()
          harpoon:list():select(1)
        end)
        vim.keymap.set('n', '<leader>w', function()
          harpoon:list():select(2)
        end)
        vim.keymap.set('n', '<leader>e', function()
          harpoon:list():select(3)
        end)
        vim.keymap.set('n', '<leader>r', function()
          harpoon:list():select(4)
        end)
        vim.keymap.set('n', '<C-S-P>', function()
          harpoon:list():prev()
        end)
        vim.keymap.set('n', '<C-S-N>', function()
          harpoon:list():next()
        end)
      end,
    },
  },
  -- {
  --   'Exafunction/codeium.vim',
  --   event = 'BufEnter',
  -- },
  --   {
  --     "tiagovla/tokyodark.nvim",
  --     opts = {
  --         -- custom options here
  --     },
  --     config = function(_, opts)
  --         require("tokyodark").setup(opts) -- calling setup is optional
  --         vim.cmd [[colorscheme tokyodark]]
  --     end,
  -- },
  -- {
  --   'loganswartz/sunburn.nvim',
  --   dependencies = { 'loganswartz/polychrome.nvim' },
  --   -- you could do this, or use the standard vimscript `colorscheme sunburn`
  --   config = function()
  --     vim.cmd.colorscheme 'sunburn'
  --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'gruvbox'
  --   end,
  -- },
  -- {
  --   'nyoom-engineering/oxocarbon.nvim',
  --   config = function()
  --     vim.cmd.colorscheme 'oxocarbon'
  --   end,
  -- },
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup {
        palettes = {
          -- Custom duskfox with black background
          nightfox = {
            bg1 = '#000000', -- Black background
          },
        },
      }
      vim.cmd.colorscheme 'nightfox'
    end,
  },
  {
    'VidocqH/lsp-lens.nvim', -- NOTE: keep track of this, there could eventually be a better built in and supported lens plugin
    config = function()
      require('lsp-lens').setup {}
    end,
  },
}
