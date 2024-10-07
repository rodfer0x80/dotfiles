return {
  'pappasam/jedi-language-server',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
  lazy = true,  -- Lazy load the plugin
  ft = { 'python', 'py' },  -- Load only for Python files
  config = function()
    -- Set completion options
    vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('lspconfig').jedi_language_server.setup{
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Additional setup for Jedi if needed
      end,
      settings = {
        jedi = {
          autoImportModules = {},
          caseInsensitiveCompletion = true,
          debug = false,
        },
      },
    }

    vim.cmd([[
      augroup nvim_jedi
        autocmd!
        autocmd FileType python lua require('lspconfig').jedi_language_server.setup{}
      augroup end
    ]])
  end,
}

