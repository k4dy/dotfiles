return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  priority = 100,
  init = function()
    vim.g.tmux_navigator_no_mappings = false
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "i", "t" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "i", "t" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "i", "t" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "i", "t" } },
  },
}
