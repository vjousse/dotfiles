return {
  "mikesmithgh/kitty-scrollback.nvim",
  enabled = true,
  lazy = true,
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  event = { "User KittyScrollbackLaunch" },
  config = function()
    require("kitty-scrollback").setup({
      -- builtin configuration override
      ksb_builtin_get_text_all = {
        kitty_get_text = {
          ansi = false,
        },
      },
    })
  end,
}
