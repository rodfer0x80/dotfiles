return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,  
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "scala", "java", "python", "c", "cpp", "haskell" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
}
