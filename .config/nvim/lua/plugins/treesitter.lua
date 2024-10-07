return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    ft = { 'scala', 'java' },  -- Load only for Scala and Java files
}
