return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.swiftformat,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
		vim.keymap.set("v", "<leader>gf", function()
			local start_pos = vim.fn.getpos("'<")
			local end_pos = vim.fn.getpos("'>")

			vim.lsp.buf.format({
				range = {
					["start"] = { start_pos[2], 0 },
					["end"] = { end_pos[2], 0 },
				},
			})
		end)
	end,
}
