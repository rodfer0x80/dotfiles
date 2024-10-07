vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "Y", ":m 'yg$")
vim.keymap.set("n", "J", ":m '>mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzz")
vim.keymap.set("n", "N", "Nzzz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_create_user_command("RunAmmonite", function()
  local current_file = vim.fn.expand("%:p")
  vim.cmd("Dispatch amm " .. current_file)
end, {})

vim.api.nvim_create_user_command("RunBash", function()
  local current_file = vim.fn.expand("%:p")
  vim.cmd("Dispatch bash " .. current_file)
end, {})

vim.api.nvim_create_user_command("RunShell", function()
  local current_file = vim.fn.expand("%:p")
  vim.cmd("Dispatch sh " .. current_file)
end, {})

vim.api.nvim_create_user_command("RunRscript", function()
  local current_file = vim.fn.expand("%:p")
  vim.cmd("Dispatch Rscript " .. current_file)
end, {})
