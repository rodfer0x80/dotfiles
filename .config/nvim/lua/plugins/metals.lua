return {
  'scalameta/nvim-metals',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'nvim-lua/lsp-status.nvim',
    'mfussenegger/nvim-dap',
    'folke/lsp-colors.nvim',
  },
  lazy = true,
  ft = { 'sc', 'scala', 'sbt', 'java' },
  config = function()
    vim.env.JAVA_HOME = "/usr/lib/jvm/java-17-openjdk"

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local metals_config = require('metals').bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      excludedPackages = {},
    }
    metals_config.capabilities = capabilities

    metals_config.on_attach = function(client, bufnr)
      require('metals').setup_dap()
    end

    require('metals').initialize_or_attach(metals_config)

    vim.cmd([[
      augroup nvim_metals
        autocmd!
        autocmd FileType scala,sbt,sc  lua require('metals').initialize_or_attach(metals_config)
      augroup end
    ]])
  end,
}

