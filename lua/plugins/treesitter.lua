return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"luadoc",
				"c",
				"cpp",
				"swift",
				"rust",
				"python",
				"bash",
				"llvm",
				"mlir",
				"tablegen",
				"cmake",
				"ninja",
				"html",
				"markdown",
				"vim",
				"vimdoc",
				"diff",
				"latex",
				"json",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
