return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Disable default LazyVim keymaps you don't want
    { "<leader><space>", false },
    { "<leader>ff", false },
    { "<leader>fF", false },

    -- File finding
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find Files (hidden/ignored)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },

    -- Text/Grep searching
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep (Live)" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word (under cursor)" },

    -- Buffers and UI
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
    { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Find Registers" },
    { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Find Jumplist" },

    -- Code navigation
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find Symbols (Document)" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Find Symbols (Workspace)" },
    { "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Find Diagnostics (Document)" },
    { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Find Diagnostics (Workspace)" },
    { "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Find Treesitter Symbols" },

    -- Git
    { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Find Git Commits" },
    { "<leader>fC", "<cmd>Telescope git_bcommits<cr>", desc = "Find Git Commits (Buffer)" },
    { "<leader>fB", "<cmd>Telescope git_branches<cr>", desc = "Find Git Branches" },
    { "<leader>fG", "<cmd>Telescope git_status<cr>", desc = "Find Git Status" },

    -- Vim/Neovim
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
    { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Find Vim Options" },
    { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Find Highlights" },
    { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Find Autocommands" },

    -- Misc
    { "<leader>f:", "<cmd>Telescope command_history<cr>", desc = "Find Command History" },
    { "<leader>f/", "<cmd>Telescope search_history<cr>", desc = "Find Search History" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Find Quickfix" },
    { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Find Location List" },
  },
  opts = {
    defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = "➤ ",
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
    },
  },
}
