local M = {}

function M.setup()
    -- Additional keymaps or configurations if needed
    vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { desc = "Copilot panel" })
    vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { desc = "Copilot enable" })
    vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = "Copilot disable" })
    vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = "Copilot status" })
end

return M
