return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    ft = { 'scala', 'java', 'py', 'sc' },
}
