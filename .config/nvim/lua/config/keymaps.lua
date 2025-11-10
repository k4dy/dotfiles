-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal mode: Exit to normal mode with ESC
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable LazyVim's default git keybindings under <leader>g
-- We're moving all git commands to <leader>gg submenu
pcall(vim.keymap.del, "n", "<leader>gL") -- Git Log (cwd)
pcall(vim.keymap.del, "n", "<leader>gl") -- Git Log
pcall(vim.keymap.del, "n", "<leader>gf") -- Git Current File History (will be replaced with Go Forward)
pcall(vim.keymap.del, "n", "<leader>gb") -- Git Blame Line (will be replaced with Go Back)
pcall(vim.keymap.del, "n", "<leader>gs") -- Git Status (if exists)
pcall(vim.keymap.del, "n", "<leader>gc") -- Git Commits (if exists)
pcall(vim.keymap.del, "n", "<leader>gB") -- Git Browse (open)
pcall(vim.keymap.del, "x", "<leader>gB") -- Git Browse (open) visual mode
pcall(vim.keymap.del, "n", "<leader>gY") -- Git Browse (copy)
pcall(vim.keymap.del, "x", "<leader>gY") -- Git Browse (copy) visual mode
pcall(vim.keymap.del, "n", "<leader>gp") -- GitHub Pull Requests (open)
pcall(vim.keymap.del, "n", "<leader>gP") -- GitHub Pull Requests (all)

-- Git commands under <leader>gg (submenu)
-- Note: The which-key labels are set in lua/plugins/which-key.lua
vim.keymap.set("n", "<leader>ggl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>ggL", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log (root)" })
vim.keymap.set("n", "<leader>ggf", function() Snacks.picker.git_log_file() end, { desc = "Git File History" })
vim.keymap.set("n", "<leader>ggb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>ggs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gga", "<cmd>!git add %<cr>", { desc = "Git Add (current file)" })
vim.keymap.set("n", "<leader>ggA", "<cmd>!git add .<cr>", { desc = "Git Add (all)" })
vim.keymap.set("n", "<leader>ggc", "<cmd>!git commit<cr>", { desc = "Git Commit" })
vim.keymap.set("n", "<leader>ggp", "<cmd>!git push<cr>", { desc = "Git Push" })
vim.keymap.set("n", "<leader>ggP", "<cmd>!git pull<cr>", { desc = "Git Pull" })

-- Goto commands under <leader>g
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Goto References" })
vim.keymap.set("n", "<leader>gb", "<C-o>", { desc = "Go Back" })
vim.keymap.set("n", "<leader>gf", "<C-i>", { desc = "Go Forward" })

-- Buffer commands
-- Jump to buffer by number
vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to Buffer 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to Buffer 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to Buffer 3" })
vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to Buffer 4" })
vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to Buffer 5" })

-- Navigate buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- Close buffer
vim.keymap.set("n", "<leader>bx", function()
  vim.cmd("bdelete!")  -- Force close buffer without confirmation
  vim.cmd("close")      -- Close window
end, { desc = "Close buffer and window" })
