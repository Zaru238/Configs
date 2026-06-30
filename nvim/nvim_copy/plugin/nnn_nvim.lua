vim.pack.add({ 'https://github.com/luukvbaal/nnn.nvim' })

local nnn = require("nnn")
nnn.setup({
  replace_netrw = "picker",
  mappings = {
    { "<C-t>", nnn.builtin.open_in_tab }, -- open file(s) in tab
  }
})

vim.keymap.set('n', '<C-n>','<cmd>NnnPicker %:p:h<CR>')
