local cmp = require("cmp")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- Scroll Documentation down
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- Scroll Documentation up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- Trigger the autocompletion
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Abort Autocompletion
        ["<C-e"] = cmp.mapping.abort(),
        -- Accept currently selected item
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Use [Tab] to select next item
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
        -- Use [Ctrl + Tab] to select previous item
        ["<C-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, {"i", "s"}),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "path" },
        -- { name = "buffer" },
        -- { name = "copilot" },
    })
})


