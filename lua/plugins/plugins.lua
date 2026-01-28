return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3",
		build = "make install_jsregexp"
	},
	{
	"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.config")

      configs.setup({
          ensure_installed = {"lua", "vim", "vimdoc", "query", "javascript", "html", "bash", "yaml"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
	},
}
