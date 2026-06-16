local toggle = 1

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set('n', '<C-t>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<C-a>', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-1>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-2>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-3>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-4>', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<C-5>', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():next()
    end)
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():prev()
    end)
  end,
}
