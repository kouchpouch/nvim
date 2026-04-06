return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3",
		build = "make install_jsregexp"
	},

-- NEOVIM < 12
--	{
--	 'nvim-treesitter/nvim-treesitter',
--	 lazy = false,
--	 build = ':TSUpdate'
--	},
--	{
--		"nvim-treesitter/nvim-treesitter",
--		build = ":TSUpdate",
--		lazy = false,
--		branch = 'master',
--		config = function ()
--		 local configs = require("nvim-treesitter.configs")
--
--		 configs.setup({
--			 ensure_installed = {"lua", 
--								 "vim", 
--								 "vimdoc", 
--								 "query", 
--								 "javascript", 
--								 "html", 
--								 "bash", 
--								 "yaml"},
--			 sync_install = false,
--			 highlight = { enable = true },
--			 indent = { enable = true },
--			})
--		end
--	},

--	NEOVIM >= 12
-- ON FIRST LAUNCH RUN: :Lazy update nvim-treesitter
--						:TSUninstall all
--						:TSInstall all

    {
        'nvim-treesitter/nvim-treesitter',
		branch = "main",
        lazy = false,
        build = ":TSUpdate",
        init = function()

--            require("nvim-treesitter").install {
--                "python",
--                "go",
--                "c",
--                "lua",
--                "vim",
--                "vimdoc",
--                "query",
--                "markdown_inline",
--                "markdown",
--			}

            -- auto-start highlights & indentation
            vim.api.nvim_create_autocmd("FileType", {
                desc = "User: enable treesitter highlighting",
                callback = function(ctx)
                    -- highlights
                    local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

                    -- indent
                    local noIndent = {}
                    if hasStarted and not vim.list_contains(noIndent, ctx.match) then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end
    },
}
