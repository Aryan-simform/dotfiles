-- lua/plugins/dashboard.lua
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[

	  ██████╗ ███╗   ██╗███████╗    ██████╗ ██╗███████╗ ██████╗███████╗
	 ██╔═══██╗████╗  ██║██╔════╝    ██╔══██╗██║██╔════╝██╔════╝██╔════╝
	 ██║   ██║██╔██╗ ██║█████╗      ██████╔╝██║█████╗  ██║     █████╗
	 ██║   ██║██║╚██╗██║██╔══╝      ██╔═══╝ ██║██╔══╝  ██║     ██╔══╝
	 ╚██████╔╝██║ ╚████║███████╗    ██║     ██║███████╗╚██████╗███████╗
	  ╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚═╝     ╚═╝╚══════╝ ╚═════╝╚══════╝
			I'm gonna be King of the Pirates!

]],
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
         -- { section = "keys",   gap = 1, padding = 1 },
         -- { section = "recent_files", padding = 1 },
          {
            -- One Piece quote that rotates based on the day
            section = "terminal",
            cmd = [[echo "$(date +'%A') — \"$(echo -e 'Inherited the will of the D.\nNothing happened.\nWhoever has the most fun wins!\nI am not gonna run away. I never go back on my word!' | shuf -n1)\""]],
            height = 1,
            padding = 1,
          },
          { section = "startup" },
        },
      },
    },
  },
}
