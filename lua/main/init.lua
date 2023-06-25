require("main.packer")

--Theme
require('lualine').setup({
  options = {
    theme = 'ayu_dark',
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
})

local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    vim.api.nvim_set_hl(0, "Function", { bg = "#000000" })
  end,
  group = custom_highlight,
})

vim.cmd [[colorscheme moonfly]]

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

require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = false,
      device = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
  lsp = {
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
    },
  }
}

require("luasnip").filetype_extend("dart", { "flutter" })
require("luasnip").filetype_extend("html", { "javascript", "css", "vue", "svelte" })

lsp.setup()

--set
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.guicursor = ""
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.backspace = 'indent,eol,start';

--remap
vim.keymap.set('n', 'pv', vim.cmd.Ex)
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('v', '<C-x>', '"+x')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')
vim.keymap.set('v', '<Del>', '"_x')
vim.keymap.set('n', '<Del>', '"_x')
vim.keymap.set('n', '<CR>', 'G<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gg=G', ':LspZeroFormat<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-f>', '<ESC><cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })
vim.keymap.set('n', '<C-b><Up>', '<C-w><Up>')
vim.keymap.set('n', '<C-b><Down>', '<C-w><Down>')
vim.keymap.set('n', '<C-b><Left>', '<C-w><Left>')
vim.keymap.set('n', '<C-b><Right>', '<C-w><Right>')
vim.keymap.set('n', '<C-b>h', vim.cmd.sp)
vim.keymap.set('n', '<C-b>v', vim.cmd.vsp)
vim.keymap.set('i', '<C-s>', '<ESC>1z=')
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':m .+1<CR>==', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':m .-2<CR>==', { silent = true })
vim.api.nvim_set_keymap('v', '<C-S-Down>', ":m '>+1<CR>gv=gv", { silent = true })
vim.api.nvim_set_keymap('v', '<C-S-Up>', ":m '<-2<CR>gv=gv", { silent = true })
