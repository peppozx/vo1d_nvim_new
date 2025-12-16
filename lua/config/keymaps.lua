local M = {}

function M.setup()
	vim.keymap.set('n', '<leader>w', ':w<CR>')
	vim.keymap.set('n', '<leader>q', ':q<CR>')

    -- Lazy plugin keymaps
    vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy" })
    vim.keymap.set("n", "<leader>li", ":Lazy install<CR>", { desc = "Lazy Install" })
    vim.keymap.set("n", "<leader>lu", ":Lazy update<CR>", { desc = "Lazy Update" })
    vim.keymap.set("n", "<leader>ls", ":Lazy sync<CR>", { desc = "Lazy Sync" })
    vim.keymap.set("n", "<leader>lc", ":Lazy clean<CR>", { desc = "Lazy Clean" })
    vim.keymap.set("n", "<leader>lh", ":Lazy home<CR>", { desc = "Lazy Home" })
    vim.keymap.set("n", "<leader>ll", ":Lazy log<CR>", { desc = "Lazy Log" })
    vim.keymap.set("n", "<leader>lr", ":Lazy restore<CR>", { desc = "Lazy Restore" })
    vim.keymap.set("n", "<leader>lp", ":Lazy profile<CR>", { desc = "Lazy Profile" })

	vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })

	local telescope = require('telescope.builtin')

	vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "Find files" })
	vim.keymap.set('n', '<leader>fa', function()
        telescope.find_files({ hidden = true, no_ignore = true }) -- Show all files, including hidden
    end, { desc = "Find all files" })
	vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "Live grep" })
	vim.keymap.set('n', '<leader>fw', telescope.grep_string, { desc = "Grep current word" })
	vim.keymap.set('n', '<leader>sb', telescope.current_buffer_fuzzy_find, { desc = "Fuzzy find" })

	-- Buffer navigation
    vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = "Previous buffer" })
    vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = "Next buffer" })
    vim.keymap.set('n', '<S-A-h>', ':BufferLineMovePrev<CR>', { desc = "Move buffer left" })
    vim.keymap.set('n', '<S-A-l>', ':BufferLineMoveNext<CR>', { desc = "Move buffer right" })

	vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = '[L]azy [G]it' })

	vim.keymap.set('n', '<leader>t', ':Telescope<CR>', { desc = "Telescope" })

	vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
	vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

	vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = "New buffer" })
end

return M
