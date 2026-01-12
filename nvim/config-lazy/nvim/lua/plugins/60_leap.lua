return {
    "ggandor/leap.nvim"
--[[
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
--]]
--[[
		config = function(_, opts)
			--require("leap").add_default_mappings(true)
			vim.keymap.set("n", "s", function()
				local current_window = vim.fn.win_getid()
				require("leap").leap({ target_windows = { current_window } })
			end)
			vim.keymap.set({ "o", "x" }, "S", "<Plug>(leap-backward-till)")
			vim.keymap.set({ "o", "x" }, "s", "<Plug>(leap-forward-till)")
		end,
--]]
}
