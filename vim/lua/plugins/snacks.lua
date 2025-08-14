return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = "ascii-image-converter -W 60 -C -b ~/Documents/cap.png",
            height = 16,
            width = 90,
            hl = "header",
            -- indent = -20,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
