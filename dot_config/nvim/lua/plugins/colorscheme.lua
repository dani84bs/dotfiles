return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      dim_inactive = false,
      transparent_mode = false,
      contrast = "hard",
    },
  },

  -- configure catpuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
    },
  },

  -- Configure LazyVim to load desired colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
