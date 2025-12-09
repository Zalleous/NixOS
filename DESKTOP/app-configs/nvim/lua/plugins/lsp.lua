return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
	nil_ls = { mason = false }, 
        lua_ls = { mason = false },
      },
    },
  },
}
