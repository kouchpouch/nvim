return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ":TSUpdate",
        init = function()
            require("nvim-treesitter").uninstall {
				"csv",
				"printf",
			}

            -- auto-start highlights & indentation
            vim.api.nvim_create_autocmd("FileType", {
                desc = "User: enable treesitter highlighting",
                callback = function(ctx)
                    -- highlights
                    local hasStarted = pcall(vim.treesitter.start)

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
