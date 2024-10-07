return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',   -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',     -- Buffer source for nvim-cmp
      'hrsh7th/cmp-path',       -- Path source for nvim-cmp
      'hrsh7th/cmp-cmdline',    -- Cmdline source for nvim-cmp
      'L3MON4D3/LuaSnip',       -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For snippet expansion
          end,
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item(), -- Move to the next completion item
          ['<C-p>'] = cmp.mapping.select_prev_item(), -- Move to the previous completion item
          ['<CR>']  = cmp.mapping.confirm({ select = true }), -- Confirm selection
          ['<C-a>'] = cmp.mapping.abort(), -- Abort completion
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
          { name = 'luasnip' },
        },
        formatting = {
          format = function(entry, vim_item)
            return vim_item -- Customize appearance of completion items
          end,
        },
      })

      -- Additional configuration for command-line completion
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'cmdline' },
        }, {
          { name = 'path' },
        }),
      })
    end,
  },

  -- Add other plugins and configurations as needed
}
