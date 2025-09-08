if vim.g.vscode then
  require('plugins.vscode.basic')
  require('plugins.vscode.keymaps')
end

return {
  require('plugins.colorscheme'),
  require('plugins.flash'),
}
