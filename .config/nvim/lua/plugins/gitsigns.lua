-- Disable gitsigns default keybindings under <leader>g
-- We're managing git commands manually under <leader>gg
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      -- Disable all default gitsigns keybindings
      -- This prevents them from showing up in the <leader>g menu
    end,
  },
}
