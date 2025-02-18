return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = "ascii-image-converter -W 90 -C -b ~/Documents/mon.png",
            height = 16,
            width = 90,
            hl = "header",
            indent = -20,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
