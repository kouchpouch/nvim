return {
	{ "miikanissi/modus-themes.nvim" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{ "Mofiqul/vscode.nvim" },
    {
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		config = function()
			vim.cmd("colorscheme nightfly")
		end
	},
}
