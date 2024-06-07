return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = function(...)
            require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
