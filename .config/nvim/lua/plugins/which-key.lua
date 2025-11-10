-- Override LazyVim's default which-key configuration
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>g", group = "goto" },    -- Main menu label
      { "<leader>gg", group = "git" },    -- Git submenu label
      { "<leader>r", group = "run" },     -- Run menu label
      { "<leader>b", group = "buffer" },  -- Buffer menu label
    },
  },
}
