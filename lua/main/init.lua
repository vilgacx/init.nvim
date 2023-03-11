require("main.packer")

--Theme
require('lualine').setup({
   options = {
      theme = 'ayu_dark',
      icons_enabled = true,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
   }
})

--LSP
local lsp = require('lsp-zero').preset({
   name = 'minimal',
   set_lsp_keymaps = true,
   manage_nvim_cmp = true,
   suggest_lsp_servers = false,
})

local cmp = require('cmp')

lsp.setup_nvim_cmp({
   preselect = 'none',
   completion = {
      completeopt = 'menu,menuone,noinsert,noselect'
   },
   mapping = lsp.defaults.cmp_mappings({
      ['<Tab>'] = cmp.mapping.select_next_item()
   })
})

lsp.setup()

--set
vim.opt.nu = true
vim.opt.tabstop = 3
vim.opt.guicursor = ""
vim.opt.smartindent = true
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

--remap
vim.keymap.set('n','pv',vim.cmd.Ex)
vim.keymap.set('v','<C-c>','"+y')
vim.keymap.set('v','<C-x>','"+x')
vim.keymap.set('v','<C-l>','"+yy')
vim.api.nvim_set_keymap('v', 'gg=G', '<ESC><cmd>lua vim.lsp.buf.format()<CR>', {noremap = true})
