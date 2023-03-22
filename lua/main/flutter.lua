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
