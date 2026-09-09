return {
	{
		"julianolf/nvim-dap-lldb",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")

			dap.adapters.codelldb = {
				type = "executable",
				command = "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
			}

			dap.configurations.cpp = {
				{
					name = "Launch debugger",
					type = "codelldb",
					request = "launch",
					cwd = "${workspaceFolder}",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					stopOnEntry = false,
					args = function()
						local args_str = vim.fn.input("Arguments: ")
						return vim.split(args_str, " +")
					end,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
      vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint() end)
      vim.keymap.set("n", "<leader>dx", function() dap.terminate() end)

      vim.keymap.set("n", "<F5>", function() dap.continue() end)
      vim.keymap.set("n", "<F10>", function() dap.step_over() end)
      vim.keymap.set("n", "<F11>", function() dap.step_into() end)
      vim.keymap.set("n", "<F12>", function() dap.step_out() end)
		end,
	},
}
