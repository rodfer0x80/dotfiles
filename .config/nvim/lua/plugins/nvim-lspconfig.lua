return {
  'neovim/nvim-lspconfig',
  lazy = true,  -- Lazy load the plugin
  ft = { 'r', 'R' },  -- Load only for R files
  config = function()
    require('lspconfig').r_language_server.setup{
      on_attach = function(client, bufnr)
        -- Additional setup if needed
      end,
      settings = {
        r = {
          diagnostics = {
            enable = true,
          },
          -- Other R-specific settings can be added here
        },
      },
      cmd = { "R", "--slave", "-e", "languageserver::run()" },  -- Command to start the server
    }

    -- Optional: Key mappings for LSP functions
    local opts = { noremap=true, silent=true }
    vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  end,
}

