local M = {}

function M.setup()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            -- Confirm selection
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            -- Navigation
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            -- Scroll docs
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            -- Toggle completion
            ['<C-Space>'] = cmp.mapping.complete(),
            -- Close completion window
            ['<C-e>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        }),
        formatting = {
            format = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snip]",
                    buffer = "[Buf]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end
        },
    })
end

return M
