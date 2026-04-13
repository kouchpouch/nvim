return {
	"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"L3MON4D3/LuaSnip",
			"j-hui/fidget.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
		},

    config = function()
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup{
			ensure_installed = {
				"lua_ls",
				"clangd",
				"hyprls",
				"bashls",
				"pylsp",
				"vimls",
				"neocmake",
				"docker_compose_language_service",
			},
		}

	-- Set up nvim-cmp.
	local cmp = require'cmp'

	cmp.setup({
	snippet = {
		expand = function(args)
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

	end,
	},
	window = {
	  -- completion = cmp.config.window.bordered(),
	  -- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),

	-- Accept currently selected item. Set `select` to `false` to only confirm 
	-- explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  { name = 'luasnip' }, -- For luasnip users.
	}, {
	  { name = 'buffer' },
	})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
	})

--	vim.lsp.config('<YOUR_LSP_SERVER>', {
--	capabilities = require('cmp_nvim_lsp').default_capabilities()
--	})
--	vim.lsp.enable('<YOUR_LSP_SERVER>')
	end
}
