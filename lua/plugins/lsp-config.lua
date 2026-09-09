return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "cmake", "rust_analyzer", "pyright", "zls", "jsonls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("luals", {
				capabilities = capabilities,
			})
			vim.lsp.enable("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lsp", "cmake", {
				capabilities = capabilities,
			})
			vim.lsp.enable("rust_analyzer", {
				capabilities = capabilities,
			})
			vim.lsp.enable("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.enable("zls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("jsonls", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set({ "n", "v" }, "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set({ "n", "v" }, "<leader>cr", vim.lsp.buf.rename)
		end,
	},
}
