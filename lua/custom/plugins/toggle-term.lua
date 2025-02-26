local shell = vim.o.shell
local os_name = vim.loop.os_uname().sysname
if os_name == 'Windows_NT' then
  shell = 'pwsh.exe'
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-\>]],
      size = 100,
      direction = 'vertical',
      shell = shell,
    }
  end,
}
